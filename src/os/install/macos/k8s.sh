#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   K8s\n\n"

brew_install "kubectl" "kubectl"
brew_install "kustomize" "kustomize"
brew_install "k3d" "k3d"
brew_install "kubeseal" "kubeseal"
