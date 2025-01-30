# PRE UPDATE / UPGRADE
sudo apt-get update -y
sudo apt-get upgrade -y

# APT-GET BASIC PACKAGES
sudo apt-get install -y \
  build-essential \
  curl \
  fd-find \
  fzf \
  gh \
  git \
  htop \
  libfuse2 \
  ripgrep \
  tmux \
  unzip \
  wget \
  xclip

# POST UPDATE / UPGRADE (JUST IN CASE)
sudo apt-get update -y
sudo apt-get upgrade -y
