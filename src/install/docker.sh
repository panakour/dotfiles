#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Docker\n\n"

execute \
    "sudo apt-get install \
        apt-transport-https \
        ca-certificates \
        gnupg-agent \
        software-properties-common" \
    "Install packages to allow apt to use a repository over HTTPS"

execute \
    "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -" \
    "Add Docker’s official GPG key"

execute \
    "sudo apt-key fingerprint 0EBFCD88" \
    "Verify key"

execute \
    "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -" \
    "Add Docker’s official GPG key"

execute \
    "sudo add-apt-repository \
      'deb [arch=amd64] https://download.docker.com/linux/ubuntu \
       $(lsb_release -cs) \
       stable'"

update

install_package "Docker" "docker-ce"

if [ ! "$(getent group docker)" ]; then
    execute "sudo groupadd docker"
fi

execute "sudo usermod -aG docker $USER"

execute "sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose \
        && sudo chmod +x /usr/local/bin/docker-compose" \
        "Install docker-compose"