{...}:
{pkgs, ...}:
{
	services.openvpn.servers.serokell = {
	  config = ''
	    client
	    dev tun
	    proto udp
	    remote memorici.de 10044
	    resolv-retry infinite
	    nobind
	    persist-key
	    persist-tun
	    ca /root/memoricide.crt
	    cert /root/john.crt
	    key /root/john.key
	    comp-lzo
	    verb 3
	  '';
	  up = "echo nameserver $nameserver | ''${pkgs.openresolv}/sbin/resolvconf -m 0 -a $dev";
	  down = "''${pkgs.openresolv}/sbin/resolvconf -d $dev";
	};
}
