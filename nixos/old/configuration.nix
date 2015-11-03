# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./unfree.nix
      ./xserver.nix
      ./i3.nix
      ./croatia.nix
      ./windows.nix
      ./grub2.nix
    ];

  nix.trustedBinaryCaches = [ "http://hydra.nixos.org" ];

  networking.hostName        = "chill";
  hardware.bumblebee.enable  = true;

  environment.systemPackages = import ./packages.nix { pkgs = pkgs; role = "laptop";};
  users.extraUsers           = import ./users.nix    { role = "laptop"; };
  boot.kernelPackages        = pkgs.linuxPackages_3_18;

  networking.firewall.enable = false;
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  # services.xserver.enable = true;
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable the KDE Desktop Environment.
  # services.xserver.displayManager.kdm.enable = true;
  # services.xserver.desktopManager.kde4.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  # users.extraUsers.guest = {
  #   isNormalUser = true;
  #   uid = 1000;
  # };

}
