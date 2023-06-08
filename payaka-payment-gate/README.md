# Payaka Payment Gate

Payaka is Payment Gate solution for Tochka Free Market

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

* golang
* nodejs 
* git
* Postgres 
* tor / torsocks
* geth

### Supported Cryptocurrencies

* Bitcoin (BTC)
* Bitcoin Cash (BCH)
* Ethereum

### Installing

To get Payaka running:
```
# 1. Get Payaka source code
torsocks go get -insecure qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate
# 2. Build Tochka from source
cd $GOPATH/src/qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate
go build
# 3. Edit settings
cp settings.json.example settings.json
vi settings.json
# 4. Sync DB models and supplementary data
PAYAKA_DEBUG=1 ./payaka-payment-gate sync
# 5. Install nodejs deps
cd nodejs && npm install
# 5. Run HTTP server
PAYAKA_DEBUG=1 ./payaka-payment-gate
```

### REST API Descriptions

To be added

## License
 
The MIT License (MIT)

Copyright (c) 2015 Chris Kibble

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
