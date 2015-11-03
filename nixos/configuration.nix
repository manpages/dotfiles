{ config, pkgs, ... }:

{ imports = [ ./hardware-configuration.nix
              (import ./packages.nix {}                                 )
              (import ./users.nix { wheel = { sweater = "sweater"; };
                                    users = { guest = "guest";     }; } )
              (import ./countries/slovakia.nix {}                        )
              (import ./boot/windows.nix       {}                        )
              (import ./boot/grub2.nix         { device = "/dev/sda"; }  )
              (import ./xserver.nix            {}                        )
              (import ./virtualbox.nix         {}                        )
              (import ./memoricide.nix         {}                        )
              (import ./xmonad.nix             {}                        )
              (import ./gpu.nix                { kind = "optimus"; }     )
              (import ./networking.nix         { ssh = true; 
                                                 name = "chill"; }       ) ]; 
  nix.binaryCachePublicKeys = [ "hydra.nixos.org-1:CNHJZBh9K4tP3EKF6FkkgeVYsS3ohTl+oS0Qa8bezVs=" "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY=" ]; 
  virtualisation.virtualbox.host.enable = true;
  users.extraGroups.vboxusers.members = [ "guest" "sweater" ];
}
