#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Keyboard\n\n"

execute "defaults write -g AppleKeyboardUIMode -int 3" \
    "Enable full keyboard access for all controls"

execute "defaults write -g ApplePressAndHoldEnabled -bool false" \
    "Disable press-and-hold in favor of key repeat"

execute "defaults write -g KeyRepeat -int 1" \
    "Set the key repeat rate to fast"
