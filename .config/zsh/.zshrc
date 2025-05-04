# Add custom aliases
source ~/.config/zsh/aliases

# Keybinds
function sessionizer() {
    ( # Terminal magic to make the script work
        exec </dev/tty
        exec <&1
    	~/.local/bin/sessionizer.sh
    )
    zle reset-prompt
}
zle -N sessionizer
bindkey '^f' sessionizer

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

# Auto print directory items if in tmux
if [[ -n $TMUX ]]; then
    la && echo
fi

# Starship
eval "$(starship init zsh)"

# Python version manager
# eval "$(pyenv init --path)"

# Default prompt
# PROMPT='%F{blue}  %B%F{white}%~%b %F{blue}%f '

# Setup Pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
