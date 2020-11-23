#!/bin/bash

UNAME_OS=$(uname -s)
UNAME_ARCH=$(uname -m)

NORMALIZED_OS=$UNAME_OS
if [ "$NORMALIZED_OS" = "Linux" ]; then
  NORMALIZED_OS="linux"
fi

NORMALIZED_ARCH=$UNAME_ARCH
if [ "$NORMALIZED_ARCH" = "x86_64" ]; then
  NORMALIZED_ARCH="amd64"
fi

export UNAME_OS
export UNAME_ARCH
export NORMALIZED_OS
export NORMALIZED_ARCH
