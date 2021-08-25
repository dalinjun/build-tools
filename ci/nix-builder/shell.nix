with import (builtins.fetchTarball {
  name = "nixos-unstable";
  sha256 = "14szn1k345jfm47k6vcgbxprmw1v16n7mvyhcdl7jbjmcggjh4z7";
  url = "https://github.com/NixOS/nixpkgs/archive/253aecf69ed7595aaefabde779aa6449195bebb7.tar.gz";
}) {};

mkShell {
  buildInputs = import ./basepkgs.nix pkgs;
}
