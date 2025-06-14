{ config, pkgs, ... }:
{
  users.knownUsers = [ config.user ];

  users.users.${config.user} = {
    uid = 501; # needed https://github.com/nix-darwin/nix-darwin/issues/1237
    home = "/Users/${config.user}";
  };
}
