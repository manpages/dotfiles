{ pkgs }:
#with import /nix/pkgs/pkgs/development/haskell-modules/lib.nix { inherit pkgs; };
{
  packageOverrides = pkgs: rec {

    binNode = with pkgs.nodePackages; [
      bower
      grunt-cli
      #pulp
    ] ++ [ pkgs.nodejs ];

    binHaskell = pkgs.haskell.packages.ghc7102.ghcWithPackages ( x: with x; [
      cabal2nix cabal-install hlint xmonad xmobar
    ]);

    haskellEnv = pkgs.buildEnv {
      name = "haskell-env";
      paths = [ binNode binHaskell ];
    };

    emacsEnv = pkgs.buildEnv {
      name  = "emacs-env";
      paths = [
        pkgs.emacs
        pkgs.emacs24Packages.rainbowDelimiters
        pkgs.emacs24Packages.idris
        pkgs.emacs24Packages.haskellModeGit
        pkgs.haskell.packages.ghc784.stylish-haskell
        pkgs.haskell.packages.ghc784.hasktags
	      pkgs.haskell.packages.ghc784.ghc-mod
        pkgs.emacs24Packages.gitModes
        pkgs.emacs24Packages.coffee
        pkgs.cmake pkgs.clang
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
        pkgs.vimHugeX
        pkgs.vimPlugins.command-t

        pkgs.nodePackages.typescript
        pkgs.nodejs
        pkgs.nodePackages.mocha
        pkgs.nodePackages.phantomjs
        pkgs.darcs
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
