#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Flutter\n\n"

declare -r FLUTTER_DIRECTORY="$HOME/Code/flutter"

download_flutter() {
    execute "git clone https://github.com/flutter/flutter.git $FLUTTER_DIRECTORY" \
        "Download flutter"
}

add_path() {

    declare -r CONFIGS="export PATH=\$PATH:\$HOME/Code/flutter/bin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! grep -q "$CONFIGS" "$LOCAL_SHELL_CONFIG_FILE"; then
        execute "printf '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE" \
                "Flutter Added to path"
    fi

}

main() {
    if [ ! -d "$FLUTTER_DIRECTORY" ]; then
        download_flutter
        add_path
    fi
}

main
