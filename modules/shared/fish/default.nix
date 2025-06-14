{ config, pkgs, ... }:
{
  programs.fish.enable = true;

  home-manager.users.${config.user} =
    { config, ... }:
    {
      programs.fish = {
        enable = true;
        shellInit = ''
          if test -f ~/.localrc.fish
              source ~/.localrc.fish
          end
        '';
        interactiveShellInit = ''
          set fish_greeting
          fish_config theme choose gruvbox
          fish_add_path -p ~/.nix-profile/bin /nix/var/nix/profiles/default/bin
          set -a fish_complete_path ~/.nix-profile/share/fish/completions/ ~/.nix-profile/share/fish/vendor_completions.d/
          set hydro_color_pwd brcyan
          set hydro_color_git brmagenta
          set hydro_color_error brred
          set hydro_color_prompt brgreen
          set hydro_color_duration bryellow
          set hydro_multiline true
        '';
        plugins = [
          {
            name = "hydro";
            src = pkgs.fishPlugins.hydro.src;
          }
        ];
        shellAliases = {
          d = "docker";
          dps = "docker ps --format \"table {{.ID}}\\t{{.Names}}\\t{{.Ports}}\\t{{.Status}}\"";

          g = "git";
          gs = "git status";
          ga = "git add";
          gc = "git commit -m";
          gp = "git push";
          gl = "git pull";
          gd = "git diff";
          gco = "git checkout";
          gb = "git branch";
          glog = "git log --oneline -10";
          glg = "git log --graph --decorate --oneline --abbrev-commit";

          gmt = "go mod tidy";
          grm = "go run ./...";

          # neovim
          e = "nvim";
          v = "nvim";

          tm = "tmux new -A -s default";

        };
      };

      xdg.configFile."fish/functions" = {
        #WIP this is not working currently source = config.lib.file.mkOutOfStoreSymlink ./functions;
        source = config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/Code/nixdotfiles/modules/shared/fish/functions";
      };

      xdg.configFile."fish/themes/gruvbox.theme" = {
        text = ''
          # Gruvbox Dark
          fish_color_normal ebdbb2
        '';
      };

    };

}
