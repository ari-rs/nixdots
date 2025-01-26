{
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
            set fish_greeting
            set EDITOR hx

            function y
      	      set tmp (mktemp -t "yazi-cwd.XXXXXX")
      	      yazi $argv --cwd-file="$tmp"
      	      if set cwd (command cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
      		      builtin cd -- "$cwd"
      	      end
      	      rm -f -- "$tmp"
            end
            
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
