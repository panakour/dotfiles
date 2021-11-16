#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Autostart\n\n"

mkdir -p "$HOME"/.config/autostart

find ./apps/ -type f -name '*.desktop' | awk -F/ '{print $NF}' | while read line; do
    execute \
    "ln -fs $(pwd)/apps/$line $HOME/.config/autostart/$line" \
    "$HOME/.config/autostart/$line → $(pwd)/apps/$line"
done
