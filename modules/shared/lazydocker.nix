{ config, ... }:
{
  home-manager.users.${config.user}.programs.lazydocker = {
    enable = true;
  };
}
