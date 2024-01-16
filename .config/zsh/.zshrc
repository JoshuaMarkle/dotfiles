# General
export TERM=xterm-256color
export VISUAL=nvim
export EDITOR="$VISUAL"

# Terminal
export ZDOTDIR="$HOME/.config/zsh"
export TEXMFVAR="/var/lib/texmf"

# Tools
export ANDROID_HOME=$HOME/tools/android-sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools
export JAVA_HOME=/usr/bin/java
export FZF_DEFAULT_OPTS="--height=100% --info=inline --border --margin=1 --padding=1 --color=bg+:#1a1b26,bg:#1a1b26,border:#a9b1d6,spinner:#1abc9c,hl:#ff007c,fg:#c0caf5,header:#ffffff,info:#1abc9c,pointer:#f7768e,marker:#db4b4b,fg+:#a9b1d6,preview-bg:#1a1b26,prompt:#7aa2f7,hl+:#1abc9c"

# Disable history
export HISTSIZE=0
export HISTFILESIZE=0
export PYTHONSTARTUP=/dev/null

# Add custom aliases
source ~/.config/zsh/aliases

# Keybinds
function project_switcher() {
    ( # Terminal magic to make the script work
        exec </dev/tty
        exec <&1
    	~/.local/bin/project_switcher.sh
    )
    zle reset-prompt
}
zle -N project_switcher
bindkey '^f' project_switcher

open_nvim() {
    nvim
    zle reset-prompt
}
zle -N open_nvim
bindkey '^n' open_nvim

# Plugins!
source "$ZDOTDIR/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
source "$ZDOTDIR/zsh-autocomplete/zsh-autocomplete.plugin.zsh"

init_transient_prompt() {
  local prompt=$(starship prompt)
  export ORIGINAL_PROMPT=$prompt
  export PROMPT='%{%f%b%k%}$(starship prompt) %E'
}

restore_original_prompt() {
  export PROMPT=$ORIGINAL_PROMPT
}
init_transient_prompt

eval "$(starship init zsh)"
# PROMPT='%F{blue}  %B%F{white}%~%b %F{blue}%f '
