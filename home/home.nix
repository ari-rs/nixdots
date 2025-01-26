{ ... }:
{
    home.username = "ari";
    home.homeDirectory = "/home/ari";
    imports = [
      ../config/hyprland.nix
      ../config/nixcord.nix
      ../config/mechabar.nix
      ../config/fastfetch.nix
      ../config/helix.nix
      ../config/hyprlock.nix
      ../config/kitty.nix
      ../config/rofi.nix
      ../config/spicetify.nix
    ];
    programs.btop.enable = true;
    programs.yazi.enable = true;
    services.dunst.enable = true;
    programs.fuzzel.enable = true;
    stylix.targets.rofi.enable = false;

    programs.git = {
      enable = true;
      userName = "ari";
      userEmail = "ari.eimer@proton.me";
    };
    xdg.userDirs.enable = true;
    xdg.userDirs.createDirectories = true;

    systemd.user.tmpfiles.rules = [
      "L /home/ari/HDrive - - - - /mnt/HDrive"
    ];  

    home.stateVersion = "24.11"; #ISO install version
    programs.home-manager.enable = true;
}
