#==========================================#
#         ☾ Luna Home Manager
#==========================================#

{ config, pkgs, ... }:

{
  imports = [
    ./luna-helper.nix
    ./mangohud.nix
    #./gnome.nix
    #./kde.nix
    #./qtile.nix
  ];

  home.username = "fuzzles";
  home.homeDirectory = "/home/fuzzles";

  home.stateVersion = "25.11";
}
