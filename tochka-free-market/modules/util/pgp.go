package util

import (
	"bytes"
	"encoding/hex"
	"errors"
	"fmt"
	"strings"

	"golang.org/x/crypto/openpgp"
	"golang.org/x/crypto/openpgp/armor"
	"golang.org/x/crypto/openpgp/clearsign"

	_ "golang.org/x/crypto/bcrypt"
	_ "golang.org/x/crypto/blowfish"
	_ "golang.org/x/crypto/md4"
	_ "golang.org/x/crypto/ripemd160"
	_ "golang.org/x/crypto/scrypt"
	_ "golang.org/x/crypto/sha3"
)

func ValidatePGPPublicKey(key string) error {
	fromBlock, err := armor.Decode(strings.NewReader(key))
	if err != nil || fromBlock.Type != openpgp.PublicKeyType {
		return errors.New("Invalid PGP Key")
	}
	return nil
}

func Fingerprint(publicKey string) string {

	entitylist, err := openpgp.ReadArmoredKeyRing(bytes.NewBufferString(publicKey))
	if err != nil {
		return ""
	}

	fingerprint := hex.EncodeToString(entitylist[0].PrimaryKey.Fingerprint[:])
	return strings.ToUpper(fingerprint)
}

func EncryptText(encryptionText, publicKey string) (string, error) {

	entitylist, err := openpgp.ReadArmoredKeyRing(bytes.NewBufferString(publicKey))
	if err != nil {
		return "", err
	}

	encbuf := bytes.NewBuffer(nil)
	w, err := armor.Encode(encbuf, "PGP MESSAGE", nil)
	if err != nil {
		return "", err
	}

	plaintext, err := openpgp.Encrypt(w, entitylist, nil, nil, nil)
	if err != nil {
		return "", err
	}

	message := []byte(encryptionText)
	_, err = plaintext.Write(message)

	plaintext.Close()
	w.Close()

	return fmt.Sprintf("%s", encbuf), nil
}

func CheckSignature(encryptedMessage, secretText, publicKey string) (bool, error) {

	keyring, err := openpgp.ReadArmoredKeyRing(strings.NewReader(publicKey))
	if err != nil {
		return false, err
	}

	_, err = armor.Decode(strings.NewReader(encryptedMessage))
	if err != nil {
		return false, err
	}

	block, _ := clearsign.Decode([]byte(encryptedMessage))
	if block == nil {
		return false, errors.New("Failed to decode message")
	}
	signed := bytes.NewReader(block.Bytes)
	signature := block.ArmoredSignature.Body
	decryptedSecret := strings.Trim(string(block.Plaintext), "\n ")

	if decryptedSecret != secretText {
		return false, errors.New("Secret text does not match")
	}

	signer, err := openpgp.CheckDetachedSignature(keyring, signed, signature)
	if err != nil {
		return false, err
	}

	return signer.PrimaryKey.Fingerprint == keyring[0].PrimaryKey.Fingerprint, nil
}
