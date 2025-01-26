{
  programs.yazi = {
    enable = true;
    initLua = ''
      require("full-border"):setup()
    '';
  };
}
