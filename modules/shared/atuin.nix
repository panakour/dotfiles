{ config, lib, pkgs, ... }:
let
  version = "18.10.0";
  releaseBase = "https://github.com/atuinsh/atuin/releases/download/v${version}";

  platformArchives = {
    "x86_64-linux" = {
      archive = "atuin-x86_64-unknown-linux-musl.tar.gz";
      hash = "sha256-O9469p2fyIYzxDSIxs48EWxkJzPZI7v0xCJBCDEL1k0=";
    };
    "aarch64-linux" = {
      archive = "atuin-aarch64-unknown-linux-musl.tar.gz";
      hash = "sha256-L+Rq1TgXygUmmKaHmpKIQHG6R1pdPXKf6RJvRpULxhk=";
    };
    "x86_64-darwin" = {
      archive = "atuin-x86_64-apple-darwin.tar.gz";
      hash = "sha256-A7ekKAYtTZU/RQ5SFknAbyndliw3/nW2CMpTxqyPBwY=";
    };
    "aarch64-darwin" = {
      archive = "atuin-aarch64-apple-darwin.tar.gz";
      hash = "sha256-mslhjPV7z+Vh1T0FOf/um4GFKGsR87Mw3yb+NdBkEfE=";
    };
  };

  mkBinaryPackage =
    system:
    let
      attrs = lib.attrByPath [ system ] null platformArchives;
    in
    if attrs == null then
      pkgs.atuin
    else
      let
        archiveDir = lib.removeSuffix ".tar.gz" attrs.archive;
      in
      pkgs.stdenvNoCC.mkDerivation {
        pname = "atuin";
        inherit version;
        src = pkgs.fetchurl {
          url = "${releaseBase}/${attrs.archive}";
          hash = attrs.hash;
        };
        dontUnpack = true;

        installPhase = ''
          runHook preInstall
          tmpdir=$(mktemp -d)
          trap 'rm -rf "$tmpdir"' EXIT

          tar -C "$tmpdir" -xzf "$src"
          mkdir -p "$out/bin"
          cp "$tmpdir/${archiveDir}/atuin" "$out/bin/atuin"
          chmod +x "$out/bin/atuin"

          runHook postInstall
        '';

        meta = pkgs.atuin.meta // {
          inherit version;
          platforms = [ system ];
        };
      };

  package = mkBinaryPackage pkgs.stdenv.hostPlatform.system;
in
{
  home-manager.users.${config.user}.programs.atuin = {
    enable = true;
    package = package;
    settings = {
      enter_accept = true;
      inline_height = 20;
      update_check = false;
      style = "compact";
    };
  };
}
