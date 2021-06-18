let dhall-misc =
        env:DHALL_MISC
      ? https://raw.githubusercontent.com/awseward/dhall-misc/20210618080150/package.dhall
          sha256:68e5b811acb9045dd1c9a932991b37a440b43a0a598de3ae26011039444a36ec

in  dhall-misc.{ actions-catalog, job-templates, GHA }
