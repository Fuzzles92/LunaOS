#==========================================#
#       ☾ Luna Helper
#==========================================#

{ config, pkgs, ... }:

{
  home.file.".local/share/applications/luna-helper.desktop".text = ''
    [Desktop Entry]
    Type=Application
    Name=Luna Helper
    GenericName=Luna Management Helper
    Comment=Manage Luna from a GUI Launcher
    Exec=pkexec /etc/nixos/scripts/luna-helper.sh
    Icon=luna-helper
    Terminal=true
    Categories=Utility;System;
    Keywords=luna;helper;tool;script;
  '';

  # optional: copy icon from flake
  home.file.".local/share/icons/hicolor/scalable/apps/luna-helper.svg".source =
    ../assets/icons/luna-helper/luna-helper.svg;
}

