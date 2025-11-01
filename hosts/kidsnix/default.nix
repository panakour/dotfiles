{ inputs, globals, ... }:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    globals
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/nixos
    ../../modules/nixos/amd-gpu.nix
    (
      {
        config,
        lib,
        pkgs,
        ...
      }:
      let
        user = globals.user;
      in
      {
        config = {
          user = user;
          networking.hostName = "kidsnix";

          services.displayManager.autoLogin = {
            enable = true;
            user = user;
          };

          services.gnome.gnome-keyring.enable = lib.mkForce false;

          home-manager.users.${user} = {
            imports = [
              inputs.nix-index-database.homeModules.nix-index
            ];

            home.stateVersion = "25.05";
            home.packages = with pkgs; [
              brave
              pavucontrol
            ];
          };
        };
      }
    )
  ];
}
