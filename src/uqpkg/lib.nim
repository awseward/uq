import os
import streams
import strutils
import options
import uri

proc fmt_shell*(input: string, prefix: string, pathLStripSlash = false, pathKey = none(string)): string =
  let parsed = parseUri input
  let pathKey = pathKey.get $("$1_PATH" % [prefix])
  result = """
export $1_SCHEME='$3'
export $1_HOST='$4'
export $1_PORT='$5'
export $1_LOGIN='$6'
export $1_PASSWORD='$7'
export $2='$8'""" % [
    prefix,
    pathKey,
    parsed.scheme,
    parsed.hostname,
    parsed.port,
    parsed.username,
    parsed.password,
    if pathLStripSlash: parsed.path.strip(chars = {'/'}) else: parsed.path
  ]
