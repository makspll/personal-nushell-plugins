# config.nu
#
# Installed by:
# version = "0.101.0"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.

$env.config.buffer_editor = "code"

if $nu.os-info.name == "linux" {
    # wsl setup
    
    # add cargo to directory
    $env.PATH ++= [~/.cargo/bin]
} else {

}

$env.config.show_banner = false


# git-fresh
# 
# Use before creating a new branch
# Checks out the default branch and pulls the latest changes
# Stash your changes before running this command
def git-fresh [] {
    let branch = git remote show origin | sed -n '/HEAD branch/s/.*: //p'
    git checkout $branch
    git fetch
    git pull
}