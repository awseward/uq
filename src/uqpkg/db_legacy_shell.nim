import os
import streams
import strutils
import uri

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
  let databaseUrl = getEnv "DATABASE_URL"
  let parsed = parseUri databaseUrl
  result = """
export DATABASE_HOST='$1'
export DATABASE_PORT='$2'
export DATABASE_LOGIN='$3'
export DATABASE_PASSWORD='$4'
export DATABASE_NAME='$5'""" % [
    parsed.hostname,
    parsed.port,
    parsed.username,
    parsed.password,
    parsed.path.strip(chars = {'/'})
  ]

proc run*() =
  echo fmt()
