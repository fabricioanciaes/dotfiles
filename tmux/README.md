# Tmux Configuration

This directory contains all tmux-related configurations and scripts.

## Installation

```bash
cd ~/dotfiles
stow tmux
```

## Post-Installation

Add the following alias to your `~/.zshrc`:

```bash
# Tmux with default session
alias tmux='~/.local/bin/tmux-start'
```

Then reload your shell:
```bash
source ~/.zshrc
```

## What's Included

- **`.tmux.conf`**: Main tmux configuration
  - Prefix: `Ctrl+A`
  - Keybindings:
    - `Ctrl+F`: Open tmux-sessionizer (project switcher)
    - `Ctrl+O`: Open GitHub URL of current repo
    - `x`: Kill pane without confirmation

- **`tmux-sessionizer`**: ThePrimeagen's tmux session manager
  - Searches `~/dev` (1 level deep) and home directory

- **`tmux-start`**: Auto-creates "system" session in home directory

- **`open-github`**: Opens GitHub URL of current repo in browser

- **`xdg-open-focus`**: Wrapper for xdg-open that focuses windows in Hyprland

- **Plugin configurations**:
  - `tmux-nerd-font-window-name`: Icons for window names (Claude: 󰚩)
  - Session name shown in top right status bar
