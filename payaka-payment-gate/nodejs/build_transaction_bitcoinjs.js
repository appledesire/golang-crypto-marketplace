var bitcoin = require('./node_modules/bitcoinjs-lib');
var argv    = require('optimist').argv;


function buildTransaction(utxosets, outs, fee) {
	var tx = new bitcoin.TransactionBuilder();
	for (var i = 0; i < utxosets.length; i++){
		for (var j = 0; j < utxosets[i].utxo.length; j++){
			tx.addInput(utxosets[i].utxo[j].txid, utxosets[i].utxo[j].vout);
		}
	}
	for(var i = 0; i < outs.length; i++){
		tx.addOutput(outs[i].address, outs[i].satoshis);
	}
	for (var i = 0; i < utxosets.length; i++){
		var keyPair = bitcoin.ECPair.fromWIF(utxosets[i].private_key);
		for(var j = 0; j < utxosets[i].utxo.length; j++){
			tx.sign(utxosets[i].utxo.length*i+j, keyPair)
		}
	}
	return tx.build();
}

function hexToBytes(hexString) {
   var result = [];
   while (hexString.length >= 2) { 
       result.push(parseInt(hexString.substring(0, 2), 16));
       hexString = hexString.substring(2, hexString.length);
   }
   return result;
}

function estimateFee(rawTransaction, feePerByte) {
	return feePerByte * hexToBytes(rawTransaction).length;
}

function explainFee(utxosets, rawTransaction, feePerByte){
	var utxoLength = 0;
	for (var i = 0; i < utxosets.length; i++){
		utxoLength += utxosets[i].utxo.length;
	}
	return "Number of unspent inputs: " + utxoLength + "; Transaction size (bytes): " + hexToBytes(rawTransaction.toHex()).length + "; Fee per byte: " + feePerByte; 

}

// parse commandline inputs
var utxosets   = JSON.parse(new Buffer.from(argv.utxos, "base64").toString("ascii"));
var outs       = JSON.parse(new Buffer.from(argv.outs, "base64").toString("ascii"));
var feePerByte = argv.feePerByte;
var feeOutput  = argv.feeOutput || 0; 
var feeOnly    = argv.feeOnly == "true"; 

// estimate fee
var rawTransaction = buildTransaction(utxosets, outs);
var fee            = estimateFee(rawTransaction.toHex(), feePerByte);
var result         = {};

if (feeOnly) {
	result = {
		fee: fee,
		description: explainFee(utxosets, rawTransaction, feePerByte),
		rawTransaction: rawTransaction.toHex()
	}
} else {
	if (fee >= outs[feeOutput].satoshis) {
		result.error =  "Fee is greater than tx rem:" + fee + "; output: " + outs[feeOutput].satoshis;
	} else {
		outs[feeOutput].satoshis = outs[feeOutput].satoshis - fee;
		rawTransaction = buildTransaction(utxosets, outs);
		var result = {
			fee: fee,
			hash: rawTransaction.getHash().toString('hex'),
			rawTransaction: rawTransaction.toHex(),
			outputs: outs,
			description: explainFee(utxosets, rawTransaction, feePerByte) 
		}
	}
}

console.log(JSON.stringify(result));
