{ config, pkgs, ... }:
{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "basilk";
  home.homeDirectory = "/home/basilk";
  imports = [./sway.nix ./swaylock.nix ./stylix.nix];
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
    # pkgs.hello
#    pkgs.catppuccin-gtk
    pkgs.catppuccin-cursors
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

    

  services.swayidle = {
    enable = true;
    timeouts = [{ timeout = 300; command = "swaylock -f -c 000000";  } { timeout = 600; command = "swaymsg 'output * power off'"; resumeCommand="swaymsg 'output * power on'"; }];
    events = [{ event = "before-sleep"; command = "/usr/bin/swaylock -F -l -f -c 000000";}];
    };
  programs.waybar = import ./waybar.nix;
  #services.xserver = import ./gnome.nix;



      
    
# # Cursor
  # # home.file.".icons/default".source = "${pkgs.catppuccin-cursors.mochaPink}/share/icons/Catppuccin-Mocha-Pink-Cursors";
  


  
  #Stylix Targets

  #programs.gnome.enable = true;
  programs.rofi.enable = true;
  programs.foot.enable = true;
  # # FONTS
  
  
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
