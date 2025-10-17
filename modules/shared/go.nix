{ config, pkgs, ... }:
{
  home-manager.users.${config.user} =
    { config, ... }:
    {
      programs.go = {
        enable = true;
        package = pkgs.go_1_25;
        env.GOPATH = "${config.home.homeDirectory}/go";
      };
    };
}
