{ pkgs, ... }:
{
  nix.maxJobs = 0;
  nix.distributedBuilds = true;
  nix.buildMachines = [
    { hostName = "192.168.1.102";
      maxJobs  = 4;
      sshKey   = "/etc/nixos/id_rsa";
      sshUser  = "root";
      system   = "x86_64-linux";
    }
  ];
}
