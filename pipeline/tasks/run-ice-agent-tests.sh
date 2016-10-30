#!/bin/bash
set -e
set -x
BUILD_DIR=$(pwd)

# Move to GOPATH
mkdir -p $GOPATH/src/github.com/ice-stuff
cp -r ice-agent $GOPATH/src/github.com/ice-stuff
cd $GOPATH/src/github.com/ice-stuff/ice-agent/

# Golang dependencies
go get github.com/Masterminds/glide
make deps

# Metalinter
go get -u github.com/alecthomas/gometalinter
gometalinter --install

# Linting
make lint

# Testing
./hack/run-tests -n
HOME=/home/ice ./hack/run-tests -i -n
