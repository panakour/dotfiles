#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

find "$HOME" -name '.PhpStorm*' | while read line; do
    execute \
    "ln -fs $(pwd)/config/options/* $line/config/options/" \
    "$line/config/options/ → $(pwd)/config/options/*"
done