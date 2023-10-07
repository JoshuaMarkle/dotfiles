export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

export ZDOTDIR="$HOME/.config/zsh"
export ZSH="$ZDOTDIR/ohmyzsh"
export TEXMFVAR="/var/lib/texmf"

# Lazy load zsh plugins
source $ZDOTDIR/zsh-defer/zsh-defer.plugin.zsh

# Flutter Support
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/bin/java

PROMPT="%B%F{red}%n@%m: %B%F{blue}%~%b %F{foreground}❱ "
# ZSH_THEME="eastwood"

ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
ZSH_DISABLE_COMPFIX=1

# Auto-update behavior
zstyle ':omz:update' mode reminder  # just remind me to update when it's time

plugins=(
  # git
  zsh-autosuggestions
  # zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# Add custom aliases
source ~/.config/zsh/aliases
