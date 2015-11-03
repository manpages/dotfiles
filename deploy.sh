[ -z "$1" ] && dest="/home/sweater/github/dotfiles" || dest=$1
home='/home/sweater'
for c in \
    '.bashrc' \
    '_tmux.conf' \
    '.nixpkgs/config.nix' \
    '.newsbeuter/urls' \
    '.vimrc' \
    '.tmux.conf' \
    '.xsession' \
    '.bash_profile' \
    '.emacs' \
    '.vimperatorrc' \
    '.vimperator/base16-mixedchalk.vimp' \
    '.vimperator/base16-mixedchalk.uicolors.vimp' \
    '.ghcPkgUtils.source' \
    '.history.source'
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
