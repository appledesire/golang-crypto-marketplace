package marketplace

import (
	"testing"
)

func TestSerpItems(t *testing.T) {
	serpItems := FindSerpItems()
	if len(serpItems) == 0 {
		t.Error("Expected > 0 serpItems got ", len(serpItems))
	}

	shippingFromList := serpItems.ShippingFromList()
	if len(shippingFromList) == 0 {
		t.Error("Expected > 0 shippingFromList got ", len(shippingFromList))
	}

	shippingToList := serpItems.ShippingToList()
	if len(shippingToList) == 0 {
		t.Error("Expected > 0 shippingFromList got ", len(shippingToList))
	}

	viewSerpItems := serpItems.ViewSerpItems("ru", "btc")
	if len(viewSerpItems) == 0 {
		t.Error("Expected > 0 viewSerpItems got ", len(viewSerpItems))
	}

	serpStores := serpItems.SerpStores()
	if len(serpStores) == 0 {
		t.Error("Expected > 0 serpStores got ", len(serpStores))
	}
}

func TestSerpCategories(t *testing.T) {
	serpCategories := CacheGetCategories("", "", "", 0)
	if len(serpCategories) == 0 {
		t.Error("Expected >0 serp categories, got ", len(serpCategories))
	}
}
