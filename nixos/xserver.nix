{ pkgs, ... }:

let kdenliveWrapped = pkgs.kde4.wrapper pkgs.kde4.kdenlive; in
let

  utils = [ pkgs.firefoxWrapper
            pkgs.chromiumDev
            pkgs.skype

            pkgs.pulseaudio
            pkgs.pavucontrol

            pkgs.mplayer
            pkgs.ffmpeg
            pkgs.vlc

            pkgs.rxvt_unicode_with-plugins
            pkgs.urxvt_perls

            pkgs.blender
            pkgs.inkscape
            pkgs.gimp
            kdenliveWrapped

            pkgs.autocutsel
            pkgs.clipit

            pkgs.zathura
            pkgs.mcomix
            pkgs.fbreader
            pkgs.calibre

            pkgs.xlibs.xbacklight
          ];

  fonts = [ pkgs.cantarell_fonts
            pkgs.corefonts
            pkgs.dejavu_fonts
            pkgs.dina-font
            pkgs.dosemu_fonts
            pkgs.freefont_ttf
            pkgs.terminus_font
            pkgs.gyre-fonts
            pkgs.lohit-fonts
            pkgs.proggyfonts
            pkgs.ubuntu_font_family
          ];

in 
{
  # Use wicd
  imports = [ ./wicd.nix ./unfree.nix ];
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
