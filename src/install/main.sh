#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

update
upgrade

./build-essentials.sh
./browsers.sh
./nvm.sh
./docker.sh
#./compression_tools.sh
./git.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./npm.sh
./tmux.sh
./vim.sh
./vscode.sh
./laradock.sh

./cleanup.sh
