{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d0f2758381caca8b4fb4a6cac61721cc9de06bd9.tar.gz") {} }:

pkgs.mkShell {
  packages = [
    pkgs.bat
    pkgs.emacs29
    pkgs.exa
    pkgs.figlet
    pkgs.fish
    pkgs.fzf
    pkgs.gitFull
    pkgs.gnumake
    pkgs.jq
    pkgs.keychain
    pkgs.meld
    pkgs.neovim
    pkgs.qpdf
    pkgs.ripgrep
    pkgs.sqlite
    pkgs.sshfs
    pkgs.stow
    pkgs.xclip
  ];

  shellHook = ''
    exec fish
  '';

  EDITOR = "nvim";
}
