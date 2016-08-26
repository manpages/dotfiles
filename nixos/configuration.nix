{ config, pkgs, ... }:
{ imports = [ ./hardware-configuration.nix
              (import ./xserver.nix {} )
              (import ./packages.nix { }                                 )
              (import ./users.nix { wheel = { sweater = "sweater"; 
                                              jaga    = "jaga"; };
                                    users = { guest = "guest";     
                                              dork  = "dork"; }; }       )
              (import ./countries/latvia.nix  {}                         )
              (import ./boot/windows.nix      {}                         )
              (import ./boot/grub2.nix        { device = "/dev/sda"; }   )
              (import ./xmonad.nix            {}                         )
              (import ./gpu.nix               { kind = "nvidia"; }       )
              (import ./openntpd.nix          {}                         )
              (import ./postgresql.nix        {}                         )
              (import ./cron.nix              {}                         )
              (import ./virtualbox.nix        {}                         )
              (import ./networks/lab.nix {}                              )
              (import ./docker.nix            {}                         )
              (import ./openvpn.nix           {}                         )
              (import ./networking.nix        { fw = false;
                                                ssh = true;
                                                sshPorts = [21984 10050];
                                                name = "thoughtflare"; } ) ]; 
}
