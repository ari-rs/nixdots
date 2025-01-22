{ pkgs, lib, ...}:
{
  programs.helix.languages = {
    language = [
    {
      name = "nix";
    }
    {
      name = "rust";
      # rustup component add rust-analyzer
      # Didnt work til I ran this command ^
    }
    ];
  };
}
