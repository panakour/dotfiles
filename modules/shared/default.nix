{ config, lib, ... }:
{
  imports = [
    ./env-vars.nix
    ./base-packages.nix
    ./fish
    ./direnv.nix
    ./git.nix
    ./shell.nix
    ./tmux
    ./nix-index.nix
    ./nix.nix
    ./helix.nix
    ./ghostty.nix
    ./bins.nix
    ./misc.nix
    ./search.nix
    ./go.nix
    ./node.nix
    ./neovim
    ./atuin.nix
    ./lazygit.nix
    ./k8s.nix
    ./lazydocker.nix
    ./python.nix
  ];

  config.home-manager = {
    backupFileExtension = "backup";
    useGlobalPkgs = true;
    useUserPackages = false;

    # changelog for this version: https://nix-community.github.io/home-manager/release-notes.xhtml
    users.${config.user}.home.stateVersion = "25.05";
  };

  options = {
    user = lib.mkOption {
      type = lib.types.str;
      description = "Primary user of the system";
    };

    personal.enable = lib.mkEnableOption "Personal setup";
  };
}
