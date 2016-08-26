{ device, ... }:
{ pkgs, ... }:

{
  boot = {
    kernelPackages = pkgs.linuxPackages_3_18;
      loader.grub = {
        enable = true;
        version = 2;
        device = device;
      };
  };
}
