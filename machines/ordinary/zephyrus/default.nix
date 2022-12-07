let
  inherit (import ../../path-relove.nix) commonDir appDir;
in
{
  imports = [
    ./hardware-configuration.nix
    ./network.nix
    ./gpu.nix
    ./virtualisation.nix
    ./zephyrus.nix
    (commonDir + "/pulseaudio.nix")
    (commonDir + "/printer.nix")
    (appDir + "/desktop/wm/qtile/xserver.nix")
  ] ++
  (import (appDir + "/virtualisation"));
  
  nix = {
    extraOptions = ''
      binary-caches-parallel-connections = 24
    '';
  };
}