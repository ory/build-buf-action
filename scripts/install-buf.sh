#!/bin/bash
set -euo pipefail

UNAME_OS=$(uname -s)
UNAME_ARCH=$(uname -m)

BUF_VERSION=$1

if [ ! -f ".bin/buf" ]; then
  echo "Installing buf $BUF_VERSION for OS $UNAME_OS Arch $UNAME_ARCH"
  mkdir -p .bin
  curl --fail -sSL "https://github.com/bufbuild/buf/releases/download/$BUF_VERSION/buf-$UNAME_OS-$UNAME_ARCH" -o .bin/buf
  chmod +x .bin/buf
fi

PATH=PATH:"$(pwd)/.bin"
export PATH
