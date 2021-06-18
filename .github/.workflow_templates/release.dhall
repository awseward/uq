let imports = ../imports.dhall

let GHA = imports.GHA

let On = GHA.On

let job-templates = imports.job-templates

let Release = job-templates.release/jobs

in  GHA.Workflow::{
    , name = "Release"
    , on = On.map [ On.push On.PushPull::{ tags = On.include [ "*" ] } ]
    , jobs =
        Release.mkJobs
          Release.Opts::{
          , formula-name = "uq"
          , homebrew-tap = "awseward/homebrew-tap"
          , nimVersion = "1.4.6"
          }
    }
