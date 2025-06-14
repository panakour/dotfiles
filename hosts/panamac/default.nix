{ inputs, globals, ... }:
inputs.nix-darwin.lib.darwinSystem {
  system = "aarch64-darwin";
  modules = [
    globals
    inputs.mac-app-util.darwinModules.default
    inputs.home-manager.darwinModules.home-manager
    ../../modules/macos
    {
      home-manager.users.${globals.user}.imports = [
        inputs.mac-app-util.homeManagerModules.default
        inputs.nix-index-database.hmModules.nix-index
      ];
    }
  ];
}
