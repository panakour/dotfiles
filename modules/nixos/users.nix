{ config, ... }:
{
  users.users.${config.user} = {
    password = "CHANGEME";
    extraGroups = [
      "wheel"
    ];
    isNormalUser = true;
  };

}
