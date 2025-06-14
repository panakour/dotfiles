{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.lazygit = {
      enable = true;
    };
  };
}
