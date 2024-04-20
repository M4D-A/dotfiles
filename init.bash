sudo apt update -y
sudo apt upgrade -y

# STOW
sudo apt install -y stow
stow --adopt .

# ZOXIDE & FZF
curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash
sudo apt install -y fzf

