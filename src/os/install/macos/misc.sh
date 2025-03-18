#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Miscellaneous\n\n"

brew_install "Android File Transfer" "android-file-transfer" "--cask"
brew_install "eyeD3" "eye-d3"
brew_install "Rectangle" "rectangle" "--cask"
brew_install "Unarchiver" "the-unarchiver" "--cask"
brew_install "VLC" "vlc" "--cask"
brew_install "Signal" "signal" "--cask"
brew_install "Discord" "discord" "--cask"
brew_install "Teamviewer" "teamviewer" "--cask"
brew_install "Thunderbird" "thunderbird" "--cask"
brew_install "Figma" "figma" "--cask"
brew_install "PhpStorm" "phpstorm" "--cask"
brew_install "Goland" "goland" "--cask"
brew_install "DBeaver" "dbeaver-community" "--cask"
brew_install "ProtonVPN" "protonvpn" "--cask"
brew_install "OpenVPN" "openvpn-connect" "--cask"
