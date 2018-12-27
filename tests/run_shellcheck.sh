#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && source "../src/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    # ' At first you're like "shellcheck is awesome" but then you're
    #   like "wtf are we still using bash" '.
    #
    #  (from: https://twitter.com/astarasikov/status/568825996532707330)

    find \
        ../tests \
        ../src/shell \
        ../src/install \
        ../src/preferences \
        -type f \
        ! -path '../src/shell/curlrc' \
        ! -path '../src/shell/inputrc' \
        -exec shellcheck \
                -e SC1090 \
                -e SC1091 \
                -e SC2155 \
                -e SC2164 \
        {} +

    print_result $? "Run code through ShellCheck"

}

main