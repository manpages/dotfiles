{ winRoot ? "(hd0,msdos3)", ... }:
{ ... }:

{
  boot.loader.grub.extraEntries = 
    ''
      menuentry "Windows 7" {
        insmod part_msdos
        insmod ntfs
        set root=${winRoot}
        chainloader +1
      }
    '';
}
