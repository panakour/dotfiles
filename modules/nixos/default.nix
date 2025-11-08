{
  system.stateVersion = "25.05";

  imports = [
    ../shared
    ./boot.nix
    ./desktop.nix
    ./ssh.nix
    ./bluetooth.nix
    ./packages.nix
    ./timezone.nix
    ./users.nix
  ];

}
