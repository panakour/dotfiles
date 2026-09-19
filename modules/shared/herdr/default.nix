{ config, ... }:
{
  home-manager.users.${config.user} = {
    xdg.configFile."herdr/config.toml".source = ./config.toml;
  };
}
