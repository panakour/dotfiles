{ config, pkgs, ... }:
{
  home-manager.users.${config.user} = {
    home.packages = with pkgs; [
      tig
    ];

    programs.git = {
      enable = true;

      signing = {
        key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAILMurx2Qcxl0cLWtwqppdTiAXeMFV4SMN9t+dXKKdwEL";
        format = "ssh";
        signByDefault = true;
      };

      settings = {
        user = {
          name = "Panagiotis Koursaris";
          email = "panakourweb@gmail.com";
        };

        commit.gpgsign = true;
        gpg = {
          format = "ssh";
          ssh = {
            program =
              if pkgs.stdenv.hostPlatform.isDarwin then
                "/Applications/1Password.app/Contents/MacOS/op-ssh-sign"
              else
                "/opt/1Password/op-ssh-sign";
          };
        };

        alias = {
          retag = "!f() { git tag -f -a \"$1\" -m \"$1\" && git push origin \"$1\" -f; }; f";
          deltag = "!f() { git tag -d \"$1\" && git push --delete origin \"$1\"; }; f";
          base = "!git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null || echo origin/main";
          review = "!crit --base-branch \"$(git base)\"";
          review-modified = "!f() { b=$(git base); files=$(git diff --name-only --diff-filter=M \"$b\"...HEAD); [ -n \"$files\" ] || { echo 'No modified files'; return 0; }; crit --base-branch \"$b\" $files; }; f";
          review-wip = "!crit --base-branch HEAD";
          review-pr = "!f() { crit --pr \"$@\"; }; f";
          review-range = "!f() { crit --range \"$1\"; }; f";
        };

        branch.autosetuprebase = "always";

        color = {
          branch = {
            current = "green reverse";
            local = "green";
            remote = "yellow";
          };

          status = {
            added = "green";
            changed = "yellow";
            untracked = "blue";
          };
        };

        core = {
          editor = "vim";
          autocrlf = "input";
        };

        init.defaultBranch = "main";

        push.default = "current";

        rebase = {
          autostash = true;
        };

        user.useConfigOnly = true;
      };

      includes = [
        {
          condition = "gitdir:~/learnworlds/";
          contents = {
            user = {
              email = "panagiotis@learnworlds.com";
              signingKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIN9gHle63GwYiGaqaNexBH8UglcO+FfhUpsGQRz2036G";
            };
          };
        }
      ];

      ignores = [
        ".direnv"
        "__pycache__"
        "node_modules"
        "*.log"
        ".DS_Store"
      ];
    };
  };
}
