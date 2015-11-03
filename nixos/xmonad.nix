{ ... }:
{ pkgs, config, ... }:

{ services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };
  services.xserver.windowManager.default = "xmonad";
}
