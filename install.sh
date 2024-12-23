#!/bin/bash

# Get the directory of the current script and cd into it
ROOTDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$ROOTDIR"

# Execute config setup script
if [ -f "config_setup.sh" ]; then
  echo "-----> Executing config setup script"
  bash config_setup.sh
fi

# Execute all install.sh scripts in extensions directory
for install_script in ${ROOTDIR}/extensions/*/install.sh; do
  if [ -f "$install_script" ]; then
    echo "-----> Executing $install_script"
    bash "$install_script"
  fi
done

echo "🎉 Installation completed!"
