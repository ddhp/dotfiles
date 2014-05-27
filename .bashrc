# load .bash_aliases if exists
if [ -f ~/.bash_aliases ]; then
. ~/.bash_aliases
fi

export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

bind '"\x1b\x5b\x41":history-search-backward'
bind '"\x1b\x5b\x42":history-search-forward'

export PS1='\[\033[01;36m\]\w \[\033[00m\]$ '
