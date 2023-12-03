# shell.nix

{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    ruby
    rubyfmt
    solargraph
    rufo
    bundler
    bundix
    # Add any other Ruby dependencies you need here
  ];

  shellHook = ''
    echo "Entering Ruby environment"
  '';
}
