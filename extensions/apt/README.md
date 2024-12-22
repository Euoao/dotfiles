# Package Installation Guide

Install the following software packages using the `apt` package manager.

Note: Make sure you have sufficient permissions (root/sudo) to install packages.

## [bat](https://github.com/sharkdp/bat)
A cat clone with syntax highlighting and Git integration.
```bash
sudo apt install -y bat
```

## [eza](https://github.com/eza-community/eza)
A modern replacement for ls written in Rust.
```bash
sudo apt install -y eza
```
### Additional Notes for eza

If `eza` is not available in your default package repositories, you may need to:

First make sure you have the `gpg` command, and otherwise install it via:

    ```bash
    sudo apt update
    sudo apt install -y gpg
    ```

Then install eza via:

    ```bash
    sudo mkdir -p /etc/apt/keyrings
    wget -qO- https://raw.githubusercontent.com/eza-community/eza/main/deb.asc | sudo gpg --dearmor -o /etc/apt/keyrings/gierens.gpg
    echo "deb [arch=amd64 signed-by=/etc/apt/keyrings/gierens.gpg] http://deb.gierens.de stable main" | sudo tee /etc/apt/sources.list.d/gierens.list
    sudo chmod 644 /etc/apt/keyrings/gierens.gpg /etc/apt/sources.list.d/gierens.list
    ```

## [fd](https://github.com/sharkdp/fd)
A simple, fast and user-friendly alternative to 'find'.
```bash
sudo apt install -y fd-find
```

## [ripgrep (rg)](https://github.com/BurntSushi/ripgrep)
A line-oriented search tool that recursively searches directories for a regex pattern.
```bash
sudo apt install -y ripgrep
```


