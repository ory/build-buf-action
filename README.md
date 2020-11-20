# Build Buf GitHub Action

A GitHub action that provides [buf](https://github.com/bufbuild/buf).

## Usage

```yaml
name: Generate and Lint buf

on:
  pull_request:
    branches:
      - *

jobs:
  lint:
    name: buf check lint
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: ory/build-buf-action@v0
        with:
          bufVersion: v0.31.1
          bufArgs: check lint --config buf/api/buf.yaml
```
