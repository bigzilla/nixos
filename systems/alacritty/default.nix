{ config, pkgs, ... }:

{
  programs.alacritty = {
    enable = true;
    settings = {
      window = {
        opacity = 0.8;
      };
      font = {
        size = 9;
      };
    };
  };
}
