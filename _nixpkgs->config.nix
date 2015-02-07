{ pkgs }:
with import /nixpkgs/pkgs/development/haskell-modules/lib.nix { inherit pkgs; };
{
  packageOverrides = pkgs: rec {

    haskellEnvDemo = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
    ]);

    haskellWeb     = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
      warp scotty
    ]);

    codeEnv = pkgs.buildEnv {
      name = "code-env";
      paths = [
        pkgs.vimPlugins.command-t

        pkgs.nodePackages.typescript
        pkgs.nodePackages.mocha
        pkgs.nodePackages.phantomjs
        pkgs.nodejs

        pkgs.haskellngPackages.cabal2nix
        pkgs.haskellngPackages.ghc
        pkgs.ghc.ghcjs

        pkgs.python27Full

        pkgs.ubuntu_font_family
      ];
    };

    funEnv = pkgs.buildEnv {
      name = "fun-env";
      paths = [
        pkgs.python27Packages.livestreamer
      ];
    };

  };
  allowUnfree = true;
}
