#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Laradock\n\n"

declare -r LARADOCK_DIRECTORY="$HOME/Code/laradock"

download_laradock() {
    execute "git clone https://github.com/laradock/laradock.git $LARADOCK_DIRECTORY" \
        "Download laradock"
}

prepare() {
    execute "cp $LARADOCK_DIRECTORY/env-example $LARADOCK_DIRECTORY/.env"
    set_xdebug
    set_memcached
}

set_xdebug() {
    execute "sed -i 's/INSTALL_XDEBUG=false/INSTALL_XDEBUG=true/g' $LARADOCK_DIRECTORY/.env" \
        "Set xdebug"
}

set_memcached() {
    execute "sed -i 's/INSTALL_MEMCACHED=false/INSTALL_MEMCACHED=true/g' $LARADOCK_DIRECTORY/.env" \
        "Set memcached"
}

build_images_and_create_containers() {
    execute "cd $LARADOCK_DIRECTORY && \
        docker-compose create --build workspace php-fpm nginx mysql" \
        "Build images and create containers"
}

if [ ! -d "$LARADOCK_DIRECTORY" ]; then
    download_laradock
    prepare
    build_images_and_create_containers
else
    prepare
    build_images_and_create_containers
fi