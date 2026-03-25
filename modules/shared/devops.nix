{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf config.devops.enable {
    home-manager.users.${config.user}.home.packages = with pkgs; [
      mkcert
      devenv
      opentofu
      packer
      hcloud
    ];
  };
}
