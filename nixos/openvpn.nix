{ ... }:
{ pkgs, config, ... }:
{ 
  services.openvpn.servers = {
    serokell = {
      config = ''
        port 10044
        proto udp
        dev tun
        ca /root/.vpn/ca.crt
        cert /root/.vpn/server.crt
        key /root/.vpn/server.key
        dh /root/.vpn/dh1024.pem
        server 10.8.8.0 255.255.255.0
        ifconfig-pool-persist ipp.txt
        keepalive 10 120
        comp-lzo
        persist-key
        persist-tun
        status /root/.vpnopenvpn-status.log
        client-to-client
        verb 3
      '';
    };
  };
}
