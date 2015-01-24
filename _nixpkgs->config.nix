{ pkgs }:
with import /root/nixpkgs/pkgs/development/haskell-modules/lib.nix { inherit pkgs; };
{
  packageOverrides = pkgs: rec {
    kdenliveWrapped = pkgs.kde4.wrapper pkgs.kde4.kdenlive;
    conkyX11Rss = pkgs.conky.override { x11Support=true;
                                        wireless=true;
                                        luaSupport=true;
                                        rss=true;
                                      };
    haskellEnvDemo = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
    ]);
    haskellWebEnv  = pkgs.haskellngPackages.ghcWithPackages (p: with p; [
      warp scotty
    ]);
  };
  allowUnfree = true;
}
