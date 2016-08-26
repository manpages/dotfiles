{ ... }:
{ pkgs, config, ... }:

{ 
   virtualisation.docker = {
    enable = true;
    storageDriver = "devicemapper";
  };
}
