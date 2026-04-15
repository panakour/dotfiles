{ config, pkgs, ... }:
{
  home-manager.users.${config.user}.programs.atuin = {
    enable = true;
    package = pkgs.atuin;
    settings = {
      enter_accept = true;
      inline_height = 20;
      update_check = false;
      style = "compact";
    };
  };
}
