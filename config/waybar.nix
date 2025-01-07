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
        modules-right = [ "temperature" "cpu" "memory" "pulseaudio" ];
        output = [ "DP-1" ];
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
  font-family: JetBrainsMono Nerd Font, feather;
  font-weight: 900;
  font-size: 14px;
  color: #c0caf5;
}

/* Set background color of main waybar window */
window#waybar {
  background: rgba(21, 22, 30, 0.5);
}

/* Set background color of tooltips */
tooltip {
  background: #1e1e2e;
}

/* Set workspace text color and padding */
#workspaces button {
  padding: 0;
}

/* Sets active workspace to have a solid line on the bottom */
#workspaces button.active {
  border-bottom: 2px solid #7aa2f7;
  border-radius: 0;
  margin-bottom: 2px;
}

/* More workspace stuff for highlighting on hover */
#workspaces button.focused {
  color: #a6adc8;
}

#workspaces button.urgent {
  color: #f7768e;
}

#workspaces button:hover {
  background: #11111b;
  color: #cdd6f4;
}

/* Sets background, padding, margins, and borders for (all) modules */
#custom-kernel,
#custom-pacman,
#workspaces,
#clock,
#window,
#temperature,
#cpu,
#memory,
#pulseaudio,
#tray,
#mpd {
  background: rgba(21, 22, 30, 0.7);
  padding: 0 10px;
  margin: 3px 0;
  border: 0;
}

#window.empty {
  background: rgba(0, 0, 0, 0);
}

/* Set up rounding to make these modules look like separate pills */
#mpd {
  border-radius: 8px;
  margin-left: 4px;
}

#tray {
  border-radius: 8px;
  margin-right: 4px;
}

#window {
  border-radius: 8px;
}

/* Rounding only on left of module */
#temperature {
  border-radius: 8px 0 0 8px;
}

/* Rounding only on right of module(s) */
#custom-pacman,
#custom-kernel {
  border-radius: 0 8px 8px 0;
}

    '';
  };
}
