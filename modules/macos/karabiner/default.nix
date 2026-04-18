{ config, ... }: {
  # Karabiner-Elements itself is installed via homebrew cask (see homebrew.nix).
  # The nix-darwin module `services.karabiner-elements` is currently broken with
  # Karabiner v15+ — tracked in nix-darwin#1041 / PR #1679. Revisit once that lands.
  #
  # Out-of-store symlink: karabiner.json stays writable so the Karabiner-Elements
  # UI can still persist changes. Edit either in the UI or in the repo — both stay
  # in sync because this is a real symlink to a mutable path, not the nix store.
  home-manager.users.${config.user} = { config, ... }: {
    home.file.".config/karabiner/karabiner.json".source =
      config.lib.file.mkOutOfStoreSymlink
        "${config.home.homeDirectory}/Code/dotfiles/modules/macos/karabiner/karabiner.json";
  };
}
