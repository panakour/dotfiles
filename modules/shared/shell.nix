{ config, pkgs, ... }:
{
  environment.shells = [ pkgs.fish ];

  users.users.${config.user} = {
    shell = pkgs.fish;
  };
  home-manager.users.${config.user} = {
    programs.zoxide = {
      enable = true;
    };
  };
}
