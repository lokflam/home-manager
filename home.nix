{
  config,
  pkgs,
  userArgs,
  ...
}:
{
  nixpkgs.overlays = [ (import ./overlay/neovim-0.10.1.nix { inherit pkgs; }) ];

  home.username = userArgs.username;
  home.homeDirectory = userArgs.homeDirectory;

  home.stateVersion = "24.05";

  home.sessionVariables = {
    EDITOR = "nvim";
    VISUAL = "$EDITOR";
  };

  home.shellAliases = {
    za = "zellij attach --create $(basename $(pwd))";
  };

  programs.home-manager.enable = true;

  programs.git = {
    enable = true;
    userName = userArgs.git.userName;
    userEmail = userArgs.git.userEmail;
  };

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    oh-my-zsh.enable = true;

    initExtra = ''
      if [ -e ${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.sh ]; then
        . ${config.home.homeDirectory}/.nix-profile/etc/profile.d/nix.sh;
      fi
    '';
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = builtins.fromTOML (builtins.readFile ./config/starship.toml);
  };

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ./config/wezterm.lua;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    # IDE
    zellij
    neovim

    # tools
    btop
    fd
    ripgrep

    # languages
    nodejs_22 # for Neovim Copilot plugin

    # nix lsp & formatter
    nil
    nixfmt-rfc-style
  ];

  xdg.configFile = {
    "zellij/config.kdl".source = ./config/zellij.kdl;
    "nvim".source = config.lib.file.mkOutOfStoreSymlink "${userArgs.projectRoot}/config/nvim";
  };
}
