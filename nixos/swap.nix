{ dev ? "/swapfile" }:
{ ... }:

{
 swapDevices =
   [ { device = dev; } ];
}
