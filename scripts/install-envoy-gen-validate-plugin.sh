#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

PLUGIN_VERSION=$1

if ! type "protoc-gen-validate" > /dev/null 2>&1; then
  echo "Installing protoc-gen-validate $PLUGIN_VERSION"
  
  go install github.com/envoyproxy/protoc-gen-validate@$PLUGIN_VERSION
fi
