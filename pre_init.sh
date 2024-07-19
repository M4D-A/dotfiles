sudo apt update && sudo apt-get install wget -y

sudo mkdir -p -m 755 /etc/apt/keyrings
wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null
sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg
GH_REPO=$(echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main")
echo $GH_REPO | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null

sudo apt update sudo apt install -y gh git
gh auth login
gh repo clone dotfiles
cd dotfiles
sudo bash init.bash
