declare -a packages=(
  "apt"
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


