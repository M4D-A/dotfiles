# BTU
BOTTOM_VERSION=$(curl -s "https://api.github.com/repos/ClementTsang/bottom/releases/latest" | grep -Po '"tag_name": "\K[^"]*')
BOTTOM_URL="https://github.com/ClementTsang/bottom/releases/latest/download/bottom_${BOTTOM_VERSION}_amd64.deb"
curl -Lo bottom.deb $BOTTOM_URL 
sudo dpkg -i bottom.deb
rm bottom.deb
