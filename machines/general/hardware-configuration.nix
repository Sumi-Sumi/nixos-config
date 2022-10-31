# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "usbhid" "usb_storage" "uas" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-amd" "kvm-intel" ];
  # boot.resumeDevice = "/.swapfile";
  # boot.kernelParams = [ "resume_offset=964608" ];
  boot.extraModulePackages = [ ];
  boot.initrd.luks.devices = {
    luksroot = {
      device = "/dev/disk/by-uuid/48e1f8a2-7909-4132-afd8-e135d3d007be";
      # device = "/dev/disk/by-partlabel/LUKSROOT";
      preLVM = true;
      allowDiscards = true;
    };
  };

  fileSystems."/" =
    { 
      device = "/dev/disk/by-uuid/1fa63c95-3076-487c-9eb0-f6c59ab290a1";
      # device = "/dev/disk/by-label/root";
      fsType = "ext4";
    };

  fileSystems."/home" =
    { 
      device = "/dev/disk/by-uuid/1f3ddc85-9ce9-4b53-a545-45f9b6f065af";
      # device = "/dev/disk/by-label/home";
      fsType = "ext4";
    };

  fileSystems."/boot" =
    { 
      device = "/dev/disk/by-uuid/13C6-DFD1";
      # device = "/dev/disk/by-label/boot";
      fsType = "vfat";
    };

  swapDevices = [
    {
      device = "/.swapfile";
      size = 1024*2; # swap size is 2GB
    }
  ];

  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
