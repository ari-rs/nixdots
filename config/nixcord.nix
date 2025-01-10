{ pkgs, ... }:
{
  programs.nixcord = {
    enable = true;
    discord.vencord.package = pkgs.vencord; # Broken builds without even though
    # It should only be needed on stables
    config = {
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
