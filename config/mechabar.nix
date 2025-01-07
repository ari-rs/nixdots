{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        #height = 24;
        mode = "dock";
        gtk-layer-shell = true;
        output = [ "DP-1" ];
        modules-left = [ 
          "custom/ws" 
          "custom/left1"

          "hyprland/workspaces"
          "custom/right1"

          "custom/paddw"
          "hyprland/window"
        ];
        modules-center = [
          "custom/paddc"
          "custom/left2"
          "custom/cpuinfo"

          "custom/left3"
          "memory"

          "custom/left4"
          "custom/cpu"
          "custom/leftin1"

          "custom/left5"
          "idle_inhibitor"
          "custom/right2"

          "custom/rightin1"
          "clock#time"
          "custom/right3"

          "clock#date"
          "custom/right4"

          "custom/wifi"
          "bluetooth"
          "custom/update"
          "custom/right5"
        ];
        modules-right = [
          "custom/media"

          "custom/left6"
          "pulseaudio"

          "custom/left7"
          "custom/backlight"

          "custom/left8"
          "battery"

          "custom/leftin2"
          "custom/power"
        ];
        "custom/ws" = {
          format = "  ";
          tooltip = false;
          min-length = 3;
          max-length = 3;
        };
        "hyprland/workspaces" = {
          on-scroll-up = "hyprctl dispatch workspace -1";
          on-scroll-down = "hyprctl dispatch workspace +1";
          persistent-workspaces = {
            "1" = [];
            "2" = [];
            "3" = [];
            "4" = [];
            "5" = [];
          };
          "hyprland/window" = {
            format = "{}";
            min-length = 5;
            rewrite = {
              "~" = "  Terminal";
              "fish" = "  Terminal";
              "kitty" = "  Terminal";
              "ari@hydrogen:(.*)" = "  Terminal";
              "(.*)ari@hydrogen:~" = "  Terminal";
              "(.*)Zen Browser" = "<span foreground='#cdd6f4'>󰈹 </span> Zen Browser";
              "(.*) — Zen Browser" = "<span foreground='#cdd6f4'>󰈹 </span> $1";
            };
            "custom/cpuinfo" = {
              exec = "~/nixos/scripts/waybar/cpu-temp.sh";
              return-type = "json";
              format = "{}";
              tooltip = "true";
              interval = 5;
              min-length = 8;
              max-length = 8;
            };
            "memory" = {
              states = {
                warning = 75;
                critical = 90;
              };
              format = "󰘚 {percentage}%";
              format-critical = "󰀦 {percentage}%";
              tooltip = "true";
              tooltip-format = "Memory Used: {used:0.1f} GB / {total:0.1f} GB";
              interval = 5;
              min-length = 7;
              max-length = 7;
            };
            "custom/cpu" = {
              exec = "~/nixos/scripts/waybar/cpu-usage.sh";
              return-type = "json";
              tooltip = "true";
              interval = 5;
              min-length = 6;
              max-length = 6;
            };
            "idle_inhibitor" = {
              format = " ";
              tooltip = "true";
              tooltip-format-activated = "Presentation Mode";
              tooltip-format-deactivated = "Idle Mode";
              start-activated = "false";
              timeout = 5;
            };
            "clock#time" = {
              format = "󱑂 {:%H:%M}";
              tooltip = "true";
              tooltip-format = "Standard Time: {:%I:%M %p}";
              min-length = 8;
              max-length = 8;
            };
            "clock#date" = {
              format = "󰨳 {:%m-%d}";
              tooltip-format = "<tt>{calendar}</tt>";
              calendar = {
                mode = "month";
                mode-mon-col = 6;
                on-click-right = "mode";
                format = {
                  months = "<span color='#b4befe'><b>{}</b></span>";
                  weekdays = "<span color='#a6adc8' font='7'>{}</span>";
                  today = "<span color='#f38ba8'><b>{}</b></span>";
                };
                actions = {
                  on-click = "mode";
                  on-click-right = "mode";
                };
              };
              min-length = 8;
              max-length = 8;
            };
            "custom/wifi" = {
              exec = "~/nixos/scripts/waybar/wifi-status.sh";
              return-type = "json";
              format = "{}";
              tooltip = "true";
              interval = 1;
              min-length = 1;
              max-length = 1;
            };
            "bluetooth" = {
              format = "󰂰";
              format-disabled = "󰂲";
              format-connected = "󰂱 ";
              format-connected-battery = "󰂱 ";
              tooltip-format = "{num_connections} connected";
              tooltip-format-disabled = "Bluetooth Disabled";
              tooltip-format-connected = "{num_connections} connected\n{device_enumerate}";
              tooltip-format-enumerate-connected = "{device_alias}";
              tooltip-format-enumerate-connected-battery = "{device_alias}: {device_battery_percentage}%";
              #on-click
              #on-click-right
              interval = 1;
              min-length = 1;
              max-length = 1;
            };
            "custom/update" = {
              #exec ##TODO
              return-type = "json";
              format = "{}";
              #on-click
              interval = 60;
              tooltip = "true";
              min-length = 1;
              max-length = 1;
            };
            "pulseaudio" = {
              format = "{icon} {volume}%";
              format-muted = "󰝟 {volume}%";
              format-icons = {
                default = ["󰕿" "󰖀" "󰕾"];
                headphone = "󰋋";
                headset = "󰋋";
              };
              on-scroll-up = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%+";
              on-scroll-down = "wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-";
              on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
              min-length = 6;
              max-length = 6;
            };
            "custom/backlight" = {
              #exec ##TODO
              return-type = "json";
              format = "{}";
              tooltip = "true";
              min-length = 6;
              max-length = 6;
            };
            "battery" = {
              format = "{icon} {capacity}%";
              format-icons = ["󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂"];
              format-full = "󱃌 {capacity}%";
              format-warning = "󰁻 {capacity}%";
              format-critical = "󱃍 {capacity}%";
              format-charging = "󱘖 {capacity}%";

              tooltip-format = "Discharging: {time}";
              tooltip-format-charging = "Charging: {time}";
              interval = 1;
              min-length = 6;
              max-length = 6;
            };
            "custom/power" = {
              format = " ";
              tooltip = "false";
              on-click = "wlogout";
            };
            "custom/paddw" = {
              format = " ";
              tooltip = "false";
            };
            "custom/paddc" = {
              format = " ";
              tooltip = "false";
            };
            "custom/left1" = {
              format = "";
              tooltip = "false";
            };
            "custom/left2" = {
              format = "";
              tooltip = "false";
            };
            "custom/left3" = {
              format = "";
              tooltip = "false";
            };
            "custom/left4" = {
              format = "";
              tooltip = "false";
            };
            "custom/left5" = {
              format = "";
              tooltip = "false";
            };
            "custom/left6" = {
              format = "";
              tooltip = "false";
            };
            "custom/left7" = {
              format = "";
              tooltip = "false";
            };
            "custom/left8" = {
              format = "";
              tooltip = "false";
            };
            "custom/right1" = {
              format = "";
              tooltip = "false";
            };
            "custom/right2" = {
              format = "";
              tooltip = "false";
            };
            "custom/right3" = {
              format = "";
              tooltip = "false";
            };
            "custom/right4" = {
              format = "";
              tooltip = "false";
            };
            "custom/right5" = {
              format = "";
              tooltip = "false";
            };
            "custom/leftin1" = {
              format = "";
              tooltip = "false";
            };
            "custom/leftin2" = {
              format = "";
              tooltip = "false";
            };
            "custom/rightin1" = {
              format = "";
              tooltip = "false";
            };
          };

        };
      };
    style = ''
        
      '';
    };
  };
}
