#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   tmuxinator\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

if ! package_is_installed "ruby"; then
    install_package "Ruby" "ruby"
fi

execute \
    "sudo gem install tmuxinator" \
    "Install tmuxinator"

execute \
    "sudo wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.bash -O /etc/bash_completion.d/tmuxinator.bash" \
    "Auto Completion"
