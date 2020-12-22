#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

PLUGIN_VERSION=$1
BIN_DIR=$(pwd)/.bin
PLUGIN=protoc-gen-ts-proto
VER_FILE=$BIN_DIR/$PLUGIN.ver
PLUGIN_EXE=$BIN_DIR/$PLUGIN

# Can't use grep with `set -e pipfail`...
CUR_VER=
if [ -f "$VER_FILE" ]; then CUR_VER=($(<$VER_FILE)); fi

if [ ! -f "$PLUGIN_EXE" ] || ! [[ " ${CUR_VER[@]} " =~ " ${PLUGIN_VERSION} " ]]; then
  echo "Installing $PLUGIN $PLUGIN_VERSION"
  mkdir -p $BIN_DIR
  npm install --prefix $BIN_DIR ts-proto@$PLUGIN_VERSION
  echo "$PLUGIN_VERSION" > $VER_FILE
  ln -s $BIN_DIR/node_modules/ts-proto/protoc-gen-ts_proto $BIN_DIR/protoc-gen-ts_proto
fi
