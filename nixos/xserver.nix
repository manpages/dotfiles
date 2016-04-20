{ touchpad ? "tapPad",  kbLayout ? "lv,ru", kbOptions ? "grp:caps_toggle", ... }:
{ pkgs, ... }:

let 

  mkSynaptics = x:
    if x == "tapPad" then {
      enable = true;
      minSpeed = "1.0"; 
      maxSpeed = "2.0";
      tapButtons = true;
      twoFingerScroll = true;
      horizontalScroll = true;
      palmDetect = false;
      buttonsMap = [1 3 2];
      additionalOptions = ''
        Option "SoftButtonAreas" "60% 0 72% 0 40% 59% 72% 0"
        Option "AccelerationProfile" "2"
        Option "ConstantDeceleration" "4"
      '';
    } else {
      enable = true;
      tapButtons = false;
      twoFingerScroll = true;
      horizontalScroll = true;
      palmDetect = true;
    };

  utils = [ pkgs.firefox
            pkgs.chromiumDev
            pkgs.skype

            pkgs.pulseaudioFull
            pkgs.pavucontrol

            pkgs.mplayer
            pkgs.ffmpeg
            pkgs.vlc

            pkgs.rxvt_unicode_with-plugins
            pkgs.urxvt_perls

            pkgs.blender
            pkgs.inkscape
            pkgs.gimp

            pkgs.autocutsel
            pkgs.clipit

            pkgs.zathura
            pkgs.mcomix
            pkgs.fbreader
            pkgs.calibre

            pkgs.xclip
            pkgs.xlibs.xbacklight

            pkgs.wireshark-gtk
          ];

  fonts = [ 
            pkgs.corefonts
            pkgs.freefont_ttf
            pkgs.terminus_font
            pkgs.ubuntu_font_family
          ];

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
    synaptics = mkSynaptics touchpad;
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
