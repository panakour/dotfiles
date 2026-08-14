{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      openjdk17
      ffmpeg
      coreutils
      zstd
    ];
  };
}
