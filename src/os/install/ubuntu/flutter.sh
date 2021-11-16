#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Flutter\n\n"

declare -r FLUTTER_DIRECTORY="$HOME/Code/flutter"
declare -r FLUTTER_BIN_DIRECTORY="$FLUTTER_DIRECTORY/bin"

download_flutter() {
    execute "git clone https://github.com/flutter/flutter.git $FLUTTER_DIRECTORY -b stable --depth 1" \
        "Download"
    execute "$FLUTTER_BIN_DIRECTORY/flutter precache" \
        "Pre-download development binaries"
}

add_to_path() {
    declare -r -a FILES_TO_PATH=(
        "$FLUTTER_BIN_DIRECTORY"
    )

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_PATH[@]}"; do
        declare CURRENT_PATH="export PATH=\$PATH:$i"
        if ! grep -q "$CURRENT_PATH" "$LOCAL_SHELL_CONFIG_FILE"; then
            execute "printf '%s\n' '$CURRENT_PATH' >> $LOCAL_SHELL_CONFIG_FILE" \
                "$i Added to path"
        fi
    done
}

main() {
    if [ ! -d "$FLUTTER_DIRECTORY" ]; then
        download_flutter
        add_to_path
    fi
}

main
