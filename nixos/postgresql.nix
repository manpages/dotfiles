{ ... }:
{ pkgs, config, ... }:

{ 
  services.postgresql = {
    package = pkgs.postgresql94;
    enable = true; 
  };
}
