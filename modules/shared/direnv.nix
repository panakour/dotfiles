{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    programs.direnv = {
      enable = true;
      package = pkgs.direnv.overrideAttrs (_: { doCheck = false; });
      nix-direnv.enable = true;
    };

    programs.fish.interactiveShellInit = ''
      direnv hook fish | source
    '';
  };
}
