#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export DIR=${SCRIPT_DIR}/tmp

curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

sudo mv ${DIR}/lazydocker /usr/local/bin

rmdir ${SCRIPT_DIR}/tmp


if [ ! -f "${HOME}/.config/lazydocker/config.yml" ]; then
    mkdir -p "${HOME}/.config/lazydocker"
    ln -s "${SCRIPT_DIR}/config.yml" "${HOME}/.config/lazydocker/config.yml"
fi
