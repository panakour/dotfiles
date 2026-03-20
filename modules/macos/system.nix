{ config, ... }:
{
  system = {
    primaryUser = config.user;

    defaults = {
      NSGlobalDomain = {
        InitialKeyRepeat = 15;
        KeyRepeat = 2;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticInlinePredictionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
      };

      dock = {
        autohide = true;
        autohide-delay = 0.0;
      };

      finder = {
        AppleShowAllExtensions = true;
        FXDefaultSearchScope = "SCcf";
        FXEnableExtensionChangeWarning = false;
        FXPreferredViewStyle = "Nlsv";
      };

      LaunchServices = {
        LSQuarantine = true;
      };

      WindowManager = {
        GloballyEnabled = false;
      };

      loginwindow = {
        GuestEnabled = false;
      };

      menuExtraClock = {
        Show24Hour = true;
      };

    };
  };

  networking.applicationFirewall = {
    allowSigned = true;
    allowSignedApp = true;
    blockAllIncoming = false;
    enable = true;
    enableStealthMode = true;
  };
}
