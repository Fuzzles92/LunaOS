#==========================================#
#          ☾ Luna AMD GPU
#==========================================#

{ config, pkgs, ... }:

{
  # Ensure AMD GPU drivers are available
  services.xserver.videoDrivers = [ "amdgpu" ];

  # Vulkan support (32-bit needed for Steam/Proton)
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Useful for monitoring & debugging
  environment.systemPackages = with pkgs; [
    vulkan-tools
    mesa-demos
  ];
}

