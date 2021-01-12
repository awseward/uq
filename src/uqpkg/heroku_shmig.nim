import os
import options
import streams
import strutils
import uri

import ./lib

static:
  const scheme = "postgres"
  const username = "drBrule123"
  const password = "Pa55w0rD!"
  const host = "example.com"
  const port = 5432
  const dbName = "my_cool_app_production"

  const exampleUrl =
    "$1://$2:$3@$4:$5/$6" % [scheme, username, password, host, $port, dbName]

  assert exampleUrl ==
    "postgres://drBrule123:Pa55w0rD!@example.com:5432/my_cool_app_production"

  let parsed = parseUri exampleUrl

  assert parsed.scheme == scheme
  assert parsed.username == username
  assert parsed.password == password
  assert parsed.hostname == host
  assert parseInt(parsed.port) == port
  assert parsed.path.strip(chars = {'/'}) == dbName

proc fmt*(): string =
  getEnv("DATABASE_URL").fmt_shell(
    "DATABASE",
    pathLStripSlash = true,
    pathKey = some("DATABASE_NAME")
  )

proc run*() =
  echo fmt()
