{ inputs, globals, ... }:
inputs.nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    globals
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../../modules/nixos
    {
      home-manager.users.${globals.user}.imports = [
        inputs.nix-index-database.hmModules.nix-index
      ];
    }
  ];
}
