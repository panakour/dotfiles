{
  homebrew = {
    enable = true;
    onActivation = {
      autoUpdate = true;
      cleanup = "zap";
      upgrade = true;
    };

    casks = [
      "mongodb-compass"
      "hammerspoon"
      "orbstack"
      "ghostty"
      "slack"
      "scroll-reverser"
      "caffeine"
      "android-file-transfer"
      "android-studio"
      "dbeaver-community"
      "discord"
      "figma"
      "firefox"
      "gimp"
      "goland"
      "google-chrome"
      "chromium"
      "openvpn-connect"
      "phpstorm"
      "protonvpn"
      "signal"
      "thunderbird"
      "stats"
      "zed"
      "gcloud-cli"
      "redis-insight"
    ];
    brews = [
      "stripe/stripe-cli/stripe"
    ];
  };
}
