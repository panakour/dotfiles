{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      just
      openjdk17
      ffmpeg
      mkcert
      coreutils
      devenv
      zstd
      opentofu
      packer
      hcloud
      yt-dlp
      snitch
    ];
  };
}
