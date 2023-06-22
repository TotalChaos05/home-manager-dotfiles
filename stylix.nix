{ config, pkgs, ... }:
{  stylix.targets.gtk.enable = true;
  stylix.targets.sway.enable = true;
  stylix.targets.swaylock.enable = true;
  stylix.targets.waybar.enable = true;
  stylix.targets.foot.enable = true;
  stylix.targets.rofi.enable = true;
  stylix.targets.gnome.enable = true;
  stylix.targets.mako.enable = true;
  stylix.image = ./.wallpaper;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine-moon.yaml";
  stylix.fonts = {
    serif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Serif";
    };

    sansSerif = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans";
    };

    monospace = {
      package = pkgs.dejavu_fonts;
      name = "DejaVu Sans Mono";
    };

    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };
  };
  }
