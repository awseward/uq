let imports = ../imports.dhall

let GHA = imports.GHA

let On = GHA.On

let OS = GHA.OS.Type

let actions = imports.actions-catalog

let Checkout = imports.job-templates.actions/Checkout

let nim/Build = imports.job-templates.nim/Build

let nim/Setup = imports.job-templates.nim/Setup

in  GHA.Workflow::{
    , name = "CI"
    , on = On.names [ "push" ]
    , jobs =
          [ nim/Build.mkJobEntry
              nim/Build.Opts::{
              , bin = "uq"
              , nimSetup = nim/Setup.Opts::{ nimVersion = "1.4.6" }
              , platforms = [ OS.macos-latest ]
              }
          ]
        # toMap
            { check-shell = GHA.Job::{
              , runs-on = [ OS.ubuntu-latest ]
              , steps =
                  Checkout.plainDo
                    [ let a = actions.awseward/gh-actions-shell

                      in  a.mkStep a.Common::{=} a.Inputs::{=}
                    ]
              }
            , check-dhall = GHA.Job::{
              , runs-on = [ OS.ubuntu-latest ]
              , steps =
                  Checkout.plainDo
                    [ let a = actions.awseward/gh-actions-dhall

                      in  a.mkStep a.Common::{=} a.Inputs::{=}
                    ]
              }
            }
    }
