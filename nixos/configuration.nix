# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ ./lenovoThinkPadE530c.nix
      ./xserver.nix
      ./croatia.nix
      ./i3.nix
      ./unfree.nix
      ./windows.nix
    ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    device = "/dev/sda";
  };

  networking.hostName = "brainstorm"; 

  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  environment.systemPackages = [ pkgs.gitAndTools.gitFull
                                 pkgs.vimHugeX
                                 pkgs.screen
                                 pkgs.tmux
                                 pkgs.htop
                                 pkgs.mosh
                                 pkgs.autossh
                                 pkgs.acpi
                                 pkgs.proxychains
                                 pkgs.nginx
                               ];
  environment.shellInit = 
    ''
      NIX_PATH=/nix/var/nix/profiles/per-user/root/channels/nixos
      NIX_PATH=$NIX_PATH:bleeding=/root/nixpkgs
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

  services.nginx = {
    enable = true;
    config = "/root/nginx.conf";
  };

}
