{ pkgs, ... }:

{
  environment.systemPackages = [ pkgs.haskellngPackages.cabal2nix
                                 pkgs.haskellngPackages.ghc ];
}
