# Basics
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff"

# Completion
autoload -Uz compinit
compinit

# Plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Completion
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# History
HISTSIZE=5000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt hist_ignore_dups share_history

# Starship prompt
eval "$(starship init zsh)"

# Aliases
alias ll='ls -lah'
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'

# Environment
export EDITOR=nano
export VISUAL=nano

# Enable tmux automatically (optional)
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t main || tmux new -s main
fi
