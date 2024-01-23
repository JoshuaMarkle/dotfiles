# Add custom aliases
source ~/.config/zsh/aliases

# Keybinds
function project_switcher() {
    ( # Terminal magic to make the script work
        exec </dev/tty
        exec <&1
    	~/.local/bin/project-switcher.sh
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

if [[ -n $TMUX ]]; then
    la && echo
fi

eval "$(starship init zsh)"
# PROMPT='%F{blue}  %B%F{white}%~%b %F{blue}%f '
