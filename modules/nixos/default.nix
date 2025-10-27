{ config, lib, ... }:
{
  imports = [
    ../shared
    ./boot.nix
    ./desktop.nix
    ./ssh.nix
    ./bluetooth.nix
    ./docker.nix
    ./packages.nix
    ./users.nix
  ];

  options = {
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };

    personal.enable = lib.mkEnableOption "Personal setup";
  };

  config = {
    # version of *installation*, do not edit on installed system!
    system.stateVersion = "25.05";

    home-manager = {
      backupFileExtension = "backup";
      useGlobalPkgs = true;
      useUserPackages = false;
    };
  };
}
