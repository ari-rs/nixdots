{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting";
    shellAliases = {
      ls = "eza --icons";
    };
  };
}
