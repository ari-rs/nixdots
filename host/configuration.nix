{ pkgs, inputs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix # Include the results of the hardware scan.
      ../modules/nvidia.nix # Nvidia Drivers
      ../modules/stylix.nix # Stylix
      ../modules/steam.nix # Steam
      ../modules/fish.nix # Fish
      ../modules/firewall.nix
      ../modules/audio/pipewire.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.systemd-boot.configurationLimit = 10;
  boot.loader.efi.canTouchEfiVariables = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  networking.hostName = "hydrogen"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Networking
  networking.networkmanager.enable = true;

  # Locale & Time
  time.timeZone = "America/Chicago";
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };
  
  # X11 keymap
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };
  users.defaultUserShell = pkgs.fish;
  users.users.ari = {
    isNormalUser = true;
    description = "ari";
    extraGroups = [ "networkmanager" "wheel" ];
    #packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  
  # Use CachyOS kernel
  boot.kernelPackages = pkgs.linuxPackages_cachyos;
  programs.gamemode.enable = true;

  services.mullvad-vpn.enable = true;

  environment.systemPackages = [
    inputs.zen-browser.packages.${pkgs.system}.default
    pkgs.base16-schemes
    pkgs.eza
    pkgs.bat
    pkgs.fzf
    pkgs.zoxide
    pkgs.hyprshot
    pkgs.swappy
    pkgs.wlogout
    pkgs.heroic
    pkgs.git
    pkgs.lm_sensors
    pkgs.prismlauncher
    pkgs.filezilla
    pkgs.hyprpolkitagent
    pkgs.rustup
    pkgs.gcc
    pkgs.rnnoise-plugin
    pkgs.mullvad-vpn
    pkgs.qbittorrent
    pkgs.spotdl
    pkgs.lldb
    pkgs.nixd
    pkgs.rar
    pkgs.croc
    pkgs.unzip
    pkgs.spotify
    pkgs.nvtopPackages.nvidia
    pkgs.suyu
  ];
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
  ];

  
  environment.variables = {
    XDG_DESKTOP_DIR = "$HOME/Desktop";
    XDG_DOCUMENTS_DIR = "$HOME/Documents";
    XDG_DOWNLOAD_DIR = "$HOME/Downloads";
    XDG_MUSIC_DIR =" $HOME/Music";
    XDG_PICTURES_DIR = "$HOME/Pictures";
    XDG_VIDEOS_DIR = "$HOME/Videos";
  };
  services.playerctld.enable = true;

  programs.hyprland = {
    enable = true;
    withUWSM = true;
    xwayland.enable = true;
  };

  system.stateVersion = "24.11"; # Did you read the comment?

}
