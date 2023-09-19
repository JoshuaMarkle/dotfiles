# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export VISUAL=nvim
export EDITOR="$VISUAL"

alias ls='ls --color=auto'
alias la='la -A'
alias grep='grep --color=auto'
<<<<<<< HEAD
=======
alias fetch='nitch'
alias jupyter='cd ~/School/Scripts/Jupyter; python ~/.local/bin/jupyter-notebook'
alias school='cd ~/School'
>>>>>>> 1e7d919 (Major Update)

export PS1='\[\e[1;31m\]\u@\h: \[\e[1;34m\]\w\[\e[0m\] > '
