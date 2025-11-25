{ inputs, globals, ... }:
inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  modules = [
    globals
    inputs.home-manager.darwinModules.home-manager
    ../../modules/macos
    {
      home-manager.users.${globals.user}.imports = [
        inputs.nix-index-database.homeModules.nix-index
      ];
    }
  ];
}
