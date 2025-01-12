{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    discord.vencord.package = pkgs.vencord; # Broken builds without even though
    # It should only be needed on stables
    quickCss = ''
/* Hides Store and Shop button */
[href="/store"], 
[href='/shop']
{
  display: none;
}
/* Hide Nitro Gift button */
button[aria-label="Send a gift"] {
  display: none;
}


/* Hide sticker picker button */
button[aria-label="Open sticker picker"] {
  display: none;
}
      '';
    config = {
      useQuickCss = true;
      plugins = {
        callTimer.enable = true;
	fakeNitro.enable = true;
	fixSpotifyEmbeds.enable = true;
	gameActivityToggle.enable = true;
	mentionAvatars.enable = true;
	messageLatency.enable = true;
	messageLogger.enable = true;
	noF1.enable = true;
	noOnboardingDelay.enable = true;
	plainFolderIcon.enable = true;
	translate.enable = true;
	typingIndicator.enable = true;
	volumeBooster.enable = true;
	youtubeAdblock.enable = true;
	webScreenShareFixes.enable = true;
      };
    };
  };  
}
