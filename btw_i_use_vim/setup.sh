#!/bin/bash

SCRIPT_PATH="$( readlink -f "$BASH_SOURCE[0]" )"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
SCRIPT_DIR="$( cd "$SCRIPT_DIR" && pwd)"
echo "MyConfig is located at: '$SCRIPT_DIR'"

echo "We will now beign setting up your user..."

python3 "$SCRIPT_DIR/helper_scripts/dot_files.py"

echo "Setting up vim..."
rm -rf ~/.vim
mkdir -p ~/.vim/autoload
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugClean! +PlugInstall +PlugUpdate +qall
echo "vim setup!"

echo "Adding one final utility..."
chmod +x "$SCRIPT_DIR/helper_scripts/dev.sh"
echo "alias dev='$SCRIPT_DIR/helper_scripts/dev.sh'" >> ~/.bash_aliases

echo "Setup done, we will now reload the shell!"
source ~/.bashrc
