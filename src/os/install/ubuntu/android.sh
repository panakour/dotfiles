#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"


declare -r LOCAL_SHELL_CONFIG_FILE="$HOME/.bash.local"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Android\n\n"

declare -r ANDROID_HOME="$HOME/Android/Sdk"

install() {
    install_package_via_snap "Android Studio" "android-studio" "--classic"
}

add_to_path() {
    declare -r -a FILES_TO_PATH=(
        "$ANDROID_HOME/emulator"
        "$ANDROID_HOME/tools"
        "$ANDROID_HOME/tools/bin"
        "$ANDROID_HOME/platform-tools"
    )

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    for i in "${FILES_TO_PATH[@]}"; do
        declare CURRENT_PATH="export PATH=\$PATH:$i"
        if ! grep -q "$CURRENT_PATH" "$LOCAL_SHELL_CONFIG_FILE"; then
            execute "printf '%s\n' '$CURRENT_PATH' >> $LOCAL_SHELL_CONFIG_FILE" \
                "$i Added to path"
        fi
    done
}

main() {
    install
    add_to_path
}

main
