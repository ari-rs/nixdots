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
    ../config/xdg.nix
    ../config/tmux.nix
    ../config/yazi.nix
    ../config/wlogout.nix
  ];
  programs.btop.enable = true;
  services.dunst.enable = true;
  programs.fuzzel.enable = true;
  stylix.targets.rofi.enable = false;
  stylix.targets.vesktop.enable = false;
  stylix.targets.vencord.enable = false;
  

  programs.git = {
    enable = true;
    userName = "ari";
    userEmail = "ari.eimer@proton.me";
  };

  systemd.user.tmpfiles.rules = [
    "L /home/ari/HDrive - - - - /mnt/HDrive"
  ];

  home.stateVersion = "24.11"; # ISO install version
  programs.home-manager.enable = true;
}
