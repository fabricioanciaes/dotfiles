sudo pacman -Sy zsh stow 
chsh -s $(which zsh)
clear
echo "Changed shell, type exit and reopen the terminal"
echo "you might want to run 'stow zsh' from your home directory to make use of this repo"
