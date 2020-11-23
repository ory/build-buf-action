#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

GO_PROTOC_VERSION=$1

if [ ! -f ".bin/protoc-gen-go" ] || .bin/protoc-gen-go --version | grep -q "$GO_PROTOC_VERSION"; then
  echo "Installing protobuf-gen-go $GO_PROTOC_VERSION for OS $UNAME_OS Arch $UNAME_ARCH"
  mkdir -p .bin
  curl --fail -sSL "https://github.com/protocolbuffers/protobuf-go/releases/download/$GO_PROTOC_VERSION/protoc-gen-go.$GO_PROTOC_VERSION.$NORMALIZED_OS.$NORMALIZED_ARCH.tar.gz" -o .bin/protoc-gen-go.tar.gz
  tar -xf .bin/protoc-gen-go.tar.gz -C .bin
  chmod +x .bin/protoc-gen-go
fi
