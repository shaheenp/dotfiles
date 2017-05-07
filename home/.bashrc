# if not running interactively, don't do anything
[[ $- != *i* ]] && return

# setup GOPATH
export GOPATH=$HOME/Go

# add dirs to path
export PATH=$HOME/bin:$PATH:$GOPATH/bin

# customized prompt
PS1='\w \[\e[0;31m\]> \[\e[m\]'

# ls alias to be colored and detailed
alias ls='ls -alFh --color=auto'

# grep alias to be colored
alias grep='grep --color=auto'

# set default editor
export EDITOR=vim

# set default browser
export BROWSER=chromium

# set default terminal
export TERMINAL=termite

# alias hub as git
eval "$(hub alias -s)"

# make homeshick command available
source "$HOME/.homesick/repos/homeshick/homeshick.sh"

