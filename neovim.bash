# NVIM
wget https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod +x nvim.appimage
sudo mv nvim.appimage /usr/bin/nvim

# AstroNVIM custom repo
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
git clone git@github.com:M4D-A/AstroNvimConfig.git ~/.config/nvim

sudo npm install -g neovim
sudo npm install -g tree-sitter-cli
