#!/bin/bash
set -euxo pipefail

PATH=$PATH:$PWD/vendor/Nim/bin

nimble refresh
nimble build || true
nimble tests
