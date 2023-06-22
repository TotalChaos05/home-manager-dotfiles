{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "basilk";
  home.homeDirectory = "/home/basilk";
   
# This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
    # pkgs.hello
#    pkgs.catppuccin-gtk
    pkgs.catppuccin-cursors
    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };
  services.mako.enable = true;
  stylix.targets.mako.enable = true;
  programs.swaylock = {
  enable = true;
  settings = {
  #  image="~/.wallpaper";
    scaling="fill";
    };
  };
    
  wayland.windowManager.sway = {
  enable = true;
  config = rec {
    modifier = "Mod4";
    terminal="foot";
    left="h";
    right="l";
    up="k";
    down="j";
    menu = "rofi -show combi -combi-modes drun#run - modes combi";
    input = {
      "type:touchpad" = {
        click_method = "clickfinger";
        tap = "enabled";
        natural_scroll = "enabled";
        #pointer_accel 0.3 
        #accel_profile adaptive
        middle_emulation = "enabled";
        };
      };
      bars = [
      {command = "waybar";
      position = "top";}
      ];
    };
  };
  services.swayidle = {
    enable = true;
    timeouts = [{ timeout = 300; command = "swaylock -f -c 000000";  } { timeout = 600; command = "swaymsg 'output * power off'"; resumeCommand="swaymsg 'output * power on'"; }];
    events = [{ event = "before-sleep"; command = "/usr/bin/swaylock -F -l -f -c 000000";}];
    };
  programs.waybar = import ./waybar.nix;
  


      
    
# # Cursor
  # # home.file.".icons/default".source = "${pkgs.catppuccin-cursors.mochaPink}/share/icons/Catppuccin-Mocha-Pink-Cursors";
  

  stylix.image = /home/basilk/.wallpaper;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-light-hard.yaml";
  
  #Stylix Targets
  stylix.targets.gtk.enable = true;
  stylix.targets.sway.enable = true;
  stylix.targets.swaylock.enable = true;
  stylix.targets.waybar.enable = true;
  stylix.targets.foot.enable = true;
  stylix.targets.rofi.enable = true;
  programs.rofi.enable = true;
  programs.foot.enable = true;
  # # FONTS
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
# You can also manage environment variables but you will have to manually
  # source
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/basilk/etc/profile.d/hm-session-vars.sh
  #
  # if you don't want to manage your shell through Home Manager.
  home.sessionVariables = {
    # EDITOR = "emacs";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
