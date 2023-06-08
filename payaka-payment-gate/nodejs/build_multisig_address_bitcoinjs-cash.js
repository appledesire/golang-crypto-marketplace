var bitcoin = require('bitcoinjs-lib-cash');
var argv    = require('optimist').argv;

var pubKeys      = [argv.pk1, argv.pk2, argv.pk3].map(function (hex) { return new Buffer(hex, 'hex') });
var redeemScript = bitcoin.script.multisigOutput(2, pubKeys);
var scriptPubKey = bitcoin.script.scriptHashOutput(bitcoin.crypto.hash160(redeemScript));
var address      = bitcoin.address.fromOutputScript(scriptPubKey);

console.log(address);
