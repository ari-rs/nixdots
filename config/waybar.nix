{ ... }:
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        spacing = "15";
        height = 40;
        margin-top = 4;
        margin-left = 4;
        margin-right = 4;
        modules-left = [];
        modules-center = [];
        modules-right = [];
        output = [ "DP-1" ];
      };
    };
  };
}
