package btcqr

import (
	"bytes"
	"code.google.com/p/rsc/qr"
	"errors"
	"net/url"
	"strconv"
)

var (
	errNotImplemented = errors.New("not implemented yet") // unexported because it must be removed before v1 anyway

	// ErrNegativeAmount is returned when amount is negative
	ErrNegativeAmount = errors.New("amount can not be negative")
)

// Request to be encoded to QR code
type Request struct {
	// Config used to generate the QR code
	// When empty, DefaultConfig is used.
	Config *Config

	// Address to which the coins should be sent
	// The address is assumed to be a valid and correct bitcoin address
	Address string

	// Amount as float64 (optional)
	// When left empty (zero), it will not be encoded into the QR code
	Amount float64

	// Label for the address (optional)
	// When left emtpy, it will not be encoded into the QR code
	Label string

	// Optional message string to be shown to the sender
	Message string

	// Optional parameters to be encoded in the URI
	Params map[string]string
}

// GenerateQR generates a for the receiver *Request.
func (r *Request) GenerateQR() (*qr.Code, error) {
	// get config for this request
	c := r.Config
	if c == nil {
		c = DefaultConfig
	}

	var err error

	// uriBuf will contain the bytes that are to be encoded into the QR code
	uriBuf := &bytes.Buffer{}

	// write uri scheme
	_, err = uriBuf.WriteString(c.scheme())
	if err != nil {
		return nil, err
	}

	// write uri seperator colon
	err = uriBuf.WriteByte(':')
	if err != nil {
		return nil, err
	}

	// write receiving address
	_, err = uriBuf.WriteString(r.Address)
	if err != nil {
		return nil, err
	}

	// params contains optional parameters used in the URI
	var params = make(map[string]string)

	// add amount when not zero
	if r.Amount < 0 {
		return nil, ErrNegativeAmount
	}
	if r.Amount != 0 {
		params["amount"] = strconv.FormatFloat(r.Amount, 'f', -1, 64)
		if err != nil {
			return nil, err
		}
	}

	// add label when it is not empty
	if len(r.Label) != 0 {
		params["label"] = url.QueryEscape(r.Label)
	}

	// add message when it is not empty
	if len(r.Message) != 0 {
		params["message"] = url.QueryEscape(r.Message)
	}

	// add query escaped params (if any)
	if r.Params != nil {
		for key, value := range r.Params {
			params[url.QueryEscape(key)] = url.QueryEscape(value)
		}
	}

	// write all parameters to the uriBuf
	q := true
	for key, value := range params {
		// write '?' or '&' to uriBuf
		if q {
			q = false
			err = uriBuf.WriteByte('?')
			if err != nil {
				return nil, err
			}
		} else {
			err = uriBuf.WriteByte('&')
			if err != nil {
				return nil, err
			}
		}

		// write <key>=<value> to uriBuf
		_, err = uriBuf.WriteString(key)
		if err != nil {
			return nil, err
		}
		err = uriBuf.WriteByte('=')
		if err != nil {
			return nil, err
		}
		_, err = uriBuf.WriteString(value)
		if err != nil {
			return nil, err
		}
	}

	// create qr image
	code, err := qr.Encode(uriBuf.String(), qr.Level(c.Level))
	if err != nil {
		return nil, err
	}

	// all done
	return code, nil
}
