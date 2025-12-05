#!/bin/bash

set -e

echo "Building Go Lambda function..."

# Build for Linux AMD64 architecture (statically linked for better Lambda compatibility)
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-s -w" -o bootstrap main.go

echo "Build complete. Binary created: bootstrap"

# Create deployment package
if [ -f function.zip ]; then
    rm function.zip
fi

zip function.zip bootstrap

echo "Deployment package created: function.zip"

