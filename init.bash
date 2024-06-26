# UPDATE / UPGRADE
sudo apt update -y
sudo apt upgrade -y

# APT PACKAGES
sudo apt install -y \
  build-essential \
  cmake \
  python3-pip \
  python3-venv \
  python3-neovim \
  npm \
  luarocks \
  unzip \
  stow \
  fzf \
  fuse \
  xclip \
  openssh-server\
  valgrind\
  kcachegrind\
  ripgrep\
  fd-find

#NODEJS
sudo npm install -g n
sudo n latest
sudo n prune
sudo rm /usr/bin/nodejs
sudo ln -s /usr/local/bin/node /usr/bin/nodejs

# STOW
stow --adopt .
git restore .

# ZOXIDE
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash

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

# AstroNVIM optionals
## Providers
# python3 -m pip install neovim
sudo npm install -g neovim
## Lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
LAZYGIT_URL="https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
curl -Lo lazygit.tar.gz $LAZYGIT_URL 
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm lazygit lazygit.tar.gz
## GDU
curl -L https://github.com/dundee/gdu/releases/latest/download/gdu_linux_amd64.tgz | tar xz
chmod +x gdu_linux_amd64
sudo mv gdu_linux_amd64 /usr/bin/gdu
# BTU
BOTTOM_VERSION=$(curl -s "https://api.github.com/repos/ClementTsang/bottom/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
BOTTOM_URL="https://github.com/ClementTsang/bottom/releases/latest/download/bottom_${BOTTOM_VERSION}_amd64.deb"
curl -Lo bottom.deb $BOTTOM_URL 
sudo dpkg -i bottom.deb
rm bottom.deb
## tree-sitter-cli
sudo npm install -g tree-sitter-cli

# Cloudflared
sudo mkdir -p --mode=0755 /usr/share/keyrings
curl -fsSL https://pkg.cloudflare.com/cloudflare-main.gpg | sudo tee /usr/share/keyrings/cloudflare-main.gpg >/dev/null
# echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/cloudflared.list
echo "deb [signed-by=/usr/share/keyrings/cloudflare-main.gpg] https://pkg.cloudflare.com/cloudflared jammy main" | sudo tee /etc/apt/sources.list.d/cloudflared.list
sudo apt-get update && sudo apt-get install cloudflared

