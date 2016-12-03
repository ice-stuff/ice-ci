#!/bin/bash

cd dissertation/
make dist

version=$(cat ../dissertation-version/version)
mv ./build/thesis.pdf ../dissertation-pdf/thesis-$version.pdf
