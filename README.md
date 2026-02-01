# dotfiles

Personal dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/).

## Installation

Clone this repository and use stow to symlink configurations:

```bash
git clone <your-repo-url> ~/dotfiles
cd ~/dotfiles
stow tmux zsh  # Install specific configurations
```

---

## Tmux Configuration

A minimal, modern tmux setup with smart project switching and GitHub integration.

### Features

- **Custom Prefix**: `Ctrl+A` (instead of default `Ctrl+B`)
- **Project Switcher**: `Ctrl+F` - Opens tmux-sessionizer for quick project navigation
- **GitHub Integration**: `Ctrl+O` - Opens current repo's GitHub URL in browser with auto-focus
- **Smart Defaults**: Auto-creates "system" session in home directory when no sessions exist
- **Nerd Font Icons**: Window names display with appropriate icons (󰚩 for Claude, etc.)
- **Clean Status Bar**: Session name in top-right, minimal styling

### Keybindings

| Key | Action |
|-----|--------|
| `Ctrl+A` | Prefix key |
| `Ctrl+F` | Open tmux-sessionizer (project picker) |
| `Ctrl+O` | Open GitHub URL of current repo |
| `x` | Kill pane (no confirmation) |
| `Prefix + I` | Install TPM plugins |

### Included Scripts

**`tmux-sessionizer`** (ThePrimeagen's)
- Fuzzy-find and switch between projects
- Searches `~/dev` (1 level deep) + home directory
- Config: `~/.config/tmux-sessionizer/tmux-sessionizer.conf`

**`tmux-start`**
- Auto-creates/attaches to "system" session in `~`
- Aliased as `tmux` command (add to `.zshrc` after stowing)

**`open-github`**
- Extracts GitHub URL from git remote
- Supports both SSH and HTTPS remotes
- Opens in browser with automatic window focus

**`xdg-open-focus`**
- Wrapper around `xdg-open`
- Automatically focuses opened windows in Hyprland
- Works with all browsers (Firefox, Chrome, Brave, etc.)

### Plugins (via TPM)

- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) - Sensible defaults
- [tmux-nerd-font-window-name](https://github.com/joshmedeski/tmux-nerd-font-window-name) - Icon-based window names
- [tmux-fzf-url](https://github.com/wfxr/tmux-fzf-url) - Quick URL opener

### Post-Installation

1. Install [TPM](https://github.com/tmux-plugins/tpm):
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

2. Add to `~/.zshrc`:
   ```bash
   alias tmux='~/.local/bin/tmux-start'
   ```

3. Install plugins: Open tmux and press `Prefix + I`

---

## Zsh Configuration

Minimal, fast zsh setup with essential aliases and completions.

### Post-Installation

After stowing, you'll need to manually add the tmux alias:

```bash
echo 'alias tmux="~/.local/bin/tmux-start"' >> ~/.zshrc
source ~/.zshrc
```

Check the stowed `.zshrc` for other aliases and configurations.

---

## Other Configurations

This repository also includes configurations for:

- **hypr** - Hyprland compositor
- **hyprpanel** - Hyprland panel
- **nvim** - Neovim
- **ghostty** - Ghostty terminal
- **kitty** - Kitty terminal
- **wofi** - Wofi launcher
- **tofi** - Tofi launcher
- **rofi** - Rofi launcher
- **i3** - i3 window manager
- **picom** - Compositor

Install any of these with `stow <name>`.

---

## Customization

Each stow directory is self-contained. Modify configurations in `~/dotfiles/<name>/` and re-stow:

```bash
cd ~/dotfiles
stow -R tmux  # Restow after changes
```

---

## License

Personal dotfiles - use at your own discretion.
