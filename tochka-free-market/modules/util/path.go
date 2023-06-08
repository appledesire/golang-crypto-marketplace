package util

import (
	"os"
	"path"
)

func GetFileAbsolutePath(relativePath string) string {
	projectDirectory, exists := os.LookupEnv("TOCHKA_HOME")
	if !exists {
		return relativePath
	}
	return path.Join(projectDirectory, relativePath)
}
