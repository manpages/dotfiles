{ ... }:
{ pkgs, config, lib, ... }:
let
  hydra = (import <nixpkgs> {}).fetchgit {
    url = https://github.com/NixOS/hydra;
    rev = "refs/heads/master";
    sha256 = "b68b4522ce6350d36a35fc30ac6b5c85117f0705faccf4906fa0120b2b16bff9";
  };
in
{ 
  imports = lib.singleton (import "${hydra}/hydra-module.nix");

  services = {
    hydra = {
      enable = true;
      #dbi = "dbi:Pg:dbname=hydra;host=localhost;user=hydra;";
      package = (import "${hydra}/release.nix" {}).build.x86_64-linux;
      hydraURL = "http://serokell.io/hydra";
      listenHost = "*";
      port = 3000;
      minimumDiskFree = 5;
      minimumDiskFreeEvaluator = 2;
      notificationSender = "hydra@thoughtflare";
      debugServer = false;
      extraConfig = ''
        binary_cache_secret_key_file = /etc/nixos/secret
      '';
    };
  };
}
