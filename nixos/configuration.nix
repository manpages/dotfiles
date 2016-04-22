{ config, pkgs, ... }:

{ imports = [ ./hardware-configuration.nix
              (import ./users.nix { wheel = 
                                      { sweater = "sweater"; };
                                    users =
                                      { guest   = "guest";   }; }       )
                                    
              (import ./boot/uefi-simple.nix  {}                        )
              (import ./countries/generic.nix { tz = "Europe/Warsaw"; } )
              (import ./packages.nix          {}                        )
              (import ./xmonad.nix            {}                        )
              (import ./xserver.nix           {}                        )
              (import ./swap.nix              {}                        )
              (import ./networking.nix        { ssh = true; 
                                                name = "chill"; }       ) ]; 
}
