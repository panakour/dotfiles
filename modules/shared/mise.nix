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
          node = "latest";
          opencode = "latest";
          codex = "latest";
          imagemagick = "latest";
          mkcert = "latest";
          opentofu = "latest";
          packer = "latest";
          hcloud = "latest";
        };
      };
    };
  };
}
