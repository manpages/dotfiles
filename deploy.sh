[ -z "$1" ] && dest="/home/sweater/github/dotfiles" || dest=$1
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
    '.vimperator/wilderness/base16-mixedchalk.uicolors.vimp' \
    '.ghcPkgUtils.source' \
    '.Xresources'
do
      cc=${c/\./_}
      target=${cc//\//->}
      if [ -f $home/$c ]; then
        cp -v $home/$c{,.backup}
      fi
      cp -v $dest/$target $home/$c
done
mkdir -p $home/.emacs.d
cp -vru _emacs.d/wilderness $home/.emacs.d/
