{ pkgs }:
with import /nixpkgs/pkgs/development/haskell-modules/lib.nix { inherit pkgs; };
{
  packageOverrides = pkgs: rec {

    codeEnv = pkgs.buildEnv {
      name = "code-env";
      paths = [
        pkgs.vimPlugins.command-t

        pkgs.nodePackages.typescript
        pkgs.nodePackages.mocha
        pkgs.nodePackages.phantomjs
        pkgs.nodejs

        pkgs.haskell-ng.compiler.ghcHEAD

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
