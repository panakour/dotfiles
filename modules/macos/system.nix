{ config, ... }:
{
  system = {
    primaryUser = config.user;

    defaults = {
      dock = {
        autohide = true;
        autohide-delay = 0.0;
        tilesize = 42;
        showhidden = true;
        show-recents = true;
        show-process-indicators = true;
        expose-group-apps = true;
        persistent-apps = [
          "/System/Applications/Reminders.app"
          "/System/Applications/Notes.app"
          "/System/Applications/Calendar.app"
          "/Applications/Brave Browser.app"
          "/Applications/Ghostty.app"
          "/Applications/PhpStorm.app"
          "/Applications/Slack.app"
          "/Applications/Claude.app"
          "/System/Applications/Mail.app"
          "/System/Applications/Messages.app"
        ];
      };
      NSGlobalDomain = {
        ApplePressAndHoldEnabled = false;
        KeyRepeat = 2;
        InitialKeyRepeat = 15;
        AppleShowScrollBars = "Always";
        NSWindowResizeTime = 0.1;
        NSAutomaticCapitalizationEnabled = false;
        NSAutomaticDashSubstitutionEnabled = false;
        NSAutomaticPeriodSubstitutionEnabled = false;
        NSAutomaticQuoteSubstitutionEnabled = false;
        NSAutomaticSpellingCorrectionEnabled = false;
        NSDocumentSaveNewDocumentsToCloud = false;
        _HIHideMenuBar = false;
      };
      finder = {
        FXDefaultSearchScope = "SCcf";
        FXPreferredViewStyle = "Nlsv";
        _FXShowPosixPathInTitle = true;
        FXEnableExtensionChangeWarning = false;
        AppleShowAllFiles = true;
        ShowStatusBar = true;
        ShowPathbar = true;
      };
      CustomUserPreferences = {
        "com.apple.NetworkBrowser" = {
          BrowseAllInterfaces = true;
        };
        "com.apple.screensaver" = {
          askForPassword = true;
          askForPasswordDelay = 0;
        };
        "com.apple.trackpad" = {
          scaling = 2;
        };
        "com.apple.mouse" = {
          scaling = 2.5;
        };
        "com.apple.desktopservices" = {
          DSDontWriteNetworkStores = false;
        };
        "com.apple.LaunchServices" = {
          LSQuarantine = true;
        };
        "NSGlobalDomain" = {
          NSNavPanelExpandedStateForSaveMode = true;
          WebKitDeveloperExtras = true;
        };
        "com.apple.Safari" = {
          IncludeInternalDebugMenu = true;
          IncludeDevelopMenu = true;
          WebKitDeveloperExtrasEnabledPreferenceKey = true;
          ShowFullURLInSmartSearchField = true;
          HomePage = "";
          AutoFillCreditCardData = false;
          AutoFillFromAddressBook = false;
          AutoFillMiscellaneousForms = false;
          AutoFillPasswords = false;
          "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" = true;
        };
      };
    };
  };

}
