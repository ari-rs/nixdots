{
  services.mpd = {
    enable = true;
    musicDirectory = "/home/ari/Music";
    extraConfig = ''
      audio_output  {
        type "pipewire"
        name "Pipewire output"
      }
      auto_update "yes"
      restore_paused "yes"
    '';    
  };
}
