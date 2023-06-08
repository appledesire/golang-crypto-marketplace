package marketplace

import (
	"testing"
)

func TestFindAllActiveAdvertisings(t *testing.T) {
	advertisings := FindAllActiveAdvertisings()
	if len(advertisings) == 0 {
		t.Error("Expected >0 advertisings, got ", len(advertisings))
	}
}

func TestGetAdvertisings(t *testing.T) {
	advertisings := GetAdvertisings(10)

	if len(advertisings) == 0 {
		t.Error("Expected >0 advertisings, got ", len(advertisings))
	}

	for _, a := range advertisings {
		if a.Item.Uuid == "" {
			t.Error("Got empty item, advertising uuid ", a.Uuid)
		}

		if a.Item.Store.Uuid == "" {
			t.Error("Got empty store, advertising uuid ", a.Uuid)
		}
	}
}
