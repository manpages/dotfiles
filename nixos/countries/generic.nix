{ nss ? [ "8.8.8.8" "8.8.4.4" ], tz, ... }:
{ ... }:

{ networking.nameservers = nss;
  time.timeZone = tz; }
