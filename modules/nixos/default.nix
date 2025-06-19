{
  # version of *installation*, do not edit on installed system!
  system.stateVersion = "25.05";

  imports = [
    ../shared
    ./boot.nix
    ./desktop.nix
    ./ssh.nix
    ./bluetooth.nix
    ./docker.nix
    ./packages.nix
    ./users.nix
    ./zed.nix
  ];
}
