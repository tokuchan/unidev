{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d0f2758381caca8b4fb4a6cac61721cc9de06bd9.tar.gz") {} }:

pkgs.mkShell {
  packages = [
    pkgs.emacs29
    pkgs.fish
  ];

  shellHook = ''
    exec fish
  '';
}
