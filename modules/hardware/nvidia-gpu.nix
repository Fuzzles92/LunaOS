#==========================================#
#           Nvidia GPU Configuation        #
#==========================================#

{ config, pkgs, ... }:

{
  # Use NVIDIA proprietary driver
  services.xserver.videoDrivers = [ "nvidia" ];

  # Enable OpenGL / Vulkan support (including 32-bit for Steam/Proton)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # NVIDIA-specific kernel & driver options
  hardware.nvidia = {
    modesetting.enable = true;   # Required for Wayland
    powerManagement.enable = true;
    powerManagement.finegrained = false;
    nvidiaSettings = true;       # Enables nvidia-settings GUI
    open = false;                # Use proprietary driver by default
  };

  # Useful NVIDIA tools
  environment.systemPackages = with pkgs; [
    vulkan-tools
    mesa-demos
    glxinfo
  ];
}


