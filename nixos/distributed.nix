{ pkgs, nixBuildMachines ? [], ... }:
{
  nix.maxJobs = 0;
  nix.distributedBuilds = (nixBuildMachines != []);
  nix.buildMachines = nixBuildMachines;
}
