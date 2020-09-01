#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

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

add_path() {
    declare -r CONFIGS="export PATH=\$PATH:'$FLUTTER_BIN_DIRECTORY'"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! grep -q "$CONFIGS" "$LOCAL_SHELL_CONFIG_FILE"; then
        execute "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE" \
                "Added to path"
    fi
}

main() {
    if [ ! -d "$FLUTTER_DIRECTORY" ]; then
        download_flutter
        add_path
    fi
}

main
