{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting
      zoxide init --no-cmd fish | source

      if status is-login
        if uwsm check may-start
          exec uwsm start hyprland-uwsm.desktop
        end
      end
      '';
    shellAliases = {
      ls = "eza --icons";
      cat = "bat";
      cd = "__zoxide_z";
      cdi = "__zoxide_zi";
    };
  };
}
