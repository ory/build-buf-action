#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

PLUGIN_VERSION=$1
BIN_DIR=$(pwd)/.bin
PLUGIN=protoc-gen-python_betterproto

VER_FILE=$BIN_DIR/$PLUGIN.ver
PLUGIN_EXE=$BIN_DIR/$PLUGIN

# Can't use grep with `set -e pipfail`...
CUR_VER=
if [ -f "$VER_FILE" ]; then CUR_VER=($(<$VER_FILE)); fi

if [ ! -f "$PLUGIN_EXE" ] || ! [[ " ${CUR_VER[@]} " =~ " ${PLUGIN_VERSION} " ]]; then
  echo "Installing $PLUGIN $PLUGIN_VERSION"
  mkdir -p $BIN_DIR
  pip install --upgrade --target="$BIN_DIR" "betterproto[compiler]==$PLUGIN_VERSION"
  echo "$PLUGIN_VERSION" > $VER_FILE
  mv $BIN_DIR/bin/protoc* $BIN_DIR
fi
