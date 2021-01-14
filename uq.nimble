# Package

version       = "0.1.10"
author        = "Andrew Seward"
description   = "Like `jq` but for URLs"
license       = "MIT"
srcDir        = "src"
installExt    = @["nim"]
bin           = @["uq"]

# Dependencies

requires "argparse == 0.10.1"
requires "nim >= 1.4.2"

requires "https://github.com/awseward/nim-junk-drawer#9ff04c5c70b2fe5d24f951f0ff8f408a108ee059"

task pretty, "Run nimpretty on all .nim files in the repo":
  exec "find . -type f -name '*.nim' | xargs -n1 nimpretty --indent:2 --maxLineLen:120"
