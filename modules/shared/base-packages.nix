{ pkgs, ... }:
{
  environment = {
    systemPackages = with pkgs; [
      curl
      wget
      nss.tools
    ];
  };
}
