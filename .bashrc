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
export FZF_DEFAULT_OPTS="--height=100% --reverse --color=bg+:#101319,bg:#101319,border:#101319,spinner:#9ece6a,hl:#ff007c,fg:#dadff2,header:#dadff2,info:#9ece6a,pointer:#ff007c,marker:#db4b4b,fg+:#3b4261,preview-bg:#1a1b26,prompt:#7aa2f7,hl+:#9ece6a"

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
