echo "Say the magic word"

# Force passwd check - so you can cancel the script :V
sudo -K
sudo echo ""
if [ $? != 0 ] ; then 
  echo "Bad luck"
  exit 42
fi

declare -a packages=(
  "_apt" # Must be kept first, contains most critical dependencies
  "_node" # Must be kept above all node/npm related packages
  "_python"

  "coding"
  "cpp"
  "gdu"
  "gh"
  "lazygit"
  "lua"
  "neovim"
  "zoxide"
)

declare -a optional=(
  "cloudflared"
  "john"
)

for name in "${packages[@]}"
do
  echo -n "Installing ${name} packages... "
  bash "packages/${name}.bash" > "${name}.out" 2> "${name}.err"
  STATUS=$?
  if [ ${STATUS} -eq 0 ] ; then 
    rm ${name}.out ${name}.err
    echo "✓"
  else
    echo "✗ (${STATUS}), check ${name}[.err|.out] files"
  fi
done

# FINAL UPDATE / UPGRADE (JUST IN CASE)^2
sudo apt-get update -y
sudo apt-get upgrade -y

stow .
# git restore .
