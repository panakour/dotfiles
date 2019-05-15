#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PhpStorm\n\n"

declare -a CONFIG_DIRS=(
    "options"
    "fileTemplates/includes"
    "codestyles"
    "keymaps"
)

find "$HOME" -maxdepth 1 -type d -name '.PhpStorm*' | while read line; do

    for i in "${CONFIG_DIRS[@]}"; do

        phpStormConfigDir="$line/config/${i}"
        configDir="$(pwd)/config/$i"
        if [[ ! -e "$phpStormConfigDir" ]]; then
             mkdir -p $phpStormConfigDir
        fi
        execute \
        "ln -fs $configDir/* $line/config/${i}" \
        "$line/config/${i} → $configDir/*"
    done

done
