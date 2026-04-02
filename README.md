# NixOS & nix-darwin Dotfiles

A declarative configuration for my environment using Nix flakes, supporting both macOS (via nix-darwin) and NixOS systems.

## macOS Requirements

1. Nix
2. Xcode Command Line Tools
```bash
xcode-select --install
```
3. Homebrew

For the first activation on a fresh macOS machine, run:

```bash
sudo -H "$(command -v nix)" --extra-experimental-features 'nix-command flakes' run github:nix-darwin/nix-darwin/master#darwin-rebuild -- switch --flake .#panamac
```

## 🚀 Features

- **Cross-platform**: Works on macOS (nix-darwin) and NixOS
- **Declarative**: Everything configured through Nix
- **Modular**: Clean separation of concerns with reusable modules
- **Home Manager**: Unified user environment management
- **Flake-based**: Modern Nix flakes for reproducible builds

### Some of the development tools
- **[Ghostty](https://ghostty.org/)** - Pretty nice GPU accelerated Cross-platform terminal emulator
- **[Fish Shell](https://fishshell.com/)** - User-friendly command line shell
- **[Neovim](https://neovim.io/)** - Vim-based text editor with LazyVim
- **[Tmux](https://github.com/tmux/tmux)** - Terminal multiplexer
- Gruvbox color scheme theme in terminal.

[license]: LICENSE.md
