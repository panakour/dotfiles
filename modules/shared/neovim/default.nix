{ config, ... }:
{
  home-manager.users.${config.user} =
    { config, pkgs, ... }:
    {

      home.packages = with pkgs; [
        nixfmt
        nixd
      ];

      xdg.configFile."nvim" = {
        source = config.lib.file.mkOutOfStoreSymlink "${config.dotfilesPath}/modules/shared/neovim/lazyvim";
      };

      programs = {

        neovim = {
          enable = true;
          defaultEditor = true;
          vimAlias = true;
          vimdiffAlias = true;
          sideloadInitLua = true;
        };

      };
    };
}
