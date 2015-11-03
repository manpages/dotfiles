{ name, fw ? false, ssh ? false, ... }:
{ ... }:
{
  networking.hostName = name;
  networking.firewall.enable = fw;
  services.openssh.enable = ssh;
  networking.extraHosts = ''
  127.0.0.1 local.host
  127.0.0.1 thoughtflare
  212.142.125.56 memorici.de
  52.29.9.186 dreamcatcher
  52.28.207.193 rootrunner
  '';
}
