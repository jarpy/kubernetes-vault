#!/bin/sh

VERSION=dev

# Build the binaries
docker run --rm -v "$PWD":/source/kubernetes-vault -w /source/kubernetes-vault golang:1.11-alpine ./build.sh

# Build the images
docker build -t jarpy/kubernetes-vault:"$VERSION" -f cmd/controller/Dockerfile.dev cmd/controller/
docker build -t jarpy/kubernetes-vault-init:"$VERSION" -f cmd/init/Dockerfile.dev cmd/init/
docker build -t jarpy/kubernetes-vault-sample-app:"$VERSION" -f cmd/sample-app/Dockerfile.dev cmd/sample-app/

# Push images
#docker push jarpy/kubernetes-vault:"$VERSION"
#docker push jarpy/kubernetes-vault-init:"$VERSION"
#docker push jarpy/kubernetes-vault-sample-app:"$VERSION"
