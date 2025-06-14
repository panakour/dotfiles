{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    programs.fish.interactiveShellInit = ''
      direnv hook fish | source
    '';
  };
}
