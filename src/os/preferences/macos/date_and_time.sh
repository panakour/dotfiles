#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Date & Time\n\n"

execute "defaults write com.apple.menuextra.clock Show24Hour -bool true" \
    "Set 24hour clock"
