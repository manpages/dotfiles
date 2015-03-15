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
      ./pentest.nix
      ./hydra.nix
      ./virtualbox.nix
      ./grub2.nix
      /root/udev.nix
    ];

  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  nix.trustedBinaryCaches = [ "http://hydra.nixos.org" "http://hydra.cryp.to" ];
  nix.binaryCaches        = [ "https://cache.nixos.org" "http://hydra.nixos.org" "http://hydra.cryp.to" ];

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
                                 pkgs.unzip
                                 pkgs.nettools
                                 pkgs.vpnc
                                 pkgs.linuxConsoleTools
                                 pkgs.psmisc
                                 pkgs.lm_sensors
                                 pkgs.kexectools
                                 pkgs.figlet
                                 pkgs.gnupg
                                 pkgs.tcpdump
                                 pkgs.strace
                                 pkgs.traceroute
                                 pkgs.nmap
                                 pkgs.openssl
                                 pkgs.gcc
                                 pkgs.gnupg21
                                 pkgs.mtools
                                 pkgs.cdrkit
                                 pkgs.syslinux
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

  users.extraUsers.guest = {
    name = "guest";
    group = "users";
    uid = 1001;
    createHome = true;
    home = "/home/guest";
    shell = "/run/current-system/sw/bin/bash";
  };

  users.extraUsers.dork = {
    name = "dork";
    group = "users";
    uid = 1002;
    createHome = true;
    home = "/home/dork";
    shell = "/run/current-system/sw/bin/bash";
  };

  users.extraUsers.android = {
    name = "android";
    group = "wheel";
    uid = 1003;
    createHome = true;
    home = "/home/android";
    shell = "/run/current-system/sw/bin/bash";
  };

  users.extraGroups.vboxusers.members = [ "sweater" ];

  services.cron = {
    enable = true;
    cronFiles = [ "/root/cron.conf" ];
  };

  services.openvpn.enable = true;

}
