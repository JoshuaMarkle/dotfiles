# ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Terminal Configuration
export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

export ZDOTDIR="$HOME/.config/zsh"
export TEXMFVAR="/var/lib/texmf"

# Flutter Support
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk
export FZF_DEFAULT_OPTS="--height=100% --reverse \
--color=bg+:#FAFBFC,bg:#FAFBFC,border:#E9EAEB,spinner:#13BBB7,hl:#FF5C56,fg:#565869,header:#565869,info:#2DAE58,pointer:#FF5C56,marker:#FF5C56,fg+:#2DAE58,preview-bg:#F3F4F5,prompt:#09A1ED,hl+:#2DAE58"

export PATH=/opt/cuda/bin:$PATH
export LD_LIBRARY_PATH=/opt/cuda/lib64:$LD_LIBRARY_PATH

# Disable history
export HISTSIZE=0
export HISTFILESIZE=0

# Source best aliases
source ~/.config/zsh/aliases

# Keybinds
bind -x '"\C-x":exit'
bind -x '"\C-f":"~/.local/bin/sessionizer.sh"'
bind -x '"\C-n":"nvim"'

# Modernize prompt
export PS1="\[\033[34m\]  \[\033[1;37m\]\w \[\033[0;34m\] \[\033[0m\]"
#export PS1='\[\e[1;34m\]\w\[\e[0m\] ❱ '
