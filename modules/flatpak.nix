#==========================================#
#          Flatpak Configuation            #
#==========================================#

{ pkgs, ... }:

{
  # Enable nix-flatpak service
  services.flatpak.enable = true;

  # Add common remotes
  services.flatpak.remotes = [
    {
      name = "flathub";
      location = "https://flathub.org/repo/flathub.flatpakrepo";
    }
  ];


  # Declarative Flatpak apps
  services.flatpak.packages = [
    "com.github.tchx84.Flatseal"     # Manage Flatpak permissions
    "org.gimp.GIMP"                  # GIMP image editor
    "de.leopoldluley.Clapgrep"       # Search through all your files
  ];

  # Enable automatic Flatpak updates
  services.flatpak.update.auto = {
    enable = true;
    onCalendar = "weekly";
  };
}
