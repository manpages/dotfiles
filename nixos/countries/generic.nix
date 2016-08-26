{ nameservers ? [ "8.8.8.8" "8.8.4.4" ], timeZone, ... }:
{ ... }:

{ networking.nameservers = nameservers;
  time.timeZone = timeZone; }
