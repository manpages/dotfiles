[ -z "$1" ] &&  msg="Dotfiles autosync" ||  msg=$1
./_syncDo.sh "$msg" "$(pwd)"
