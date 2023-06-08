package marketplace

import (
	"net/http"

	"github.com/gocraft/web"
)

// PrivateStoreMiddleware controls access rights to store
func (c *Context) PrivateStoreMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {

	store, _ := FindStoreByStorename(r.PathParams["store"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	viewStore := store.ViewStore(c.ViewUser.Language)
	c.ViewStore = &viewStore

	c.CanEdit = store.UserIsAdministration(c.ViewUser.Uuid) || c.ViewUser.IsAdmin || c.ViewUser.IsStaff
	if !c.CanEdit {
		http.NotFound(w, r.Request)
		return
	}

	next(w, r)
}

// PrivateStoreItemMiddleware controls access rights to item editing
func (c *Context) PrivateStoreItemMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {

	if r.PathParams["item"] != "" && r.PathParams["item"] != "new" {
		item, _ := FindItemByUuid(r.PathParams["item"])

		// if item not found
		if item == nil {
			http.NotFound(w, r.Request)
			return
		}

		// if item does not belong to user's store
		if !item.Store.UserIsAdministration(c.ViewUser.Uuid) && !c.CanEdit {
			http.NotFound(w, r.Request)
			return
		}

		viewItem := item.ViewItem(c.ViewUser.Language)
		c.ViewItem = &viewItem
	} else {
		item := Item{}
		viewItem := item.ViewItem(c.ViewUser.Language)
		c.ViewItem = &viewItem
	}

	next(w, r)
}

// SellerItemPackageMiddleware controls access rights to item package editing
func (c *Context) PrivateStoreItemPackageMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	if r.PathParams["package"] != "" && r.PathParams["package"] != "new" {
		itemPackage, _ := FindPackageByUuid(r.PathParams["package"])
		if itemPackage == nil {
			http.NotFound(w, r.Request)
			return
		}

		if itemPackage.ItemUuid != c.ViewItem.Uuid {
			http.NotFound(w, r.Request)
			return
		}

		c.ViewPackage = itemPackage.ViewPackage()
	}

	next(w, r)
}

// PublicStoreMiddleware populates all views and relations to display a store
func (c *Context) PublicStoreMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	store, _ := FindStoreByStorename(r.PathParams["store"])
	if store == nil {
		http.NotFound(w, r.Request)
		return
	}

	// Warnings
	// TODO: Add to Preload
	warnings := FindStoreWarningsForStore(store.Uuid)
	for _, w := range warnings {
		if !w.HasExpired() && !w.IsApproved {
			store.Warnings = append(store.Warnings, w)
		}
	}
	c.ViewStoreWarnings = warnings.ViewStoreWarnings(c.ViewUser.Language)

	// Items
	c.ViewItems = store.Items.ViewItems(c.ViewUser.Language)

	// View Model
	viewStore := store.ViewStore(c.ViewUser.Language)
	c.ViewStore = &viewStore

	// Editing rights
	c.CanEdit = store.UserIsAdministration(c.ViewUser.Uuid) || c.ViewUser.IsAdmin || c.ViewUser.IsStaff

	next(w, r)
}

// VendorItemMiddleware populates all views and relations to display an item
func (c *Context) PublicStoreItemMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	item, _ := FindItemByUuid(r.PathParams["item"])
	if item == nil {
		http.NotFound(w, r.Request)
		return
	}

	if item.StoreUuid != c.ViewStore.Uuid {
		http.NotFound(w, r.Request)
		return
	}

	viewItem := item.ViewItem(c.ViewUser.Language)
	c.ViewItem = &viewItem

	next(w, r)
}
