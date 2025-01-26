{
  imports = [ ./languages.nix ];
  programs.helix = {
    defaultEditor = true;
    enable = true;
    settings = {
      keys.normal = {
        space.space = "file_picker";
        space.x = ":x";
        space.w = ":w";
        space.q = ":q";
      };
      editor.cursor-shape = {
        insert = "bar";
        normal = "block";
        select = "underline";
      };
      editor.statusline = {
        left = [
          "mode"
          "spinner"
          "version-control"
          "file-name"
        ];
      };
    };
  };
}
