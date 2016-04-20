{ ... }:
{ pkgs, ... }:
let install = [ pkgs.nix-repl
                pkgs.gitAndTools.gitFull
                pkgs.vimHugeX
                pkgs.screen
                pkgs.tmux
                pkgs.htop
                pkgs.mosh
                pkgs.autossh
                pkgs.acpi
                pkgs.proxychains
                pkgs.nginx
                pkgs.httpie
                pkgs.w3m
                pkgs.lynx
                pkgs.ncurses
                pkgs.newsbeuter
                pkgs.sshfsFuse
                pkgs.wget
                pkgs.curl
                pkgs.unrar
                pkgs.unzip
                pkgs.nettools
                pkgs.vpnc
                pkgs.linuxConsoleTools
                pkgs.psmisc
                pkgs.lm_sensors
                pkgs.kexectools
                pkgs.figlet
                pkgs.gnupg
                pkgs.tcpdump
                pkgs.strace
                pkgs.traceroute
                pkgs.nmap
                pkgs.openssl
                pkgs.gcc
                pkgs.gnupg21
                pkgs.mtools
                pkgs.cdrkit
                pkgs.syslinux
                pkgs.qemu ];
in
{ environment.systemPackages = install; }
