import argparse
import system

import ./uqpkg/statics
import ./uqpkg/db_legacy_shell

const AppName = "uq"

let p = newParser(AppName):
  help "Help text here..."

  flag "--version", help = "Print the version of " & AppName
  flag "--revision", help = "Print the Git SHA of " & AppName
  flag "--info", help = "Print version and revision"

  command "db-legacy-shell":
    help "\"Explodes\" the url to DATABASE_{HOST,PORT,LOGIN,PASSWORD,NAME} for eval by shell"
    run:
      echo db_legacy_shell.fmt()

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
