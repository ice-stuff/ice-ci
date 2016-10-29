#!/bin/bash
set -e
set -x
BASE_PATH=$(cd $(dirname $BASH_SOURCE)/../..; pwd)
source $BASE_PATH/pipeline/tasks/utils.sh

# Move to GOPATH
mkdir -p $GOPATH/src/github.com/ice-stuff
cp -r clique $GOPATH/src/github.com/ice-stuff/clique
cd $GOPATH/src/github.com/ice-stuff/clique/

# Golang dependencies
go get github.com/Masterminds/glide
make deps
go get github.com/onsi/ginkgo/ginkgo

# Build ant test
make go-vet
make test
