# History
HISTSIZE=5000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt hist_ignore_dups share_history

# Completion
autoload -Uz compinit
compinit

# Prompt
PROMPT='%F{cyan}%n@%m%f %F{yellow}%~%f %# '

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
