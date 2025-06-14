{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.fish.shellInit = ''
      fish_add_path -a /opt/homebrew/bin/
    '';
  };
}
