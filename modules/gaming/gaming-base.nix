#==========================================#
#         Gaming Base Configuration        #
#==========================================#

{ config, pkgs, ... }:

{
  #------------------------------------------#
  # Steam                                    #
  #------------------------------------------#
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    dedicatedServer.openFirewall = true;
  };

  #------------------------------------------#
  # Gaming Utilities                         #
  #------------------------------------------#
  environment.systemPackages = with pkgs; [
    mangohud
    mangojuice
    gamemode
    protonup-qt

    # Parked for later
    lutris
    heroic
  ];

  #------------------------------------------#
  # Feral GameMode                           #
  #------------------------------------------#
  programs.gamemode = {
    enable = true;

    settings = {
      general = {
        renice = 10;
        ioprio = 0;
        inhibit_screensaver = 1;
      };

      gpu = {
        apply_gpu_optimisations = "accept-responsibility";
      };
    };
  };

  #------------------------------------------#
  # CPU Performance                          #
  #------------------------------------------#
  powerManagement.cpuFreqGovernor = "performance";

  #------------------------------------------#
  # Audio / 32-bit                           #
  #------------------------------------------#
  services.pipewire.alsa.support32Bit = true;

  #------------------------------------------#
  # Kernel Tweaks (Safe)                     #
  #------------------------------------------#
  boot.kernel.sysctl = {
    "vm.max_map_count" = 2147483642;
    "vm.swappiness" = 10;
    "kernel.sched_autogroup_enabled" = 1;
  };
}
