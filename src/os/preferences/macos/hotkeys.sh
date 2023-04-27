#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Hotkeys\n\n"

execute "defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 160 '
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>97</integer>
        <integer>0</integer>
        <integer>524288</integer>
      </array>
    </dict>
  </dict>
'" \
  "Show Launchpad (⌥+A)"

execute "defaults write com.apple.symbolichotkeys.plist AppleSymbolicHotKeys -dict-add 61 '
  <dict>
    <key>enabled</key><true/>
    <key>value</key><dict>
      <key>type</key><string>standard</string>
      <key>parameters</key>
      <array>
        <integer>32</integer>
        <integer>49</integer>
        <integer>524288</integer>
      </array>
    </dict>
  </dict>
'" \
  "Select next input source (⌥+Space)"

execute "defaults write com.google.Chrome NSUserKeyEquivalents -dict-add 'View Source' -string '^u'" \
  "Google Chrome View Source (^U)"

execute "defaults write com.google.Chrome NSUserKeyEquivalents -dict-add 'Show Full History' -string '^h'" \
  "Google Chrome Show History (^H)"
