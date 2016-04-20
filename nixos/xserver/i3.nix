{ pkgs, ... }:
{
  environment.systemPackages = [
    pkgs.dmenu
    pkgs.feh
    pkgs.i3lock
    pkgs.i3status
    pkgs.conky
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
