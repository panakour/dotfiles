{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {

    #broken on darwin
    home.packages = pkgs.lib.optional (!pkgs.stdenv.isDarwin) pkgs.ghostty;

    xdg.configFile."ghostty/config" = {
      text = ''
        # vi:ft=conf
        #
        # https://ghostty.org/docs/config/reference
        #
        theme = gruvbox-material
        auto-update-channel = tip
        # makes it maximizes the window
        window-height = 9999
        window-width = 9999
        mouse-hide-while-typing = true
        clipboard-read = "allow"
        clipboard-paste-protection = false
      '';
    };
  };
}
