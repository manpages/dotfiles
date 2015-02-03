{ pkgs }:
with import /nixpkgs/pkgs/development/haskell-modules/lib.nix { inherit pkgs; };
{
  packageOverrides = pkgs: rec {

    haskellEnvDemo = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
    ]);

    haskellWeb     = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
      warp scotty
    ]);

  };
  allowUnfree = true;
}
