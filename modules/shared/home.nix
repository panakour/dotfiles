{ config, pkgs, lib, ... }:
let
  userName = config.user;
  homeDir = if pkgs.stdenv.isDarwin then "/Users/${userName}" else "/home/${userName}";
in
{
  config.home-manager.users.${userName} = {
    options.dotfilesPath = lib.mkOption {
      type = lib.types.str;
      default = "${homeDir}/Code/dotfiles";
      description = "Path to the dotfiles repo checkout on disk, used for out-of-store symlinks.";
    };

    config.home = {
      # changelog for this version: https://nix-community.github.io/home-manager/release-notes.xhtml
      stateVersion = "25.05";
      username = userName;
      homeDirectory = homeDir;
    };
  };
}
