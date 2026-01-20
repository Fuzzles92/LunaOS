#==========================================#
#            Luna Home Manager
#==========================================#

{ config, pkgs, ... }:

{
  imports = [
    ./mangohud.nix
    ./gnome.nix
    #./kde.nix
  ];

  home.username = "fuzzles";
  home.homeDirectory = "/home/fuzzles";

  home.stateVersion = "25.11";
}
