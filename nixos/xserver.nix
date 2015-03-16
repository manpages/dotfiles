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

            pkgs.xclip
            pkgs.xlibs.xbacklight

            pkgs.wireshark-gtk
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
    xkbOptions = "grp:caps_toggle";
    synaptics = {
      enable = true;
      minSpeed = "1.0"; 
      maxSpeed = "2.0";
      tapButtons = false;
      twoFingerScroll = true;
      horizontalScroll = true;
    };
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
