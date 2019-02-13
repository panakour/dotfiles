#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   PhpStorm\n\n"

find "$HOME" -maxdepth 1 -type d -name '.PhpStorm*' | while read line; do
    execute \
    "ln -fs $(pwd)/config/options/* $line/config/options/" \
    "$line/config/options/ → $(pwd)/config/options/*"
    execute \
    "ln -fs $(pwd)/config/fileTemplates/includes/* $line/config/fileTemplates/includes/" \
    "$line/config/fileTemplates/includes/ → $(pwd)/config/fileTemplates/includes/*"
    execute \
    "ln -fs $(pwd)/config/codestyles/* $line/config/codestyles/" \
    "$line/config/codestyles/ → $(pwd)/config/codestyles/*"
done