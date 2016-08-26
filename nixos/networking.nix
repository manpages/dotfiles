{ name, fw ? false, ssh ? false, sshPorts ? [22], ... }:
{ ... }:
{
  networking = {
    hostName = name;
    firewall = {
      enable = fw;
      allowedUDPPorts = [ 1194 ];
      allowedTCPPorts = [ 1194 ];
    };
    extraHosts = ''
      127.0.0.1 thoughtflare
      127.0.0.1 local.host
    '';
  };
  services.openssh.enable = ssh;
  services.openssh.ports = sshPorts;
}
