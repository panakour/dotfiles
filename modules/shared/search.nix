{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.fd = {
      enable = true;
      ignores = [ ".git/" ];
      hidden = true;
    };

    programs.ripgrep = {
      enable = true;
    };

    programs.fzf = {
      enable = true;
      enableFishIntegration = true;
    };

  };
}
