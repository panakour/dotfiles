{ config, ... }: {

  home-manager.users.${config.user}.programs.zed-editor = {
    enable = true;
  };
}
