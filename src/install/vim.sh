#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

install_vim() {
    install_package "Vim" "vim"
}

install_plugins() {

    declare -r VIM_PACK_DIR="$HOME/.vim/pack"
    declare -r MINPAC_DIR="$VIM_PACK_DIR/minpac/opt/minpac"
    declare -r MINPAC_GIT_REPO_URL="https://github.com/k-takata/minpac.git"

    # - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

    # Install plugins.

    execute \
        "rm -rf $VIM_PACK_DIR \
            && git clone --quiet $MINPAC_GIT_REPO_URL $MINPAC_DIR" \
        "Install plugins" \
        || return 1

    vim +PluginsSetup

}

install_vim
install_plugins
