#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./xcode.sh
./homebrew.sh
./bash.sh
#
./git.sh
./../volta.sh
./browsers.sh
./compression_tools.sh
./gpg.sh
./image_tools.sh
./misc.sh
./misc_tools.sh
./../npm.sh
./tmux.sh
./video_tools.sh
./../vim.sh
./go.sh
./k8s.sh
./vscode.sh
./android.sh
./web_font_tools.sh
./lima_colima.sh
./python.sh
