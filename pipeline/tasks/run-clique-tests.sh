#!/bin/bash
set -e
set -x

# Move to GOPATH
mkdir -p $GOPATH/src/github.com/ice-stuff
cp -r clique $GOPATH/src/github.com/ice-stuff
cd $GOPATH/src/github.com/ice-stuff/clique/

# Golang dependencies
go get github.com/Masterminds/glide
make deps
go get github.com/onsi/ginkgo/ginkgo

# Build ant test
make go-vet
make test
