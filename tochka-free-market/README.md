# Tochka Free Market

## Project Description

Tochka Free Market is free open-source marketplace for DarkNet operations. Same-name DarkNet Market (DNM) [Tochka](http://tochka3evlj3sxdv.onion/) is running on it.

Goal of Tochka is to provide reliable software for next-gen darknet operations, while staying transparent, free and secure.

We would like more local players emerge using Tochka as platform of choice. 

## Technical Overview

Tochka is written on Golang programming language and can be run on wide range of operating systems. Postgres is database of choice and Tor is used to obfuscate server location. 

[Payaka](http://qxklmrhx7qkzais6.onion/Tochka/payaka-payment-gate) is a payment gate solution used in conjunction with Tochka.

Payaka supports:

* Bitcoin
* Bitcoin Cash
* Ethereum
* Tochka Smart Contracts (ICO, Split Payment) based on Ethereum.

Tochka provides script-less HTML interface that can be used in conjunction with Firefox/Tor Browser NoScript as well as a REST API for Tochka Mobile App.

Tochka Mobile App is a free open-source client for Tochka written for Android. It can be downloaded as compiled apk or in form of source-code for manual compilation. 

Tochka Mobile App is planned for release in Q1-Q2 2019.

We provide Docker scripts to get Tochka running fast.

### Installation from source code

To get Tochka running:

```
# 1. Get Tochka source code
torsocks go get -insecure qxklmrhx7qkzais6.onion/Tochka/tochka-free-market

# 2. Build Tochka from source
cd $GOPATH/src/qxklmrhx7qkzais6.onion/Tochka/tochka-free-market
go build

# 3. Sync DB models and supplementary data
su postgres
    createdb go_t
    psql go_t < dumps/cities.sql
    psql go_t < dumps/countries.sql 
exit
/tochka-free-market sync-models
/tochka-free-market sync-views

# 4. Edit settings
cp settings.json.example settings.json
vim settings.json

# 5. Run HTTP server
./tochka-free-market

```

Go to http://localhost:8081/ and register a new user. Add admin privelegies to new account:

```
./tochka-free-market user <username> grant admin
```

## License
 
The MIT License (MIT)

Copyright (c) 2015 Chris Kibble

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
