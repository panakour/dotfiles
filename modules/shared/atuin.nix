{ config, lib, ... }:
{
  home-manager.users.${config.user} = {
    xdg.configFile."atuin/config.toml".text = ''
      enter_accept = true
      inline_height = 20
      update_check = false
      style = "compact"
    '';
    programs.fish.interactiveShellInit = lib.mkAfter ''
      atuin init fish | source
    '';
  };
}
