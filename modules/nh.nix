{
  nix.settings = {
    auto-optimise-store = true;
  };
  programs.nh = {
    enable = true;
    flake = "/home/ari/nixos";
    clean = {
      enable = true;
      extraArgs = "--keep 7 --keep-since 7d";
    };
  };
}
