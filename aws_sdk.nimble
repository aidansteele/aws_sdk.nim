# Package

version       = "0.1.0"
author        = "Aidan Steele"
description   = "AWS SDK for Nim"
license       = "MIT"


task tests, "Run tests":
    for t in ["smoketest"]:
        exec("nim c -r -d:ssl tests/t" & t)
