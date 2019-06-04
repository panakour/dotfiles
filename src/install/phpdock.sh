#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PhpDock\n\n"

declare -r PHPDOCK_DIRECTORY="$HOME/Code/phpdock"

download_phpdock() {
    execute "git clone https://github.com/panakour/phpdock $PHPDOCK_DIRECTORY" \
        "Download phpdock"
}

prepare() {
    execute "cp $PHPDOCK_DIRECTORY/.env-example $PHPDOCK_DIRECTORY/.env && \
        docker-compose -f docker-compose.yml -f docker-compose.local.yml up --no-start" \
        "Prepare phpdock"
}


if [ ! -d "$PHPDOCK_DIRECTORY" ]; then
    download_phpdock
    prepare
fi