#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "../../utils.sh" \
    && . "./utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   K8s\n\n"


install_package_via_snap "kubectl" "kubectl" "--classic"
execute \
    "wget -q -O - https://raw.githubusercontent.com/k3d-io/k3d/main/install.sh | bash" \
    "k3d"
