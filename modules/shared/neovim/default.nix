{ config, ... }:
{
  home-manager.users.${config.user} =
    { config, pkgs, ... }:
    {

      home.packages = with pkgs; [
        nixfmt-rfc-style
        nixd
      ];

      xdg.configFile."nvim" = {
        # WIP: link out of nix store should have full path otherwise is not workign  source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}"./lazyvim;
        # more info https://github.com/nix-community/home-manager/issues/2085 should be refactored in the future
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Code/nixdotfiles/modules/shared/neovim/lazyvim";

      };

      programs = {

        neovim = {
          enable = true;
          defaultEditor = true;
          vimAlias = true;
          vimdiffAlias = true;
        };

      };
    };
}
