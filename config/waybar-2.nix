{ ... }:
{
  programs.waybar = {
    settings = {
      mainBar = {
        layer = "top";
        height = 36;
        modules-left = [ "hyprland/workspaces" "clock" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "temperature" "cpu" "memory" "pulseaudio" ];
        output = [ "DP-1" ];
        "clock" = {
          format = "<span color=\"#7aa2f7\"> </span>{:%H:%M:%S}";
          format-alt = "<span color=\"#7aa2f7\"> </span>{:%d-%m-%Y}";
          interval = 1;
        };
        "cpu" = {
          format = "<span color=\"#7aa2f7\"> </span>{usage}%";
          interval = 2;
        };
        "memory" = {
          format = "<span color=\"#7aa2f7\"> </span>{used}GiB";
          interval = 2;
        };
        "pulseaudio" = {
          scroll-step = 5;
          format = "<span color=\"#7aa2f7\">{icon} </span>{volume}%";
          format-muted = "<span color=\"#f7768e\"> </span>Muted";
          format-icons = [ "" "" "" ];
        };
      };
    };
    style = ''
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
