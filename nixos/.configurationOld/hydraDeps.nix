{ pkgs, ... }:

{
  services = {
    postfix = {
      enable = true;
      setSendmail = true;
    };

    openssh = {
      enable = true;
      permitRootLogin = "no";
      passwordAuthentication = false;
    };

    postgresql = {
      enable = true;
      package = pkgs.postgresql94;
    };

    nginx = {
      enable = true;
      config = pkgs.lib.readFile /root/nginx.conf;
    };
  };
}
