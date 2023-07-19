{ pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/d0f2758381caca8b4fb4a6cac61721cc9de06bd9.tar.gz") {} }:

pkgs.mkShell {
  packages = [
    pkgs.autojump
    pkgs.asciidoctor-with-extensions
    pkgs.bat
    pkgs.emacs29
    pkgs.exa
    pkgs.figlet
    pkgs.fira-code
    pkgs.fira-code-symbols
    pkgs.fish
    pkgs.fzf
    pkgs.gitFull
    pkgs.gnumake
    pkgs.jq
    pkgs.keychain
    pkgs.libtool
    pkgs.meld
    pkgs.mosh
    pkgs.neovim
    pkgs.qpdf
    pkgs.ripgrep
    pkgs.sqlite
    pkgs.sshfs
    pkgs.stow
    pkgs.tmux
    pkgs.xclip
  ];

  shellHook = ''
    export SHELL_TYPE="$SHELL_TYPE Unidev "
    exec fish
  '';

  EDITOR = "nvim";
  GIT_SSH = "/usr/bin/ssh";
}
