{ config, ... }:
{
  services.openssh = {
    enable = true;
    settings = {
      PasswordAuthentication = true;
      PermitRootLogin = "no";
      X11Forwarding = false;
    };
    ports = [ 22 ];
  };

  # Open SSH port in firewall
  networking.firewall = {
    enable = true;
    allowedTCPPorts = [ 22 ];
  };

  # Ensure the user exists and has proper setup
  users.users.${config.user} = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
    ];
    openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIAiKtd3C6+vbE1u2rkj9UXV6C9k6BcbwWApPQ80g0M14"
    ];
  };

  # Enable sudo for wheel group
  security.sudo.wheelNeedsPassword = false;
}
