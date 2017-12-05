# Package

version       = "0.1.0"
author        = "Aidan Steele"
description   = "AWS SDK for Nim"
license       = "MIT"

# Dependencies

requires "stringinterpolation"
requires "sph"
requires "nim >= 0.13.1"

task tests, "Run tests":
    for t in ["dynamodb", "logs", "firehose"]:
        exec("nim c -r -d:ssl tests/t" & t)
