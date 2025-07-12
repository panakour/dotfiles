{
  system.activationScripts.preActivation.text = ''
    if ! xcode-select --version 2>/dev/null; then
      run xcode-select --install
    fi
    if ! /opt/homebrew/bin/brew --version 2>/dev/null; then
      run /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    fi
  '';

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
    ];
    brews = [
      "stripe/stripe-cli/stripe"
    ];
  };
}
