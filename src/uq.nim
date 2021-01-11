import argparse
import system

import ./uqpkg/statics

const AppName = "uq"

let p = newParser(AppName):
  help "Help text here..."

  flag "--version", help = "Print the version of " & AppName
  flag "--revision", help = "Print the Git SHA of " & AppName
  flag "--info", help = "Print version and revision"

  command "hello":
    arg "name", help = "Name to say hello to"

    run:
      echo "Hello, ", opts.name, "!"

  run:
    if opts.version:
      echo pkgVersion
    elif opts.revision:
      echo pkgRevision
    elif opts.info:
      echo "version:  ", pkgVersion
      echo "revision: ", pkgRevision
    elif commandLineParams().len == 0:
      echo p.help

p.run
