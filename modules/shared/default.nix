{ config, lib, ... }:
{
  imports = [
    ./home.nix
    ./env-vars.nix
    ./base-packages.nix
    ./fish
    ./direnv.nix
    ./git.nix
    ./shell.nix
    ./tmux
    ./nix-index.nix
    ./nix.nix
    ./helix.nix
    ./ghostty.nix
    ./bins.nix
    ./misc.nix
    ./search.nix
    ./go.nix
    ./node.nix
    ./neovim
    ./atuin.nix
    ./lazygit.nix
    ./k8s.nix
    ./lazydocker.nix
    ./python.nix
  ];
}
