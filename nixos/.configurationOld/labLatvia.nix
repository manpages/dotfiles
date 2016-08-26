{ ... }:

{ networking = {
    nameservers = [ "8.8.4.4" "8.8.8.8" ]; 
    interfaces.eno1 = { ipAddress = "192.168.1.10"; 
                        prefixLength = 24; };
    useDHCP = false;
    defaultGateway = "192.168.1.1";
  }; }
