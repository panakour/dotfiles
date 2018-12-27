#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

install_package "Docker" "docker.io"
install_package "MySQL Workbench" "mysql-workbench"
install_package "Transmission" "transmission"
install_package "VLC" "vlc"