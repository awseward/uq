import argparse
import options
import system

import ./uqpkg/heroku_shmig
import ./uqpkg/lib
import ./uqpkg/statics

const AppName = "uq"

const USE_STDIN = "USE_STDIN"

let p = newParser(AppName):
  help "Help text here..."

  flag "--version", help = "Print the version of " & AppName
  flag "--revision", help = "Print the Git SHA of " & AppName
  flag "--info", help = "Print version and revision"

  command "a":
    arg "input", default = USE_STDIN
    run:
      if opts.input == USE_STDIN:
        opts.input = (readAll stdin).strip()

  command "fmt-shell":
    # FIXME -- The default here is quite subpar, but the preferable `required`
    # keyword arg to `option` not introduced until a later version of argparse.
    option "--path-key", default = "URL_PATH"
    option "--keys-prefix", default = "URL"

    flag "--path-lstrip-slash"

    arg "input", default = USE_STDIN

    run:
      if opts.input == USE_STDIN:
        opts.input = (readAll stdin).strip()
      echo fmt_shell(
        opts.input,
        opts.keysPrefix,
        pathLStripSlash = opts.pathLStripSlash,
        pathKey = some(opts.pathKey)
      )

  command "heroku-shmig":
    help "\"Explodes\" the url to DATABASE_{HOST,PORT,LOGIN,PASSWORD,NAME} for eval by shell"
    run:
      echo heroku_shmig.fmt()

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
