package marketplace

import (
	"net/http"

	"github.com/gocraft/web"
)

// PackageMiddleware controls display permissions for package and populates views
func (c *Context) PackageMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	itemPackage, _ := FindPackageByUuid(r.PathParams["package"])
	if itemPackage == nil {
		http.NotFound(w, r.Request)
		return
	}
	c.ViewPackage = itemPackage.ViewPackage()

	// Some packages are only available for a single purchase
	// drops: coordinates could not be shared
	transaction := itemPackage.Transaction()
	if transaction == nil {
		http.NotFound(w, r.Request)
		return
	}

	// If wrong user tries to access a package, return 404
	if transaction.Buyer.Uuid != c.ViewUser.Uuid && !transaction.Store.UserIsAdministration(c.ViewUser.Uuid) && !c.ViewUser.IsAdmin && !c.ViewUser.IsStaff {
		http.NotFound(w, r.Request)
		return
	}

	viewTransaction := transaction.ViewTransaction()
	c.ViewTransaction = &viewTransaction

	next(w, r)
}
