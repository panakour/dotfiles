#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Android \n\n"                                :

# Install Android stuff
brew_install "Android sdk" "android-sdk" "--cask"
brew_install "Android Studio" "android-studio" "--cask"