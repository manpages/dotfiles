# i3 desktop config
{ pkgs, ... }:

let

  conkyX11Rss = pkgs.conky.override { x11Support=true;
                                      luaSupport=true;
                                    };

in
{
  environment.systemPackages = [
    pkgs.dmenu
    pkgs.feh
    pkgs.i3lock
    pkgs.i3status
    conkyX11Rss
    pkgs.scrot
  ];

  services.xserver = {
    windowManager = {
      i3.enable = true;
      default = "i3";
    };

    displayManager = {
      sessionCommands = ''
        i3status &
      '';
    };
    
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
  };
}
