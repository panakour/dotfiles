#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Region & Language\n\n"

execute "gsettings set org.gnome.desktop.input-sources sources \"[('xkb', 'us'), ('xkb', 'gr')]\"" \
    "Set input sources"