{ config, pkgs, ... }:

{

  require = [ "/root/hydra/hydra-module.nix" ];

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
    services.hydra = {
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
