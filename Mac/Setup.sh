#!/bin/bash

mappings=(
  "source=\"~/.gitconfig\" dest=\"$PWD/../Global/Git/.gitconfig"
  "source=\"~/Library/Application Support/Code/User/settings.json\" dest=\"$PWD/../Global/VSCode/settings.json"
  "source=\"~/Library/Application Support/Code/User/keybindings.json\" dest=\"$PWD/../Global/VSCode/keybindings.json"
)

for mapping in "${mappings[@]}"; do
  source_dest=($mapping)
  source="$(eval echo ${source_dest[0]#*=})"
  dest="${source_dest[1]#*=}"

  echo "Creating symlink for $source -> $dest"

  if [ -e "$source" ]; then
    rm -f "$source"
  fi

  ln -s "$dest" "$source"
done
