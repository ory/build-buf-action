#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

PLUGIN_VERSION=$1

if [ ! -f ".bin/protoc-gen-validate" ] || .bin/protoc-gen-validate --version | grep -q "$PLUGIN_VERSION"; then
  echo "Installing protoc-gen-validate $PLUGIN_VERSION"
  
  go install github.com/envoyproxy/protoc-gen-validate@$PLUGIN_VERSION
fi
