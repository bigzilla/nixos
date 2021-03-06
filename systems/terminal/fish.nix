{ config, pkgs, ... }:

{
  programs.fish.enable = true;

  home-manager.sharedModules = [{
    programs.fish = {
      enable = true;
      shellAbbrs = {
        rebuild = "sudo nixos-rebuild -I nixos-config=$NIXOS_CONFIG";
        wifi = "nmcli device wifi";
        g = "git";
        gs = "git status";
        ga = "git add";
        gc = "git commit";
        gcm = "git commit -m";
        gca = "git commit --ammend";
        gco = "git checkout";
        gb = "git branch";
        gpl = "git pull";
        gps = "git push";
      };
      shellInit = ''
        set -g theme_display_date no
        set -g theme_display_git_master_branch yes
        set -g theme_color_scheme dracula
        set -g theme_nerd_fonts yes
      '';
      interactiveShellInit = ''
        direnv hook fish | source
      '';
      functions = {
        fish_greeting = ""; # Disable greeting
      };
      plugins = [
        {
          name = "theme-bobthefish";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "theme-bobthefish";
            rev = "14a6f2b317661e959e13a23870cf89274f867f12";
            sha256 = "sha256-kl6XR6IFk5J5Bw7/0/wER4+TnQfC18GKxYbt9C+YHJ0=";
          };
        }
      ];
    };
  }];
}
