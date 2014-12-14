{...}:

{
  boot.loader.grub.extraEntries = 
    ''
      menuentry "Windows 7" {
        insmod part_msdos
	insmod ntfs
	set root='(hd0,msdos3)'
	chainloader +1
      }
    '';
}
