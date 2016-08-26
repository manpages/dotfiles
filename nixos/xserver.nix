{ touchpad ? "tapPad",  kbLayout ? "lv,ru", kbOptions ? "grp:caps_toggle", ... }:
{ pkgs, ... }:

let 

  utils = [];
  fonts = [];

in 
{
  # Use wicd
  imports = [ ./xserver/wicd.nix ./xserver/unfree.nix ];
  # Use pulse
  hardware.pulseaudio.enable = true;
  services.xserver = {
    enable = true;
    layout = kbLayout;
    xkbOptions = kbOptions;
    displayManager.slim = {
      enable = true;
      autoLogin = false;
      defaultUser = "sweater";
      theme = pkgs.fetchurl {
        url    = "https://github.com/jagajaga/nixos-slim-theme/archive/Final.tar.gz";
        sha256 = "4cab5987a7f1ad3cc463780d9f1ee3fbf43603105e6a6e538e4c2147bde3ee6b";
      };
    };
  };
  environment.systemPackages = builtins.concatLists [ utils fonts ];
}
