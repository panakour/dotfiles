#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Finder\n\n"

execute "defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true && \
         defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true && \
         defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true" \
    "Automatically open a new Finder window when a volume is mounted"

execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
    "Search the current directory by default"

execute "defaults write com.apple.finder FXPreferredViewStyle -string 'Nlsv'" \
    "Use list view in all Finder windows by default"

execute "defaults write com.apple.finder NewWindowTarget -string 'PfDe' && \
         defaults write com.apple.finder NewWindowTargetPath -string 'file://$HOME/Desktop/'" \
    "Set 'Desktop' as the default location for new Finder windows"

execute "defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true && \
         defaults write com.apple.finder ShowMountedServersOnDesktop -bool true && \
         defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true" \
    "Show icons for hard drives, servers, and removable media on the desktop"

execute "defaults write com.apple.finder ShowRecentTags -bool false" \
    "Do not show recent tags"

execute "defaults write -g AppleShowAllExtensions -bool true" \
    "Show all filename extensions"

killall "Finder" &> /dev/null

killall "cfprefsd" &> /dev/null
