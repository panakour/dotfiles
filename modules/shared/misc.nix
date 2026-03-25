{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      just
      openjdk17
      ffmpeg
      coreutils
      zstd
      yt-dlp
      snitch
    ];
  };
}
