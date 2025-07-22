#!/usr/bin/env nu

let os = $nu.os-info | get name
let home = $nu.home-path
let yazi_dir = $home | path join (
  if $os == "windows" {
    "AppData/Local/yazi"
  } else {
    ".config/yazi"
  }
)
let sources = ls plugins | get name

def echo_err [msg] {
  print $"(ansi red)($msg)(ansi reset)"
}

def main [
  --setup
  --cleanup
] {
  if ((not $setup) and (not $cleanup)) {
    echo_err "Specify at least one argument: '--setup' or '--cleanup'"
    return
  }

  if not ($yazi_dir | path exists) {
    mkdir $yazi_dir
  }

  for src in $sources {
    let dest_dir = $yazi_dir | path join $src
    let src = $env.FILE_PWD | path join $src | path join "main.lua"
    let tar = $dest_dir | path join (if $setup { "main.lua" } else { "main.lua.bak" })
    let tar_repl = $dest_dir | path join (if $setup { "main.lua.bak" } else { "main.lua" })
    let tar_existed = $tar | path exists

    if $tar_existed {
      mv --force $tar $tar_repl
    }

    if $setup {
      let tar_dir = $tar | path dirname
      if not ($tar_dir | path exists) {
        mkdir $tar_dir
      }
      ln -s $src $tar
    } else if $cleanup and not $tar_existed {
      rm -rf $dest_dir
    }
  }
}
