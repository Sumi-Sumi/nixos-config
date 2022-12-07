{ pkgs, ... }:

{
  services = {
    asusd.enable = true;
    asus-notify.enable = true;
    supergfxd.enable = true;
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
}