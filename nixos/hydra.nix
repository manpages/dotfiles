{ config, pkgs, ... }:
let
  # make sure we always have the latest module
  hydra = pkgs.fetchgit {
    url = https://github.com/NixOS/hydra;
    rev = "refs/heads/master";
  };
in {

  require = [ "${hydra}/hydra-module.nix" ];

  services = {
    # for sending emails (optional)
    postfix = {
      enable = true;
      setSendmail = true;
    };

    # you are probably going to need openssh server
    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };

    # actual Hydra config
    hydra = {
      enable = true;
      dbi = "dbi:Pg:dbname=hydra;host=localhost;user=hydra;";
      package = (import "${hydra}/release.nix" {}).build.x86_64-linux;
      hydraURL = "http://hydra.scriptores.com/";
      listenHost = "localhost";
      port = 3000;
      minimumDiskFree = 5;  # in GB
      minimumDiskFreeEvaluator = 2;
      notificationSender = "hydra@yourserver.com";
      logo = null;
      debugServer = false;
    };
    # Hydra requires postgresql to run
    postgresql.enable = true;
    postgresql.package = pkgs.postgresql;

    # frontend http/https server
    nginx.enable = true;
    nginx.config = pkgs.lib.readFile /root/nginx.conf;
  };

}
