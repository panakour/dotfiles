{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      kubectl
      kustomize
      k3d
      kubie
      k9s
    ];
  };
}
