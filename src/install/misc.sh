#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

install_package "MySQL Workbench" "mysql-workbench"
install_package "Transmission" "transmission"
install_package_via_snap "VLC media player" "vlc"
install_package "FileZilla" "filezilla"
install_package_via_snap "PhpStorm" "phpstorm" "--classic"
install_package_via_snap "GoLand" "goland" "--classic"