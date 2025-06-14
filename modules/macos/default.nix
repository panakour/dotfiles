{
  # changelog for stateVersion: https://github.com/nix-darwin/nix-darwin/blob/master/CHANGELOG
  system.stateVersion = 6;

  imports = [
    ../shared
    ./nix.nix
    ./system.nix
    ./homebrew.nix
    ./touch-id.nix
    ./fish.nix
    ./users.nix
    ./hammerspoon
    ./startup-apps.nix
  ];
}
