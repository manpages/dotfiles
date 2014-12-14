{ pkgs, ... }:

let

  utils = [ pkgs.firefoxWrapper
            pkgs.chromium
            pkgs.pulseaudio
            pkgs.pavucontrol
            pkgs.mplayer
            pkgs.ffmpeg
            pkgs.vlc
            pkgs.rxvt_unicode
            pkgs.skype
          ];

  fonts = [ pkgs.cantarell_fonts
            pkgs.corefonts
            pkgs.dejavu_fonts
            pkgs.dosemu_fonts
            pkgs.freefont_ttf
            pkgs.liberation_ttf
            pkgs.terminus_font
            pkgs.ubuntu_font_family
          ];

in 
{
  # Use wicd
  imports = [ ./wicd.nix ];
  # Use pulse
  hardware.pulseaudio.enable = true;
  services.xserver = {
    enable = true;
    layout = "lv,ru";
    xkbOptions = "grp:alt_shift_toggle";
    synaptics = {
      enable = true;
      minSpeed = "1.0"; 
      maxSpeed = "2.0";
      tapButtons = false;
      twoFingerScroll = true;
      horizontalScroll = false;
    };
    displayManager.slim = {
      enable = true;
      autoLogin = false;
      defaultUser = "sweater";
      theme = pkgs.fetchurl {
        url = https://github.com/jagajaga/nixos-slim-theme/archive/1.0.tar.gz;
        sha256 = "08ygjn5vhn3iavh36pdcb15ij3z34qnxp20xh3s1hy2hrp63s6kn";
      };
    };
  };
  environment.systemPackages = builtins.concatLists [ utils fonts ];
}
