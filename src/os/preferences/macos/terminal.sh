#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

execute "./set_terminal_theme.applescript" \
    "Set custom terminal theme"

# Ensure the Touch ID is used when `sudo` is required.

if ! grep -q "pam_tid.so" "/etc/pam.d/sudo"; then
    execute "sudo sh -c 'echo \"auth sufficient pam_tid.so\" >> /etc/pam.d/sudo'" \
        "Use Touch ID to authenticate sudo"
fi
