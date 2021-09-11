pkgs: with pkgs; [
  cargo
  clippy
  libiconv
  rustc
  rustfmt
] ++ (
  lib.optionals stdenv.hostPlatform.isDarwin [
    darwin.apple_sdk.frameworks.Security
  ]
)
