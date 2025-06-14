{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      bun
      biome
      deno
      fnm
      pnpm
    ];

    programs.fish.interactiveShellInit = ''
      fnm env --use-on-cd | source
    '';

    home.sessionVariables = {
      NODE_OPTIONS = "--max-old-space-size=8192";
    };
  };
}
