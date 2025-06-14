{
  # version of *installation*, do not edit on installed system!
  system.stateVersion = "25.05";

  imports = [
    ../shared
    ./boot.nix
    ./docker.nix
    ./networking.nix
    ./ssh.nix
  ];
}
