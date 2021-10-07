#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" &&
    . "../utils.sh" &&
    . "./utils.sh"

declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

add_path() {

    declare -r CONFIGS="export PATH=\$PATH:/usr/local/go/bin"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if ! grep -q "$CONFIGS" "$LOCAL_SHELL_CONFIG_FILE"; then
        execute "printf '%s' '$CONFIGS' >> $LOCAL_SHELL_CONFIG_FILE" \
            "go bin dir to PATH"
    fi

}

main() {
    print_in_purple "\n   Golang\n\n"
    VERSION="1.17.1"
    ARCH="amd64"
    TAR_FILE="go${VERSION}.linux-${ARCH}.tar.gz"
    curl -O -L "https://golang.org/dl/${TAR_FILE}"
    tar -C /usr/local -xzf ${TAR_FILE}
    rm ${TAR_FILE}
    add_path
}

main
