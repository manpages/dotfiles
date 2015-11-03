{ device, ... }:
{ ... }:

{
  boot.loader.grub = {
    enable = true;
    version = 2;
    device = device;
  };
}
