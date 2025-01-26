{ lib, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      background.path = lib.mkForce "~/nixos/wallpapers/forest-everforest.png";
      general = {
        hide_cursor = true;
        disable_loading_bar = true;
        immediate_render = true;
        no_fade_in = true;
        no_fade_out = true;
        ignore_empty_input = true;
      };
    };
  };
}
