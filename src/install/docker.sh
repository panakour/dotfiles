#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Docker\n\n"

install_package "Docker" "docker.io"
install_package "Docker Compose" "docker-compose"

if [ ! "$(getent group docker)" ]; then
    execute "sudo groupadd docker"
fi

execute "sudo usermod -aG docker $USER"