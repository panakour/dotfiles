#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Autostart\n\n"

find . -name '*.desktop' | while read line; do
    execute \
    "ln -fs $(pwd)/$line $HOME/.config/autostart/$line" \
    "$HOME/.config/autostart/$line → $(pwd)/$line"
done