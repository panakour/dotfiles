{ config, ... }:
{
  home-manager.users.${config.user} =
    { config, lib, ... }:
    {
      services.flameshot = {
        enable = true;
        settings.General = {
          disabledTrayIcon = true;
          showHelp = false;
          showStartupLaunchMessage = false;
          copyPathAfterSave = false;
          savePath = "${config.home.homeDirectory}/Pictures/Screenshots";
        };
      };

      home.activation.flameshotScreenshotsDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
        run mkdir -p "${config.home.homeDirectory}/Pictures/Screenshots"
      '';
    };
}
