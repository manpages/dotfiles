[ -z "$1" ] && dest="/home/sweater/github/dotfiles" || dest=$1
home='/home/sweater'
arrows="→ ⇒ ⇄ ↑ ↩ ⤢ ↱ ↷ ↻ ☛"
for c in \
  '.bashrc' \
  '.nixpkgs/config.nix' \
  '.newsbeuter/urls' \
  '.vimrc' \
  '.tmux.conf' \
  '.xsession' \
  '.bash_profile'
do
  cc=${c/\./_}
  target=${cc//\//->}
  cp -u "$home/$c" "${dest}/${target}"
done
for globc in \
  '/root/cron.conf'
do
  cc=${globc/\./_}
  target=${cc//\//->}
  cp -u $globc "${dest}/${target}"
done
cp -ut "${dest}/nixos" /etc/nixos/*nix
cd "${dest}"
git add .
git status
git commit -am 'Dotfiles autosync'
git push origin master
