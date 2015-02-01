{ pkgs }:
with import /nixpkgs/pkgs/development/haskell-modules/lib.nix { inherit pkgs; };
{
  packageOverrides = pkgs: rec {
    haskellEnvDemo = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
    ]);

    haskellCore    = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
      ghc cabal2nix probability
    ]);

    haskellWeb     = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
      warp scotty
    ]);
  };
  allowUnfree = true;
}
