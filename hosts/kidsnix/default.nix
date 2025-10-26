{ inputs, globals, ... }:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/nixos/boot.nix
    ../../modules/nixos/desktop.nix
    ../../modules/nixos/users.nix
    ../../modules/nixos/ssh.nix
    ../../modules/shared/nix.nix
    ../../modules/shared/nix-index.nix
    ../../modules/shared/ghostty.nix
    ../../modules/shared/neovim
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
        options.user = lib.mkOption {
          type = lib.types.str;
          description = "Primary user of the system";
        };

        config = {
          user = user;
          system.stateVersion = "25.05";
          networking.hostName = "kidsnix";

          services.displayManager.autoLogin = {
            enable = true;
            user = user;
          };

          services.gnome.gnome-keyring.enable = lib.mkForce false;

          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
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
