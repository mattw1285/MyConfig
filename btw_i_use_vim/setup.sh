#!/bin/bash

SCRIPT_PATH="$( readlink -f "$BASH_SOURCE[0]" )"
SCRIPT_DIR="$(dirname "$SCRIPT_PATH")"
SCRIPT_DIR="$( cd "$SCRIPT_DIR" && pwd)"
echo "MyConfig is located at: '$SCRIPT_DIR'"

echo "We will now beign setting up your user..."

sudo apt install python3 -y
python3 "$SCRIPT_DIR/helper_scripts/dot_files.py"

echo "alias dev='source $SCRIPT_DIR/dev_py.sh'" >> ~/.bash_aliases
