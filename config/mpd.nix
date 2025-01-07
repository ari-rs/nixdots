{ ... }:
{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/ari/Music";
    extraConfig = ''
      audio_output {
        type "pipewire"
        name "PipeWire Output"
      }
      '';
  };
}
