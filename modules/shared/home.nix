{ config, pkgs, ... }:
{
  config.home-manager.users.${config.user}.home = {
    # changelog for this version: https://nix-community.github.io/home-manager/release-notes.xhtml
    stateVersion = "25.05";
    username = config.user;
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/${config.user}" else "/home/${config.user}";
  };

}
