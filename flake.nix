{
  description = "nixos, nix-darwin, and home-manager configs";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    mac-app-util = {
      url = "github:hraban/mac-app-util";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

  };

  outputs =
    inputs:
    let
      globals = {
        user = "panakour";
      };
    in
    rec {
      nixosConfigurations = {
        pananixserver = import ./hosts/pananixserver { inherit inputs globals; };
        pananix = import ./hosts/pananix { inherit inputs globals; };
      };

      darwinConfigurations = {
        panamac = import ./hosts/panamac { inherit inputs globals; };
      };

      homeConfigurations = {
        pananix = nixosConfigurations.pananix.config.home-manager.users.${globals.user}.home;
        panamac = darwinConfigurations.panamac.config.home-manager.users.${globals.user}.home;
      };
    };
}
