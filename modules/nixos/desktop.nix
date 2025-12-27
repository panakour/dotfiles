{ config, lib, ... }:
let
  mkTuple = if lib ? hm && lib.hm ? gvariant then lib.hm.gvariant.mkTuple else lib.gvariant.mkTuple;
in
{
  # Enable the X11 windowing system
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment
  services.displayManager.gdm.enable = true;
  services.desktopManager.gnome.enable = true;

  programs.dconf = {
    enable = true;
    profiles.user.databases = [
      {
        settings = {
          "org/gnome/desktop/input-sources" = {
            sources = [
              (mkTuple [
                "xkb"
                "us"
              ])
              (mkTuple [
                "xkb"
                "gr"
              ])
            ];
            xkb-options = [ "grp:win_space_toggle" ];
          };
        };
      }
    ];
  };

  # Enable CUPS to print documents
  services.printing.enable = true;

  # Enable sound with pipewire
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };
}
