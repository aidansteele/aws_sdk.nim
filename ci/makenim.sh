#!/bin/bash
set -euxo pipefail

PATH=$PATH:$PWD/vendor/Nim/bin

if hash nim 2>/dev/null; then
    echo "nim already installed"
else
    git clone --depth 1 https://github.com/nim-lang/Nim.git vendor/Nim
    cd vendor/Nim
    git clone --depth 1 https://github.com/nim-lang/csources.git
    cd csources
    sh build.sh
    cd ../
    bin/nim c koch
    ./koch boot -d:release
    ./koch nimble
fi
