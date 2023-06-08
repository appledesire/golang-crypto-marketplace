package marketplace

import (
	"testing"
)

func TestFindUnreviewedItems(t *testing.T) {
	unreviewedItems := FindUnreviewedItems(0, 100)
	if len(unreviewedItems) == 0 {
		t.Error("Expected > 0 unreviewedItems got ", len(unreviewedItems))
	}
}
