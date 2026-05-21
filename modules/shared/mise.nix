{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.mise = {
      enable = true;
      enableFishIntegration = true;
      globalConfig = {
        tools = {
          usage = "latest";
          python = "latest";
          opencode = "latest";
          codex = "latest";
        };
      };
    };
  };
}
