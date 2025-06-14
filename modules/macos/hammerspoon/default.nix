{ config, pkgs, ... }: {
  home-manager.users.${config.user} = {
    home.file.".hammerspoon/init.lua" = {
      source = ./init.lua;
    };
  };
}
