package util

import (
	"bytes"
	"encoding/json"
	"errors"
	"io/ioutil"
	"net/http"
	"net/url"
	"strconv"

	"golang.org/x/net/proxy"

	"qxklmrhx7qkzais6.onion/Tochka/tochka-free-market/modules/settings"
)

var (
	APPLICATION_SETTINGS = settings.GetSettings()
	httpTransport        = &http.Transport{}
	httpClient           = &http.Client{Transport: httpTransport}
	proxyAddr            = "127.0.0.1:9050"
)

func init() {
	dialer, err := proxy.SOCKS5("tcp", proxyAddr, nil, proxy.Direct)
	if err != nil {
		panic(err)
	}
	httpTransport.Dial = dialer.Dial
}

func TorGET(url string) (string, error) {

	req, err := http.NewRequest("GET", url, nil)
	if err != nil {
		return "", err
	}

	resp, err := httpClient.Do(req)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()
	bm, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	return string(bm), nil
}

func DirectGET(url string) (string, error) {

	resp, err := http.Get(url)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()
	bm, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	if resp.StatusCode != 200 {
		return "", errors.New(string(bm))
	}

	return string(bm), nil
}

func DirectPOST(url string, params url.Values) (string, error) {

	println("[HTTP POST]", url, params.Encode())

	resp, err := http.Post(
		url,
		"application/x-www-form-urlencoded",
		bytes.NewBufferString(params.Encode()),
	)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()
	bm, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	if resp.StatusCode != 200 {
		return "", errors.New(string(bm))
	}

	return string(bm), nil
}

func TorPOST(url string, params url.Values) (string, error) {

	req, err := http.NewRequest("POST", url, bytes.NewBufferString(params.Encode()))
	if err != nil {
		return "", err
	}

	req.Header.Add("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Add("Content-Length", strconv.Itoa(len(params.Encode())))
	resp, err := httpClient.Do(req)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()
	bm, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	return string(bm), nil
}

func TorRawPOST(url string, params string) (string, error) {
	req, err := http.NewRequest("POST", url, bytes.NewBufferString(params))
	if err != nil {
		return "", err
	}

	req.Header.Add("Content-Type", "application/x-www-form-urlencoded")
	req.Header.Add("Content-Length", strconv.Itoa(len(params)))
	resp, err := httpClient.Do(req)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()
	bm, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	return string(bm), nil
}

func TorJSONPOST(url string, data interface{}) (string, error) {

	b := new(bytes.Buffer)
	json.NewEncoder(b).Encode(data)

	req, err := http.NewRequest("POST", url, b)
	if err != nil {
		return "", err
	}

	req.Header.Add("Content-Type", "application/json")
	req.Header.Add("Content-Length", strconv.Itoa(b.Len()))
	resp, err := httpClient.Do(req)
	if err != nil {
		return "", err
	}

	defer resp.Body.Close()
	bm, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	return string(bm), nil
}
