let
  browser = [ "zen" ];
  imageViewer = [ "org.gnome.Loupe" ];
  videoPlayer = [ "io.github.celluloid_player.Celluloid" ];
  audioPlayer = [ "io.bassi.Amberol" ];
  xdgAssociations =
    type: program: list:
    builtins.listToAttrs (
      map (e: {
        name = "${type}/${e}";
        value = program;
      }) list
    );
  image = xdgAssociations "image" imageViewer [
    "png"
    "svg"
    "jpeg"
    "gif"
  ];
  video = xdgAssociations "video" videoPlayer [
    "mp4"
    "avi"
    "mkv"
  ];
  audio = xdgAssociations "audio" audioPlayer [
    "mp3"
    "flac"
    "wav"
    "aac"
  ];
  browserTypes =
    (xdgAssociations "application" browser [
      "json"
      "x-extension-htm"
      "x-extension-html"
      "x-extension-shtml"
      "x-extension-xht"
      "x-extension-xhtml"
      "xhtml+xml"
    ])
    // (xdgAssociations "x-scheme-handler" browser [
      "about"
      "chrome"
      "ftp"
      "http"
      "https"
      "unknown"
    ]);
  associations = builtins.mapAttrs (_: v: (map (e: "${e}.desktop") v)) (
    {
      #"application/pdf" = ["org.pwmt.zathura-pdf-mupdf"];
      "text/html" = browser;
      "text/plain" = [ "Helix" ];
      "inode/directory" = [ "yazi" ];
    }
    // image
    // video
    // audio
    // browserTypes
  );
in
{
  xdg = {
    mimeApps = {
      enable = true;
      defaultApplications = associations;
    };
    userDirs = {
      enable = true;
      createDirectories = true;
      templates = null;
      publicShare = null;
    };
  };
}
