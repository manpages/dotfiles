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

    emacsEnv = pkgs.buildEnv {
      name  = "emacs-env";
      paths = [
        pkgs.emacs
        pkgs.emacs24Packages.rainbowDelimiters
        pkgs.emacs24Packages.idris
        pkgs.emacs24Packages.haskellModeGit
        pkgs.emacs24Packages.gitModes
        pkgs.emacs24Packages.coffee
      ];
    };

    lshEnv = pkgs.buildEnv {
      name  = "lsh-env";
      paths = [
        pkgs.mongodb pkgs.nodePackages.node-gyp
        pkgs.nodePackages.coffee-script
        pkgs.nodePackages.uglify-js
        pkgs.nodePackages.browserify
      ];
    };

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

        pkgs.gnumake
        pkgs.boost
      ];
    };

    androidEnv = pkgs.buildEnv {
      name = "android-env";
      paths = [
        pkgs.androidsdk_4_4
	pkgs.maven pkgs.scala pkgs.sbt
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
