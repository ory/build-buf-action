#!/bin/bash
set -euo pipefail

source scripts/executor-info.sh

BUF_VERSION=$1

IFS=" " read -r -a PROTOC_PLUGINS <<< "$2"
for part in "${PROTOC_PLUGINS[@]}"; do
  IFS="@" read -r -a langAndVersion <<< "$part"

  if [ "${#langAndVersion[@]}" != 2 ]; then
    echo "Malformed plugin specifier \"$part\", expected e.g. go@v1.25.0"
    exit 1
  fi

  bash "scripts/install-${langAndVersion[0]}-plugin.sh" "${langAndVersion[1]}"
done

if [ ! -f ".bin/buf" ]; then
  echo "Installing buf $BUF_VERSION for OS $UNAME_OS Arch $UNAME_ARCH"
  mkdir -p .bin
  curl --fail -sSL "https://github.com/bufbuild/buf/releases/download/$BUF_VERSION/buf-$UNAME_OS-$UNAME_ARCH" -o .bin/buf
  chmod +x .bin/buf
fi

PATH=PATH:"$(pwd)/.bin"
export PATH
