# Created by Zap installer
[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

export ZDOTDIR="$HOME/.config/zsh"
export TEXMFVAR="/var/lib/texmf"

# Flutter Support
export ANDROID_HOME=$HOME/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/bin/java

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
#plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"

# Load and initialise completion system
autoload -Uz compinit
compinit

# Add aliases
source ~/.config/zsh/aliases

PROMPT="%B%F{red}%n@%m: %B%F{blue}%~%b %F{foreground}❱ "
