# wicd config
{...}:

{
  networking = {
    useDHCP = false;
    wireless.enable = false;
    wicd.enable = true;
    dhcpcd.extraConfig = "nohook resolv.conf";
  };
}
