#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PhpStorm\n\n"

declare -a CONFIG_DIRS=(
    "options"
    "codestyles"
    "keymaps"
)

linked_files() {
    for i in "${CONFIG_DIRS[@]}"; do
        phpStormConfigDir="$1/${i}"
        configDir="$(pwd)/config/$i"
        if [ "${i}" == "keymaps" ]; then
            configDir="$(pwd)/config/$i/$(get_os)"
        fi
        if [[ ! -e "$phpStormConfigDir" ]]; then
             mkdir -p $phpStormConfigDir
        fi
        execute \
        "ln -fs $configDir/* '$phpStormConfigDir'" \
        "$phpStormConfigDir → $configDir/*"
    done
}


if [ "$(get_os)" == "macos" ]; then
        find "$HOME/Library/Application Support/JetBrains" -maxdepth 1 -type d -name 'PhpStorm*' | while read line; do
            linked_files "$line"
        done

else
    find "$HOME/.config/JetBrains" -maxdepth 1 -type d -name 'PhpStorm*' | while read line; do
        linked_files "$line"
    done
fi



