[ -z "$1" ] && dest="/home/sweater/github/dotfiles" || dest=$1
[ -z "$2" ] &&  msg="Dotfiles autosync"             ||  msg=$2
home='/home/sweater'
arrows="→ ⇒ ⇄ ↑ ↩ ⤢ ↱ ↷ ↻ ☛"
for c in \
    '.bashrc' \
    '.nixpkgs/config.nix' \
    '.newsbeuter/urls' \
    '.vimrc' \
    '.tmux.conf' \
    '.xsession' \
    '.bash_profile' \
    '.emacs'
do
  cc=${c/\./_}
  target=${cc//\//->}
  cp -u $home/$c "${dest}/${target}"
done
for globc in \
    '/root/cron.conf'
do
  cc=${globc/\./_}
  target=${cc//\//->}
  cp -u $globc "${dest}/${target}"
done
cp -ut "${dest}/nixos" /etc/nixos/*nix
mkdir -p ${dest}/_emacs.d 2>/dev/null
cp -ru ${home}/.emacs.d/wilderness ${dest}/_emacs.d/
cp -ru ${home}/.i3/* ${dest}/_i3/
cd "${dest}"
git add .
git status
git commit -am "$msg"
git push origin master
