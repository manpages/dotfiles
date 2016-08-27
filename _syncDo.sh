[ -z "$1" ] &&  msg="Dotfiles autosync"             ||  msg=$1
[ -z "$2" ] && dest="/home/sweater/github/dotfiles" || dest=$2
home='/home/sweater'

for c in \
    '.bashrc' \
    '.tmux.conf' \
    '.nixpkgs/config.nix' \
    '.newsbeuter/urls' \
    '.vimrc' \
    '.tmux.conf' \
    '.xsession' \
    '.bash_profile' \
    '.emacs' \
    '.vimperatorrc' \
    '.vimperator/wilderness/base16-mixedchalk.vimp' \
    '.vimperator/wilderness/base16-mixedchalk.uicolors.vimp' \
    '.vimperator/wilderness/cyrillic.vimp' \
    '.ghcPkgUtils.source' \
    '.arbtt/categorize.cfg' \
    '.gitconfig' \
    '.Xresources' \
    '.muttrc'

do
  # Save local configs
  cc=${c/\./_}
  target=${cc//\//->}
  cp -u ${home}/${c} "${dest}/${target}"
done

for globc in \
    '/root/cron.conf'
do
  # Save global configs (TODO: not redeployed automatically)
  cc=${globc/\./_}
  target=${cc//\//->}
  cp -u $globc "${dest}/${target}"
done

mkdir -p ${dest}/_emacs.d 2>/dev/null
cp -ru ${home}/.emacs.d/wilderness ${dest}/_emacs.d/

mkdir -p ${dest}/_js 2>/dev/null
cp -ru ${home}/.js/*               ${dest}/_js/

mkdir -p ${dest}/_mutt 2>/dev/null
cp -ru ${home}/.mutt/includes      ${dest}/_mutt/

cd "${dest}"

rsync -Pav /etc/nixos "${dest}/"

git add .
git status
git commit -am "$msg"
git push origin master
