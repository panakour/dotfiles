{ config, pkgs, ... }:
{
  home-manager.users.${config.user}.programs.helix = with pkgs; {
    enable = true;
    defaultEditor = false;
    extraPackages = [
      golangci-lint
      golangci-lint-langserver
      gopls
      gotools
      rust-analyzer
    ];

    settings = {
      theme = "gruvbox_community";
    };

    themes = {
      # https://github.com/helix-editor/helix/blob/master/runtime/themes/gruvbox.toml
      gruvbox_community = {
        inherits = "gruvbox";
      };
    };

    languages = {
      language = [
        {
          name = "go";
          language-servers = [
            "gopls"
            "golangci-lint-lsp"
            "gpt"
          ];
          formatter = {
            command = "goimports";
          };
          auto-format = true;
        }
        {
          name = "json";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = [ "format" ];
            }
            "biome"
          ];
          formatter = {
            command = "biome";
            args = [
              "format"
              "--indent-style"
              "space"
              "--stdin-file-path"
              "file.json"
            ];
          };
          auto-format = true;
        }
        {
          name = "jsonc";
          language-servers = [
            {
              name = "vscode-json-language-server";
              except-features = [ "format" ];
            }
            "biome"
          ];
          formatter = {
            command = "biome";
            args = [
              "format"
              "--indent-style"
              "space"
              "--stdin-file-path"
              "file.jsonc"
            ];
          };
          file-types = [
            "jsonc"
            "hujson"
          ];
          auto-format = true;
        }
        {
          name = "markdown";
          language-servers = [
            "marksman"
            "gpt"
          ];
          formatter = {
            command = "prettier";
            args = [
              "--stdin-filepath"
              "file.md"
            ];
          };
          auto-format = true;
        }
        {
          name = "nix";
          formatter = {
            command = "nixfmt";
          };
          auto-format = true;
        }
        {
          name = "rust";
          language-servers = [
            "rust-analyzer"
            "gpt"
          ];
          auto-format = true;
        }
        {
          name = "toml";
          language-servers = [ "taplo" ];
          formatter = {
            command = "taplo";
            args = [
              "fmt"
              "-o"
              "column_width=120"
              "-"
            ];
          };
          auto-format = true;
        }
        {
          name = "yaml";
          language-servers = [ "yaml-language-server" ];
          formatter = {
            command = "prettier";
            args = [
              "--stdin-filepath"
              "file.yaml"
            ];
          };
          auto-format = true;
        }
      ];
    };
  };
}
