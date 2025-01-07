{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = "15";
        height = 36;
        margin-top = 4;
        margin-bottom = 4;
        margin-left = 4;
        margin-right = 4;
        modules-left = [ "hyprland/workspaces" "clock" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "pulseaudio#microphone" "tray" "cpu" "memory" ];
        output = [ "DP-1" "HDMI-A-1" ];
        "pulseaudio" = {
          format = "{icon} {volume}";
          format-muted = "󰝟";
          format-icons = {
            headphone = "󰋋";
            headset = "󰋋";
          };
        };
        "pulseaudio#microphone" = {
          format = "{format_source}";
          format-source = "";
          format-source-muted = " ";
        };
      "hyprland/workspaces" = {
        disable-scroll = true;
        on-click = "activate";
        all-outputs = false;
        format = "{icon}";
        format-icons = {
          "1" = "1";
          "2" = "2";
          "3" = "3";
          "4" = "4";
          "5" = "5";
          "6" = "6";
          "7" = "7";
          "8" = "8";
          "9" = "9";
          "10" = "10";
          "11" = "1";
          "12" = "2";
          "13" = "3";
          "14" = "4";
          "15" = "5";
          "16" = "6";
          "17" = "7";
          "18" = "8";
          "19" = "9";
          "20" = "10";
        };
      };
      "hyprland/window" = {
          max-length = 96;
      };
      "tray" = {
        spacing = 5;
      };
      "cpu" = {
        interval = 10;
        format = "󰍛 {usage}%";
      };
      "clock" = {
        format = "{:%I:%M %p}";
      };
      "memory" = {
        states = {
          "c" = 90;
          "h" = 60;
          "m" = 30;
        };
      format = "󰾆 {used}GB";
      format-m = "󰾅 {used}GB";
      format-h = "󰓅 {used}GB";
      format-c = " {used}GB";
      interval = 30;
      max-length = 10;
      };
    };
    };
    style = 
    ''
* {
  border: none;
  margin: 0;
  min-height: 0;
  font-size: 14px;
  font-weight: bold;
}
window#waybar > box {
  background-color: transparent;
  box-shadow: 0 0 2px 1px rgba(0, 0, 0, 1);
  margin: 2px;
}
#workspaces button {
  border-radius: 8px;
  box-shadow: none;
  margin: 2px 0;
  padding: 0 2px;
  transition: none;
}
#workspaces button:hover {
  background: @hover-bg;
  text-shadow: none;
  box-shadow: none;
}
#workspaces button.active {
  text-shadow: 0 0 2px rgba(0, 0, 0, 0.6);
  box-shadow: 0 0 2px 1px rgba(0, 0, 0, 0.4);
  margin: 2px;
  padding: 0 6px;
}

    '';
  };
}
