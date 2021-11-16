#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   MySQL Workbench\n\n"

execute \
    "cd ~/Downloads && curl -O https://dev.mysql.com/get/Downloads/MySQLGUITools/mysql-workbench-community_8.0.21-1ubuntu20.04_amd64.deb \
    && sudo apt -y install ./mysql-workbench-community_8.0.21-1ubuntu20.04_amd64.deb" \
    "Install"
