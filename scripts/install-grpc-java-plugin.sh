#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

PLUGIN_VERSION=$1
BIN_DIR=$(pwd)/.bin
PLUGIN=protoc-gen-grpc-java
VER_FILE=$BIN_DIR/$PLUGIN.ver
PLUGIN_EXE=$BIN_DIR/$PLUGIN

# Can't use grep with `set -e pipfail`...
CUR_VER=
if [ -f "$VER_FILE" ]; then CUR_VER=($(<$VER_FILE)); fi

if [ ! -f "$PLUGIN_EXE" ] || ! [[ " ${CUR_VER[@]} " =~ " ${PLUGIN_VERSION} " ]]; then
  echo "Installing $PLUGIN $PLUGIN_VERSION for OS $UNAME_OS Arch $UNAME_ARCH"
  mkdir -p $BIN_DIR
  curl --fail -sSL "https://repo1.maven.org/maven2/io/grpc/protoc-gen-grpc-java/$PLUGIN_VERSION/protoc-gen-grpc-java-$PLUGIN_VERSION-$NORMALIZED_OS-$UNAME_ARCH.exe" -o ./.bin/protoc-gen-grpc-java
  chmod +x $PLUGIN_EXE
  echo "$PLUGIN_VERSION" > $VER_FILE
fi
