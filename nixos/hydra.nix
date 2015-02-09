{ config, pkgs, ... }:

let 

nothingToSeeHereSkipToFunctionBody = true;


provision = ''
# As root
cd
mkdir ssl
cd ssl
openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 -keyout hydra.key -out hydra.crt
cd
echo """
${nginxConfig}
""" > nginx.conf
echo """
${hydraConfig}
""" > hydra.nginx
nixos-rebuild switch
createuser -U root hydra -P # Enter ${hydraPgSqlPassword}
sudo -u hydra echo -n "localhost:*:hydra:hydra:${hydraPgSqlPassword}" > ~/.pgpass
psql -U root postgres -c 'CREATE DATABASE hydra;'
nixos-rebuild switch
'';

hydraPgSqlPassword = "ChangeMePlease!";

nginxConfig = ''
    #user  nobody;
    worker_processes  1;
    error_log  logs/error.log;
    #error_log  logs/error.log  notice;
    #error_log  logs/error.log  info;
    pid        logs/nginx.pid;
    events {
        worker_connections  1024;
    }
    http {
        log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                          '$status $body_bytes_sent "$http_referer" '
                          '"$http_user_agent" "$http_x_forwarded_for"';
        access_log  logs/access.log  main;
        sendfile        on;
        #tcp_nopush     on;
        #keepalive_timeout  0;
        keepalive_timeout  65;
        #gzip  on;
        include /root/hydra.nginx;
    }
'';

hydraConfig = ''
    server {
        listen 0.0.0.0:443 ssl;
        server_name hydra-ssl.host.domain;
        keepalive_timeout    70;
        ssl_session_cache    shared:SSL:10m;
        ssl_session_timeout  10m;
        ssl_certificate      /root/ssl/hydra.crt;
        ssl_certificate_key  /root/ssl/hydra.key;
        location / {
            proxy_pass http://127.0.0.1:3000/;
            proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
            proxy_set_header        Accept-Encoding   "";
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
            proxy_set_header        X-Forwarded-Proto $scheme;
            add_header              Front-End-Https   on;
            proxy_redirect     off;
        }
    }
    server {
        listen 0.0.0.0:80;
        server_name hydra-ssl.host.domain;
        rewrite ^ https://$server_name$request_uri? permanent;
    }
    server {
        listen 0.0.0.0:80;
        server_name hydra.host.domain;
        location / {
            proxy_pass http://127.0.0.1:3000/;
            proxy_set_header        Host            $host;
            proxy_set_header        X-Real-IP       $remote_addr;
            proxy_set_header        X-Forwarded-For $proxy_add_x_forwarded_for;
        }
    }
'';

in
{

  require = [ "/root/hydra/hydra-module.nix" ];

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

    hydra = {
      enable = true;
      dbi = "dbi:Pg:dbname=hydra;host=localhost;user=hydra;";
      package = (import "/root/hydra/release.nix" {}).build.x86_64-linux;
      hydraURL = "http://hydra.host.domain/";
      listenHost = "localhost";
      port = 3000;
      minimumDiskFree = 5;  # in GB
      minimumDiskFreeEvaluator = 2;
      notificationSender = "hydra@host.domain";
      logo = null;
      debugServer = false;
    };

    postgresql.enable = true;
    postgresql.package = pkgs.postgresql94;

    # I wonder what to do with dependencies like this one.
    nginx.enable = true;
    nginx.config = pkgs.lib.readFile /root/nginx.conf;

  };

}
