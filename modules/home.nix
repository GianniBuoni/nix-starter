{userSettings, ...}: {
  home = {
    username = userSettings.userName;
    homeDirectory = "/home/${userSettings.userName}";
    stateVersion = "25.05";
  };
  programs.home-manager.enable = true;

  # Alacritty
  programs = {
    alacritty.enable = true;

    zsh = {
      enable = true;
      shellAliases = {
        "cd" = "z";
        "ls" = "eza --icons=always";
      };
      syntaxHighlighting.enable = true;
      autosuggestion.enable = true;
    };

    # terminal programs
    fd.enable = true;
    fzf.enable = true;
    eza.enable = true;
    ripgrep.enable = true;
    starship.enable = true;
    zoxide.enable = true;
  };
}
