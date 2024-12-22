#!/bin/bash

# Define a function which rename a `target` file to `target.backup` if the file
# exists and if it's a 'real' file, ie not a symlink
backup() {
  target=$1
  if [ -e "$target" ]; then
    if [ ! -L "$target" ]; then
      mv "$target" "$target.backup"
      echo "-----> Moved your old $target config file to $target.backup"
    fi
  fi
}

symlink() {
  file=$1
  link=$2
  if [ ! -e "$link" ]; then
    echo "-----> Symlinking your new $link"
    ln -s $file $link
  fi
}

# Get the directory of the current script and cd into it
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOTDIR"

echo ${ROOTDIR}

# For all files `$name` in the present folder except `*.sh`, `.md`,
# backup the target file located at `~/.$name` and symlink `user/$name` to `~/.$name`
for file in ${ROOTDIR}/user/*; do
  if [ -f "$file" ] && [[ ! "$file" =~ \.(sh|md)$ ]]; then
    name=$(basename "$file")
    target="$HOME/.$name"
    backup "$target"
    symlink "$file" "$target"
  fi
done


# Execute all install.sh scripts in extensions directory
for install_script in ${ROOTDIR}/extensions/*/install.sh; do
  if [ -f "$install_script" ]; then
    echo "-----> Executing $install_script"
    bash "$install_script"
  fi
done

# Refresh the current terminal with the newly installed configuration
exec zsh


echo "🎉 Installation completed!"