{ config, pkgs, ... }: {
  home-manager.users.${config.user} = {
    home.file.".tmux.conf" = {
      source = ./tmux.conf;
    };
    programs.tmux = {
        enable = true;
        plugins = with pkgs.tmuxPlugins; [
            sensible
            yank
            vim-tmux-navigator
        ];
        extraConfig = builtins.readFile ./tmux.conf;
    };
  };
}
