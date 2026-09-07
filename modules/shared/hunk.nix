{ config, ... }:
{
  home-manager.users.${config.user} = {
    xdg.configFile."hunk/config.toml" = {
      text = ''
        theme = "gruvbox-dark-hard"
        sidebar = true
      '';
    };
  };
}
