#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

PLUGIN_VERSION=$1

hash go 2>/dev/null || { echo >&2 "Failed to find go. Go is required to install the envoy-gen-validate plugin. Aborting."; exit 1; }

echo "Installing protoc-gen-validate $PLUGIN_VERSION"
  
go install github.com/envoyproxy/protoc-gen-validate@$PLUGIN_VERSION
