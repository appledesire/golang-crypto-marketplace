package marketplace

import (
	"testing"
)

func TestGetAllCategories(t *testing.T) {
	categories := GetAllCategories()
	if len(categories) == 0 {
		t.Error("Expected > 0 categories got ", len(categories))
	}
}

func TestCacheGetCategories(t *testing.T) {
	categories := CacheGetCategories("mail", "", "", 0)
	if len(categories) == 0 {
		t.Error("Expected > 0 categories got ", len(categories))
	}
}
