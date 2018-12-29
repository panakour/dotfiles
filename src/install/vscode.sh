#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Visual Studio Code\n\n"

if ! package_is_installed "code"; then

    execute "sudo add-apt-repository -y 'deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main'"
    execute "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EB3E94ADBE1229CF"
    execute "sudo apt update"
    execute "sudo apt -y install code"

fi
