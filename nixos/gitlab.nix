{ ... }:
{ pkgs, config, ... }:

{ services.postgresql.package = pkgs.postgresql94;
  services.gitlab = { 
    enable = true;
    databasePassword = "insecure";
  };
}
