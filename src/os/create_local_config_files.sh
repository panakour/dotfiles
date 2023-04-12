#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

create_bash_local() {

    declare -r FILE_PATH="$HOME/.bash.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

   if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        DOTFILES_BIN_DIR="$(dirname "$(pwd)")/bin/"

        printf "%s\n" \
"#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions.

PATH=\"$DOTFILES_BIN_DIR:\$PATH\"

export PATH" \
        >> "$FILE_PATH"
   fi

    print_result $? "$FILE_PATH"

}

create_gitconfig_local() {

    declare -r FILE_PATH="$HOME/.gitconfig.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ] || [ -z "$FILE_PATH" ]; then

        printf "%s\n" \
"[gpg]
   format = ssh

 [gpg ssh]
   program = /Applications/1Password.app/Contents/MacOS/op-ssh-sign

 [commit]
   gpgsign = true

[user]

    name = panakour
    email = panakourweb@gmail.com
    # signingkey =" \
        >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

create_vimrc_local() {

    declare -r FILE_PATH="$HOME/.vimrc.local"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    if [ ! -e "$FILE_PATH" ]; then
        printf "" >> "$FILE_PATH"
    fi

    print_result $? "$FILE_PATH"

}

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    print_in_purple "\n • Create local config files\n\n"

    create_bash_local
    create_gitconfig_local
    create_vimrc_local

}

main
