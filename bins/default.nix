{ stdenv, ... }:
stdenv.mkDerivation {
  name = "panakour-bins";
  version = "unstable";
  src = ./bin;
  installPhase = ''
    mkdir -p $out/bin
    cp * $out/bin
  '';
}
