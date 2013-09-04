export EDITOR=vim

export TERM="xterm-256color"

# colors
alias ls="ls --color"
alias grep="grep --color"

export PS1="\e[33m\w \e[34mλ \e[0m"

# activate erlang and python
. /home/sweater/.kerl/default/activate

# path variable
export PATH=/home/sweater/.gem/ruby/2.0.0/bin:${PATH}
export NODE_PATH=/home/sweater/.npm:${NODE_PATH}

# don't log keys
pgrep logkeys && sudo logkeys -k && sudo sh -c "head -n -8 /var/log/logkeys.log > /var/log/logkeys.tmp && mv /var/log/logkeys.tmp /var/log/logkeys.log"

# user space aliases
alias mstr="mosh -p 22001 --ssh 'ssh -p 21984' mstr.lv"
alias pad="google docs edit cloudpad"

# set the title
echo -ne '\033kλ\033\\'

source ~/.wrapbash
