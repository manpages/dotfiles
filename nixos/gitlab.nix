{ ... }:
{ pkgs, config, ... }:

{ 
  services.gitlab = { 
    enable = true;
    databasePassword = "insecure";
  };
}
