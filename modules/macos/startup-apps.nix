{ config, pkgs, ... }:

{
  launchd.user.agents = {

    hammerspoon = {
      serviceConfig = {
        Label = "hammerspoon";
        ProgramArguments = [
          "/usr/bin/open"
          "-a"
          "Hammerspoon"
        ];
        RunAtLoad = true;
        KeepAlive = {
          SuccessfulExit = false;
          Crashed = true;
        };
      };
    };

    orbstack = {
      serviceConfig = {
        Label = "orbstack";
        ProgramArguments = [
          "/usr/bin/open"
          "-a"
          "OrbStack"
        ];
        RunAtLoad = true;
        KeepAlive = {
          SuccessfulExit = false;
          Crashed = true;
        };
      };
    };

    ghostty = {
      serviceConfig = {
        Label = "ghostty";
        ProgramArguments = [
          "/usr/bin/open"
          "-a"
          "Ghostty"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };

    thunderbird = {
      serviceConfig = {
        Label = "thunderbird";
        ProgramArguments = [
          "/usr/bin/open"
          "-a"
          "Thunderbird"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };

    slack = {
      serviceConfig = {
        Label = "slack";
        ProgramArguments = [
          "/usr/bin/open"
          "-a"
          "Slack"
        ];
        RunAtLoad = true;
        KeepAlive = false;
      };
    };
  };
}
