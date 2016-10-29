#!/bin/bash
set -e
set -x
BASE_PATH=$(cd $(dirname $BASH_SOURCE)/../..; pwd)
source $BASE_PATH/pipeline/tasks/utils.sh

cd clique/

# Golang dependencies
go get github.com/Masterminds/glide
make deps
go get github.com/onsi/ginkgo/ginkgo

# Build ant test
make go-vet
make test
