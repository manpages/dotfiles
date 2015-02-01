{ config, pkgs, ... }:

{
  networking.hostName = "brainstorm"; 

  imports =
    [ ./lenovoThinkPadE530c.nix
      ./xserver.nix
      ./croatia.nix
      ./i3.nix
      ./unfree.nix
      ./windows.nix
      ./nginx.nix
      ./haskell.nix
    ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  environment.systemPackages = [ pkgs.nix-repl
                                 pkgs.gitAndTools.gitFull
                                 pkgs.vimHugeX
                                 pkgs.screen
                                 pkgs.tmux
                                 pkgs.htop
                                 pkgs.mosh
                                 pkgs.autossh
                                 pkgs.acpi
                                 pkgs.proxychains
                                 pkgs.nginx
                                 pkgs.httpie
                                 pkgs.w3m
                                 pkgs.lynx
                                 pkgs.ncurses
                                 pkgs.newsbeuter
                                 pkgs.sshfsFuse
                                 pkgs.wget
                                 pkgs.curl
                                 pkgs.unrar
                                 pkgs.nettools
                                 pkgs.linuxConsoleTools
                                 pkgs.kexectools
                                 pkgs.postgresql
                                 pkgs.figlet
                               ];
  environment.shellInit = 
    ''
      NIX_PATH=/nix/var/nix/profiles/per-user/root/channels/nixos
      NIX_PATH=$NIX_PATH:nixpkgs=/nixpkgs
      NIX_PATH=$NIX_PATH:nixos-config=/etc/nixos/configuration.nix
      export NIX_PATH
    '';

  users.extraUsers.sweater = {
    name = "sweater";
    group = "wheel";
    uid = 1000;
    createHome = true;
    home = "/home/sweater";
    shell = "/run/current-system/sw/bin/bash";
  };

  services.cron = {
    enable = true;
    cronFiles = [ "/root/cron.conf" ];
  };

}
