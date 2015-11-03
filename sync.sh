[ -z "$1" ] &&  msg="Dotfiles autosync"             ||  msg=$1
[ -z "$2" ] && dest="/home/sweater/github/dotfiles" || dest=$2
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
    '.emacs' \
    '.history.source' \
    '.ghcPkgUtils.source'
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
rsync -Pav /etc/nixos "${dest}/"
mkdir -p ${dest}/_emacs.d 2>/dev/null
cp -ru ${home}/.emacs.d/wilderness ${dest}/_emacs.d/
cp -ru ${home}/.i3/* ${dest}/_i3/
cd "${dest}"
git add .
git status
git commit -am "$msg"
git push origin master
