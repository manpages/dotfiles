{ pkgs }:
with import /nixpkgs/pkgs/development/haskell-modules/lib.nix { inherit pkgs; };
{
  packageOverrides = pkgs: rec {

    webHaskell = pkgs.haskell-ng.packages.ghc784.ghcWithPackages (p: with p; [
      scotty acid-state
    ]);

    binHaskell = pkgs.haskell-ng.packages.ghc784.ghcWithPackages (p: with p; [
      cabal2nix
    ]);

    codeEnv = pkgs.buildEnv {
      name = "code-env";
      paths = [
        pkgs.vimPlugins.command-t

        pkgs.nodePackages.typescript
        pkgs.nodePackages.mocha
        pkgs.nodePackages.phantomjs
        pkgs.nodejs

        binHaskell

        pkgs.python27Full

        pkgs.ubuntu_font_family

        pkgs.vagrant
      ];
    };

    funEnv = pkgs.buildEnv {
      name = "fun-env";
      paths = [
        pkgs.python27Packages.livestreamer
        pkgs.weechat
      ];
    };

  };
  allowUnfree = true;
}
