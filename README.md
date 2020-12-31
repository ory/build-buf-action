# Build Buf GitHub Action

A GitHub action that provides [buf](https://github.com/bufbuild/buf).

## Usage

```yaml
name: Generate and Lint buf

on:
  push:
    branches:
      - '*'
  workflow_dispatch:

jobs:
  lint-build:
    name: buf check lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: ory/build-buf-action@v0
        with:
          bufVersion: v0.31.1
          bufArgs: check lint --config buf/api/buf.yaml
      - uses: ory/build-buf-action@v0
        with:
          bufVersion: v0.31.1
          protocPlugins: go@v1.25.0 go-grpc@v1.0.1 python_betterproto@2.0.0b2 ts-proto@1.39.0 grpc-java@1.34.0
          bufArgs: generate --config buf/api/buf.yaml --template buf/api/buf.gen.yaml
# Don't forget to commit and push after this step
```

## Plugins

`buf` requires you to install the protoc plugins for the languages you want to generate.
Currently, the following plugins are available in the action:

- [go](https://github.com/protocolbuffers/protobuf-go)
- [go-grpc](https://github.com/grpc/grpc-go)
- [python_betterproto](https://github.com/danielgtaylor/python-betterproto)
- [ts-proto](https://github.com/stephenh/ts-proto)
- [grpc-java](https://github.com/grpc/grpc-java)

Please open a PR to add install scripts for any missing plugin.
