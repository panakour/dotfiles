{ config, lib, ... }:
{
  home-manager.users.${config.user} = {
    programs.mise = {
      enable = true;
      enableFishIntegration = true;
      globalConfig = {
        settings = {
          trusted_config_paths = [ "~/learnworlds-worktrees" ];
          go.set_gobin = false;
        };
        tools = {
          usage = "latest";
          python = "latest";
          uv = "latest";
          node = "latest";
          go = "latest";
          opencode = "latest";
          codex = "latest";
          imagemagick = "latest";
          mkcert = "latest";
          yt-dlp = "latest";
          opentofu = "latest";
          packer = "latest";
          hcloud = "latest";
          mago = "latest";
          gh = "latest";
          gcloud = "latest";
          stripe = "latest";
          "1password-cli" = "latest";
          just = "latest";
          hunk = "latest";
          jq = "latest";
          rust = {
            version = "1.96.1";
            components = "rust-analyzer";
          };
          zig = "0.16.0";
          "cargo:https://github.com/panakour/herdr" = {
            version = "rev:c0ad66e89cdb26aa2b0f4793fecfa65984c266fc";
            locked = true;
          };
          "github:karol-broda/snitch" = "latest";
          "github:psviderski/uncloud" = {
            version = "latest";
            exe = "uc";
          };
        }
        // lib.optionalAttrs config.devops.enable {
          kubectl = "latest";
          kustomize = "latest";
          k3d = "latest";
          kubie = "latest";
          k9s = "latest";
          stern = "latest";
        };
      };
    };
  };
}
