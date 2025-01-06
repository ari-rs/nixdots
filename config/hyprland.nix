{ lib, pkgs, ... }:
{
    wayland.windowManager.hyprland = {
      enable = true;
      settings = {
        "$terminal" = "kitty";
	"$browser" = "zen";
	"$launcher" = "rofi -show drun";
	"$mod" = "super";
        "input:sensitivity" = "-2";
	env = [
         # "NIXOS_OZONE_WL,1" # Electron + Wayland is broken
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
	  "$mod SHIFT, 10, movetoworkspace, r~10"
	];
      };
    };
    # Set hyprcursor
    home.pointerCursor = {
      gtk.enable = true;
      hyprcursor.enable = true;
      name = lib.mkForce "Bibata-Modern-Ice";
      size = lib.mkForce 24;
      package = lib. mkForce pkgs.bibata-cursors;
    };
}
