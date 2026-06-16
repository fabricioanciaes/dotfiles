export ZDOTDIR=$HOME/.config/zsh
source "$HOME/.config/zsh/.zshrc"
source "$HOME/.zsh-tokens"

# Set default terminal
export TERMINAL=kitty

setxkbmap -option caps:swapescape

# Tmux with default session
alias tmux='~/.local/bin/tmux-start'
