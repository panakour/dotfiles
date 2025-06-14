{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.uv = {
      enable = true;
    };
  };
}
