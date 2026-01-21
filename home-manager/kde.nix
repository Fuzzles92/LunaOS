#==========================================#
#       ☾ Luna KDE Home Manager
#==========================================#

{ config, pkgs, ... }:

{
  #--------------------------
  # Packages (user-level)
  #--------------------------
  home.packages = with pkgs; [
    # Applications
    kdePackages.partitionmanager        # KDE Partition Manager
    kdePackages.isoimagewriter          # KDE ISO Image Writer

    # Plasma Utilities / Addons
    kdePackages.plasma-browser-integration
  ];

  #--------------------------
  # KDE Kickoff Favorites
  #--------------------------
  xdg.configFile."kickoffrc" = {
    force = true;
    text = ''
      [Favorites]
      favoriteApps=luna-helper.desktop
    '';
  };

  #--------------------------
  # KDE Global Settings (Qt apps, colors, fonts)
  #--------------------------
  xdg.configFile."kdeglobals" = {
    force = true;
    text = ''
      [General]
      ColorScheme=BreezeDark
      widgetStyle=Breeze
      style=Fusion
      iconTheme=breeze-dark

      [WM]
      activeFont=Cantarell,10

      [KDE]
      SingleClick=false
    '';
  };

  #--------------------------
  # Plasma Shell Theme
  #--------------------------
  xdg.configFile."plasmarc" = {
    force = true;
    text = ''
      [Theme]
      name=breeze-dark
    '';
  };

  #--------------------------
  # Window Decorations (title bars / borders)
  #--------------------------
  xdg.configFile."kwinrc" = {
    force = true;
    text = ''
      [org.kde.kdecoration2]
      library=org.kde.kwin.aurorae
      theme=breeze-dark
    '';
  };

  #--------------------------
  # Global Theme / Look & Feel
  #--------------------------
  xdg.configFile."kcmlookandfeelrc" = {
    force = true;
    text = ''
      [KDE]
      LookAndFeelPackage=org.kde.breezedark.desktop
    '';
  };

  #--------------------------
  # Cursor / Input
  #--------------------------
  xdg.configFile."kcminputrc" = {
    force = true;
    text = ''
      [Mouse]
      cursorTheme=breeze_cursors
      cursorSize=24
    '';
  };

  #--------------------------
  # Wallpaper & Panel (taskbar) settings
  #--------------------------
  xdg.configFile."plasma-org.kde.plasma.desktop-appletsrc" = {
    force = true;
    text = ''
      [Containments][1][Wallpaper][org.kde.image][General]
      Image=file:///etc/nixos/wallpaper/luna-os-abstract.png
      FillMode=2

      [Containments][2]
      formfactor=2
      location=3
      plugin=panel
      height=34
    '';
  };

  #--------------------------
  # Optional: ensure Qt apps + session honor dark theme
  #--------------------------
  home.sessionVariables = {
    KDE_FULL_SESSION = "true";
    QT_QUICK_CONTROLS_STYLE = "Fusion";
  };
}
