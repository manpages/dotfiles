{ pkgs, ... }:

{
  services.nginx = {
    enable = true;
    config =
      ''
        worker_processes 1;
        events {
          worker_connections  1024;
        }
      '';
  };
}
