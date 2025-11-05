{userSettings, ...}: {
  home = {
    stateVersion = "25.05";
  };

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
