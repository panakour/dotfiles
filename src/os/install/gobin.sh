#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {
     declare -r GOBIN="export PATH=\$PATH:\$(go env GOPATH)/bin"
    if ! grep -q "$GOBIN" "$LOCAL_SHELL_CONFIG_FILE"; then

    print_in_purple "\n   go bin path\n\n"

        declare -r CONFIGS="
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
$GOBIN
"
    execute \
        "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE \
            && . $LOCAL_SHELL_CONFIG_FILE" \
        "Update $LOCAL_SHELL_CONFIG_FILE"
    fi

}


main
