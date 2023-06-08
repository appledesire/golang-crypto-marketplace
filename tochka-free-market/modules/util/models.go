package util

import (
	"fmt"
	"github.com/nu7hatch/gouuid"
)

func GenerateUuid() string {
	uuid, _ := uuid.NewV4()
	uuidString := fmt.Sprintf("%x%x%x%x%x", uuid[0:4], uuid[4:6], uuid[6:8], uuid[8:10], uuid[10:])
	return uuidString
}
