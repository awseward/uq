let dhall-misc =
        env:DHALL_MISC
      ? https://raw.githubusercontent.com/awseward/dhall-misc/20210618052055/package.dhall
          sha256:2921598959cef2b15ca06bfe7b1955203c7a4aa7b141a719f7fcea8efebc1933

in  dhall-misc.{ actions-catalog, job-templates, GHA }
