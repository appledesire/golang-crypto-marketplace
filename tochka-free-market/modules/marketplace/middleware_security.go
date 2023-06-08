package marketplace

import (
	"github.com/gocraft/web"
)

func (c *Context) SecurityHeadersMiddleware(w web.ResponseWriter, r *web.Request, next web.NextMiddlewareFunc) {
	w.Header().Add("X-Frame-Options", "SAMEORIGIN")
	w.Header().Add("Content-Security-Policy", "script-src 'self' 'unsafe-inline' 'unsafe-eval'; style-src 'self' 'unsafe-inline'; font-src 'self' data: ; default-src 'self'; frame-ancestors 'self'; disown-opener; form-action 'self'")
	w.Header().Add("X-Content-Type-Options", "nosniff")
	w.Header().Add("X-Xss-Protection", "1; mode=block")
	w.Header().Add("Referrer-Policy", "no-referrer")
	w.Header().Add("Pragma", "no-cache")

	// TODO: Add CSRF token verification
	// csrfToken := csrf.Token(r.Request)
	// w.Header().Add("X-CSRF-Token", csrfToken)
	// c.CSRFToken = csrfToken

	next(w, r)
}
