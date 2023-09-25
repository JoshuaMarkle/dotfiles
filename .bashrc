# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

export ZDOTDIR="$HOME/.config/zsh"
export TEXMFVAR="/var/lib/texmf"

alias ls='ls --color=auto'
alias la='la -A --color=auto'
alias grep='grep --color=auto'

alias fetch='nitch'
alias workspace='bash ~/.local/bin/setup-workspace.sh'

export PS1='\[\e[1;34m\]\u@\h: \[\e[1;34m\]\w\[\e[0m\] > '
