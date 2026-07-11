{ config, ... }:
{
  home-manager.users.${config.user} = {
    programs.mise = {
      enable = true;
      enableFishIntegration = true;
      globalConfig = {
        settings = {
          trusted_config_paths = [ "~/learnworlds-worktrees" ];
        };
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
          mago = "latest";
          "1password-cli" = "latest";
          "github:psviderski/uncloud" = {
            version = "latest";
            exe = "uc";
          };
        };
      };
    };
  };
}
