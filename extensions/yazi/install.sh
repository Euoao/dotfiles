#!/bin/bash
set -e

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
CONFIG_DIR="${XDG_CONFIG_HOME:-${HOME}/.config}/yazi"

if ! command -v yazi >/dev/null; then
    package="$(mktemp --suffix=.deb)"
    trap 'rm -f "$package"' EXIT
    curl -fL https://github.com/sxyazi/yazi/releases/latest/download/yazi-x86_64-unknown-linux-gnu.deb -o "$package"
    sudo apt install -y "$package"
fi

mkdir -p "$CONFIG_DIR"
for config in yazi.toml keymap.toml package.toml; do
    target="$CONFIG_DIR/$config"
    if [ -e "$target" ] && [ ! -L "$target" ]; then
        mv --backup=numbered "$target" "$target.backup"
    fi
    ln -sfn "$SCRIPT_DIR/$config" "$target"
done

ya pkg install
