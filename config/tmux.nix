{
  programs.tmux = {
    enable = true;
    keyMode = "vi";
    shortcut = "a";
    baseIndex = 1;
    newSession = true;
    escapeTime = 0;
    extraConfig = ''
      set -g default-terminal "xterm-256color"
      set -ga terminal-overrides ",*256col*:Tc"
      set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
      set-environment -g COLORTERM "truecolor"
    '';
  };
}
