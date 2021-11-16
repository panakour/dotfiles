#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"

#execute "gsettings set org.gnome.desktop.background picture-options 'stretched'" \
#    "Set desktop background image options"

#execute "gsettings set org.gnome.libgnomekbd.keyboard layouts \"[ 'us', 'gr' ]\"" \
#    "Set keyboard languages"

#execute "gsettings set com.canonical.Unity.Launcher favorites \"[
#            'ubiquity-gtkui.desktop',
#            'nautilus-home.desktop'
#         ]\"" \
#    "Set Launcher favorites"

execute "gsettings set com.canonical.Unity.Lenses remote-content-search 'none'" \
    "Turn off 'Remote Search' so that search terms in Dash do not get sent over the internet"
