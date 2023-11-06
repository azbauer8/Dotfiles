#!/bin/bash

# Define an array of objects with "source" and "dest" properties
objects=(
  {"source":"$HOME/.zshrc","dest":"$HOME/Dotfiles/Mac/zsh/.zshrc"}
  {"source":"$HOME/.config/yabai/yabairc","dest":"$HOME/Dotfiles/Mac/Yabai/yabairc"}
  {"source":"$HOME/.config/skhd/skhdrc","dest":"$HOME/Dotfiles/Mac/Yabai/skhdrc"}
)

# Iterate through the objects array
for object in "${objects[@]}"; do
  source_path=$(echo "$object" | jq -r '.source')
  dest_path=$(echo "$object" | jq -r '.dest')

  # Check if the "dest" path exists
  if [ -e "$dest_path" ]; then
    echo "Deleting existing destination path: $dest_path"
    rm -rf "$dest_path"
  fi

  # Create a symbolic link from "source" to "dest"
  echo "Creating symbolic link from $source_path to $dest_path"
  ln -s "$source_path" "$dest_path"
done
