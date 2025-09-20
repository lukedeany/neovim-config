# Yay packages
yay_packages=("jdtls")

# Pacman packages
pacman_packages=("clang")

# Pip packages
pip_packages=("python-lsp-server[all]")

# Install java language server
yay --diffmenu=false --answerclean=NotInstalled --norebuild --noredownload --noconfirm --needed -S ${yay_packages[@]}

# Instally python language server
sudo pacman --noconfirm --needed -S ${pacman_packages[@]}

# Path the venv pip
~/.virtualenvs/pip/bin/pip install -q ${pip_packages[@]}
