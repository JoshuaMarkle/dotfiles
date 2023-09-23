# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"
export ZDOTDIR="$HOME/.config/zsh"

alias ls='ls --color=auto'
alias la='la -A'
alias grep='grep --color=auto'

alias fetch='nitch'
alias workspace='bash ~/.local/bin/setup-workspace.sh'

export PS1='\[\e[1;34m\]\u@\h: \[\e[1;34m\]\w\[\e[0m\] > '
