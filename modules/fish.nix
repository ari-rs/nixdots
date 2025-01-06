{ ... }:
{
  programs.fish = {
    enable = true;
    interactiveShellInit = "set fish_greeting \n zoxide init --no-cmd fish | source";
    shellAliases = {
      ls = "eza --icons";
      cat = "bat";
      cd = "__zoxide_z";
      cdi = "__zoxide_zi";
    };
  };
}
