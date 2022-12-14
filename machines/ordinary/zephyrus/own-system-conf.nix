{ pkgs, ... }:

{
  services = {
    asusd = {
      enable = true;
      profileConfig = "quiet";
    };
    flake-supergfxd = {
      enable = true;
      settings = {
        mode = "Integrated";
        vfio_enable = true;
        vfio_save = false;
        always_reboot = false;
        no_logind = false;
        logout_timeout_s = 180;
        hotplug_type = "None";
      };
    };
  };
  systemd.sleep.extraConfig = ''
    # suspend=hybrid-sleep
    SuspendMode=suspend
    SuspendState=disk
    # hibernate=hybrid-sleep
    HibernateMode=suspend
    HibernateState=disk
  '';
  powerManagement = {
    enable = true;
    powertop.enable = true;
    cpuFreqGovernor = "ondemand";
  };
  nix = {
    settings = {
      cores = 4;
      max-jobs = 4;
    };
    extraOptions = ''
      binary-caches-parallel-connections = 24
    '';
  };
}
