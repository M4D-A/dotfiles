echo "Say the magic word"

#Force passwd check - so you can cancel the script :V
sudo -K
sudo echo ""
if [ $? != 0 ] ; then 
  echo "Bad luck"
  exit 42
fi

declare -a packages=(
  "apt"
  "node"

  "btu"
  "cloudflared"
  "gdu"
  "gh"
  "lazygit"
  "neovim"
  "tmux"
  "zoxide"

  "stow"
)

for name in "${packages[@]}"
do
  echo -n "Installing ${name} packages... "
  bash "packages/${name}.bash" > "${name}.out" 2> "${name}.err"
  OK=$?
  if [ ${OK} -eq 0 ] ; then 
    rm ${name}.out ${name}.err
    echo "✓"
  else
    echo "✗ (${OK}), check ${name}[.err|.out] files"
  fi
done
