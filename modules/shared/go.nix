{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {

    programs.go = {
      enable = true;
      package = pkgs.go_1_24;
      goPath = "go";
    };
  };
}
