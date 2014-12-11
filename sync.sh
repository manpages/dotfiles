[ -z "$1" ] && dest="/home/sweater/github/dotfiles" || dest=$1
cp -ut "${dest}/nixos" /etc/nixos/*nix 
cd "${dest}"
git add . 
git commit -am 'Automatically synchronize system expressions' 
git push origin master
