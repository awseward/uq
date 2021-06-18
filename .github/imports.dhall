let dhall-misc =
      https://raw.githubusercontent.com/awseward/dhall-misc/a297d627ada0a84e3dc1c9cc301bc42734b7f7d1/package.dhall
        sha256:8e1fe66925df2a92a25774e809da7dda1ce6775058db22a21f79fab2f12bbaed

in  dhall-misc.{ actions-catalog, job-templates, GHA }
