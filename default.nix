# shell.nix

{ pkgs ? import <nixpkgs> { } }:
let
  ruby = pkgs.ruby;
  gems = pkgs.bundlerEnv {
    name = "AoC2023 packages";
    inherit ruby;
    gemdir = ./.;
  };
in pkgs.mkShell {
  buildInputs = with pkgs; [ ruby rubyfmt solargraph rufo bundler bundix gems ];

  shellHook = ''
    echo "Entering Ruby environment"
  '';
}
