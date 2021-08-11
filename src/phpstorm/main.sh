#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PhpStorm\n\n"

declare -a CONFIG_DIRS=(
    "options"
    "codestyles"
    "keymaps"
)

find "$HOME/.config/JetBrains" -maxdepth 1 -type d -name 'PhpStorm*' | while read line; do

    for i in "${CONFIG_DIRS[@]}"; do

        phpStormConfigDir="$line/${i}"
        configDir="$(pwd)/config/$i"
        if [[ ! -e "$phpStormConfigDir" ]]; then
             mkdir -p $phpStormConfigDir
        fi
        execute \
        "ln -fs $configDir/* $phpStormConfigDir" \
        "$phpStormConfigDir → $configDir/*"
    done

done
