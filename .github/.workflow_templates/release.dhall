let imports = ../imports.dhall

let config = ../config.dhall

let GHA = imports.GHA

let On = GHA.On

let job-templates = imports.job-templates

let Release = job-templates.release/jobs

in  GHA.Workflow::{
    , name = "Release"
    , on = On.map [ On.push On.PushPull::{ tags = On.include [ "*" ] } ]
    , jobs =
        Release.mkJobs
          Release.Opts::(config.homebrew ⫽ { nimVersion = config.versions.nim })
    }
