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

# Disable history
export HISTSIZE=0
export HISTFILESIZE=0

# Source best aliases
source ~/.config/zsh/aliases

# Modernize prompt
export PS1='\[\e[1;34m\]\u@\h: \[\e[1;34m\]\w\[\e[0m\] ❱ '
