let dhall-misc =
      https://raw.githubusercontent.com/awseward/dhall-misc/20210120044731/package.dhall sha256:48b4ebe2c86ba3b30cae6b9b7c88df123b9ff85d66bf92cbb88d697802c2d7a6

in  dhall-misc.{ actions-catalog, action_templates, GHA }
