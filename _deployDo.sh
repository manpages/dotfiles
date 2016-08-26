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
    '.vimperator/wilderness/cyrillic.vimp' \
    '.ghcPkgUtils.source' \
    '.arbtt/categorize.cfg' \
    '.gitconfig' \
    '.Xresources' \
    '.muttrc'

do
    cc=${c/\./_}
    target=${cc//\//->}
    if [ -f $home/$c ]; then
      cp -uv $home/$c{,.backup}
    fi
    mkdir -p "$(dirname ${home}/${c})"
    cp -uv "${dest}/${target}" "${home}/${c}"
done

for globc in \
    '/root/cron.conf'

do
    # Restore global configs
    cc=${globc/\./_}
    target=${cc//\//->}
    cp -u "${dest}/${target}" "${globc}"

done

mkdir -p ${home}/.emacs.d
cp -vru _emacs.d/wilderness ${home}/.emacs.d/

mkdir -p ${home}/.js
cp -vru _js/*               ${home}/.js/

mkdir -p ${home}/.mutt
cp -vru _mutt/includes      ${home}/.mutt/
