package util

import (
	"crypto/sha256"
	"encoding/hex"
	"fmt"
)

func PasswordHashV1(username string, passphrase string) string {
	hash := sha256.New()
	hash.Write([]byte(fmt.Sprintf("%s%s", username, passphrase)))
	md := hash.Sum(nil)
	mdStr := hex.EncodeToString(md)
	return mdStr
}
