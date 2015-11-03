{ blockDevice, ... }:

{
  boot.loader.gummiboot.enable = true;
  boot.loader.gummiboot.timeout = 2;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelModules = [ "tp_smapi" ];
  boot.extraModulePackages = [ config.boot.kernelPackages.tp_smapi ];
  boot.initrd.postDeviceCommands = ''
  echo noop > ${blockDevice}/queue/scheduler
  '';
}
