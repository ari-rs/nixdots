{ lib, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$terminal" = "kitty";
	      "$launcher" = "fuzzel";
	      "$mod" = "super";
        "input:sensitivity" = "-2";
#        "input:kb_options" = "caps:swapescape";
	env = [
         # "NIXOS_OZONE_WL,1" # (discord)Electron + Wayland is broken
	  "__GLX_VENDOR_LIBRARY_NAME,nvidia"
	  "GBM_BACKEND,nvidia-drm"
	  "XDG_CURRENT_DESKTOP,Hyprland"
	  "XDG_SESSION_DESKTOP,Hyprland"
	  "XDG_SESSION_TYPE,wayland"
	  "LIBVA_DRIVER_NAME,nvidia"
	  "GDK_BACKEND,wayland"
	  "SDL_VIDEODRIVER,wayland"
	  "QT_QPA_PLATFORM,wayland"
	  "QT_WAYLAND_DISABLE_WINDOWDECORATION"
	];
  decoration = {
    "rounding" = 2;
    "active_opacity" = 0.97;
    "inactive_opacity" = 0.93;
  };
  windowrulev2 = [
    "opaque, class:^(.*Minecraft.*)$"
    "opaque, class:^(.*zen.*)$"
  ];
  layerrule = [
    "noanim, selection"
  ];
	monitor = [
    "DP-1, 1920x1080@240, 0x0, 1.0"
	  "HDMI-A-1, 1920x1080@75, 1920x0, 1.0"
	];
	bindm = [
    "$mod, mouse:272, movewindow"
	  "$mod, mouse:273, resizewindow"
	];
  bind = [
	  # App Launches
	  "$mod, tab, exec, $launcher"
    "$mod, return, exec, $terminal"
    # Manip
	  "$mod, Q, killactive"
	  "$mod, F, fullscreen"
	  # Workspaces
	  "$mod, 1, workspace, r~1"
	  "$mod, 2, workspace, r~2"
	  "$mod, 3, workspace, r~3"
	  "$mod, 4, workspace, r~4"
	  "$mod, 5, workspace, r~5"
	  "$mod, 6, workspace, r~6"
	  "$mod, 7, workspace, r~7"
	  "$mod, 8, workspace, r~8"
	  "$mod, 9, workspace, r~9"
	  "$mod, 0, workspace, r~10"
	  "$mod SHIFT, 1, movetoworkspace, r~1"
	  "$mod SHIFT, 2, movetoworkspace, r~2"
	  "$mod SHIFT, 3, movetoworkspace, r~3"
	  "$mod SHIFT, 4, movetoworkspace, r~4"
	  "$mod SHIFT, 5, movetoworkspace, r~5"
	  "$mod SHIFT, 6, movetoworkspace, r~6"
	  "$mod SHIFT, 7, movetoworkspace, r~7"
	  "$mod SHIFT, 8, movetoworkspace, r~8"
	  "$mod SHIFT, 9, movetoworkspace, r~9"
	  "$mod SHIFT, 0, movetoworkspace, r~10"
    "$mod, O, exec, wpctl set-mute @DEFAULT_SOURCE@ toggle" # Mute bind
    "$mod, L, exec, hyprlock"
    "CTRL, ESCAPE, exec, hyprshot -m region" # Screenshot bind # should be replaced with a rofi run mode
    #"SUPER, ESCAPE, exec, wlogout" # Logout Menu # wloutout sucks and should be replaced by a rofi run mode
    "SUPER, A, togglefloating"
    ", F11, fullscreen"
	];
  bindl = [
    ", XF86AudioPlay, exec, playerctl play-pause"
    ", XF86AudioNext, exec, playerctl next"
    ", XF86AudioPrev, exec, playerctl previous"
    ", XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
    ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
    ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
  ];
  workspace = [
    "1, monitor:DP-1"
    "2, monitor:DP-1"
    "3, monitor:DP-1"
    "4, monitor:DP-1"
    "5, monitor:DP-1"
    "6, monitor:DP-1"
    "7, monitor:DP-1"
    "8, monitor:DP-1"
    "9, monitor:DP-1"
    "10, monitor:DP-1"
    "11, monitor:HDMI-A-1"
    "12, monitor:HDMI-A-1"
    "13, monitor:HDMI-A-1"
    "14, monitor:HDMI-A-1"
    "15, monitor:HDMI-A-1"
    "16, monitor:HDMI-A-1"
    "17, monitor:HDMI-A-1"
    "18, monitor:HDMI-A-1"
    "19, monitor:HDMI-A-1"
    "20, monitor:HDMI-A-1"
  ];
  exec-once = [
    "waybar"
    "dunst"
  ];
      };
    };
    # Set hyprcursor
    home.pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      name = lib.mkForce "Bibata-Modern-Ice";
      #size = lib.mkForce 20;
      package = lib. mkForce pkgs.bibata-cursors;
    };
}
