#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

PLUGIN_VERSION=$1

if [ ! -f ".bin/protoc-gen-go-grpc" ] || .bin/protoc-gen-go-grpc --version | grep -q "$PLUGIN_VERSION"; then
  echo "Installing protobuf-gen-go-grpc $PLUGIN_VERSION for OS $UNAME_OS Arch $UNAME_ARCH"
  mkdir -p .bin
  curl --fail -sSL "https://github.com/grpc/grpc-go/releases/download/cmd%2Fprotoc-gen-go-grpc%2F$PLUGIN_VERSION/protoc-gen-go-grpc.$PLUGIN_VERSION.$NORMALIZED_OS.$NORMALIZED_ARCH.tar.gz" -o .bin/protoc-gen-go-grpc.tar.gz
  tar -xf .bin/protoc-gen-go-grpc.tar.gz -C .bin
  chmod +x .bin/protoc-gen-go-grpc
fi
