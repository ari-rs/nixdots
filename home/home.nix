{ ... }:
{
    home.username = "ari";
    home.homeDirectory = "/home/ari";
    imports = [
      ../config/hyprland.nix
      ../config/nixcord.nix
      ../config/waybar.nix
    ];
    programs.btop.enable = true;
    programs.kitty.enable = true;
    xdg.userDirs.enable = true;
    xdg.userDirs.createDirectories = true;

    home.stateVersion = "24.11"; #ISO install version
    programs.home-manager.enable = true;
}
