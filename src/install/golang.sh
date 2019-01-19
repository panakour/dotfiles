#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh" \
    && . "./utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


add_path() {

    declare -r CONFIGS="export PATH=\$PATH:$(go env GOPATH)/bin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    execute "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE" \
            "go bin dir to PATH"

}

main() {

print_in_purple "\n   Golang\n\n"

    install_package_via_snap "Golang" "go" "--classic"
    add_path

}

main