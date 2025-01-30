# NVIM - Vim-fork focused on extensibility and usability
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

sudo npm install -g neovim
sudo npm install -g tree-sitter-cli

# AstroNVIM custom repo
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
git clone https://github.com/M4D-A/AstroNvimConfig.git ~/.config/nvim

# Startup NVIM to install plugins
nvim --headless "+Lazy! sync" +qa
