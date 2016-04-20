{ name, fw ? false, ssh ? false, sshPorts ? [22], ... }:
{ ... }:
{
  networking.hostName = name;
  networking.firewall.enable = fw;
  services.openssh.enable = ssh;
  services.openssh.ports = sshPorts;
}
