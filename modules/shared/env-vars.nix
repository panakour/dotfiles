{ lib, pkgs, ... }:
{
  environment = {
    variables = {
      EDITOR = lib.getExe pkgs.neovim;
      VISUAL = lib.getExe pkgs.neovim;
    };
  };
}
