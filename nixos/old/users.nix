{ ... }:
{
  sweater = {
	  group = "wheel";
	  createHome = true;
	  home = "/home/sweater";
	  shell = "/run/current-system/sw/bin/bash";
  };
  guest = {
	  group = "users";
	  createHome = true;
	  home = "/home/guest";
	  shell = "/run/current-system/sw/bin/bash";
  };
  dork = {
	  group = "users";
	  createHome = true;
	  home = "/home/dork";
	  shell = "/run/current-system/sw/bin/bash";
  };
  android = {
	  group = "wheel";
	  createHome = true;
	  home = "/home/android";
	  shell = "/run/current-system/sw/bin/bash";
  };
}
