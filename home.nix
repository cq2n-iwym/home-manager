# https://rycee.gitlab.io/home-manager/options.html
{ config, pkgs, ... }:
{
  home = {
    stateVersion = "22.11";
    homeDirectory = "/home/${config.home.username}";
    packages = with pkgs; [
      albert
      awscli2
      aws-sam-cli
      aws-vault
      bat
      bind
      cachix
      checkstyle
      comma
      commitizen
      curl
      deno
      difftastic
      docker
      docker-compose
      docker-credential-helpers
      exa
      fd
      feh
      fuse
      gcc
      gh
      gitflow
      git-remote-codecommit
      gnumake
      go
      golangci-lint
      google-cloud-sdk
      gopls
      gron
      hadolint
      hr
      htop
      jq
      just
      libreoffice
      lsof
      manix
      mercurial
      neovim-remote
      nil
      nixpkgs-fmt
      nix-du
      nix-tree
      nodejs
      nodePackages.bash-language-server
      nodePackages.mermaid-cli
      nodePackages.npm
      nodePackages.prettier
      openssl
      pandoc
      pass
      pgcli
      pre-commit
      python310
      python310Packages.httpie
      ripgrep
      rnix-lsp
      scrot
      shellcheck
      shfmt
      simplescreenrecorder
      sqlite
      terraform
      textql
      time
      tldr
      ulauncher
      unar
      unzip
      vifm
      watson
      wget
      yq
      zip
    ];
  };
  programs = {
    home-manager.enable = true;
    direnv.enable = true;
    zsh.enable = true;
    # git = {
    #   enable = true;
    #   # Linux環境でデフォルトにしてよさそうな設定を書いている
    #   extraConfig = {
    #     init.defaultBranch = "main";
    #     core.autoCRLF = false;
    #     core.autoLF = false;
    #     core.quotePath = false;
    #     fetch.prune = true;
    #     blame.date = "short";
    #     merge.ff = false;
    #     merge.conflictstyle = "diff3";
    #     pull.rebase = true;
    #     push.autoSetupRemote = true;
    #     push.default = "current";
    #     rebase.autoStash = true;
    #     rebase.missingCommitsCheck = "warn";
    #     rerere.enabled = true;
    #     credential."https://github.com".helper = "!${pkgs.gh}/bin/gh auth git-credential";
    #     # 環境ごとの設定は ~/.config/git/config.local から読む
    #     include.path = "config.local";
    #   };
    # };
    nix-index.enable = true;
  };
  manual.manpages.enable = false;
}
# vim:foldmethod=indent:
