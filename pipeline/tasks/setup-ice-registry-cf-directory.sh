#!/bin/sh
set -e
set -x

# Clone iCE
cd ice-cf/
cp -r ../ice/* .

# Copy CF files
cp ../ice-registry-cf/manifest.yml .
cp ../ice-registry-cf/Procfile .
cp ../ice-registry-cf/main.py .
