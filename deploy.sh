[ -z "$1" ] && dest="/home/sweater/github/dotfiles" || dest=$1
home='/home/sweater'
mkdir -p $home/.emacs.d
mkdir -p $home/.vimperator
mkdir -p $home/.arbtt
mkdir -p $home/.js
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
    '.Xresources'
do
      cc=${c/\./_}
      target=${cc//\//->}
      if [ -f $home/$c ]; then
        cp -v $home/$c{,.backup}
      fi
      cp -v $dest/$target $home/$c
done
cp -vru _emacs.d/wilderness $home/.emacs.d/
cp -vru _js/* $home/.js/
