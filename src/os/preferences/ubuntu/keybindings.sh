#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Keybindings\n\n"

execute "gsettings set org.gnome.desktop.wm.keybindings maximize \"['<Primary><Super>Return']\"" \
    "maximize key to <Primary><Super>Return"

execute "gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-left \"['<Primary><Alt><Super>Left']\"" \
    "move-to-monitor-left <Primary><Alt><Super>Left"

execute "gsettings set org.gnome.desktop.wm.keybindings move-to-monitor-right \"['<Primary><Alt><Super>Right']\"" \
    "move-to-monitor-right <Primary><Alt><Super>Right"
