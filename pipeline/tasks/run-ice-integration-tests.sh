#!/bin/bash
set -e
set -x
BASE_PATH=$(cd $(dirname $BASH_SOURCE)/../..; pwd)
source $BASE_PATH/pipeline/tasks/utils.sh

cd ice/

# Python dependencies
pip install -r dev-requirements.txt

# Start Docker
start_local_docker
ping_local_docker

# Run tests
./hack/run-tests -i
