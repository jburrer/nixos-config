{ pkgs, ... }: {

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
    socketActivation.enable = true;
    client.enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = ./init.el;
      defaultInitFile = true;
      package = pkgs.emacs-pgtk.override {
        withTreeSitter = true;
      };
      extraEmacsPackages = epkgs: with epkgs; [
        evil evil-collection general which-key
        vterm multi-vterm eat
        org-bullets toc-org org-roam org-roam-ui
        auctex pdf-tools
        pass
        adwaita-dark-theme telephone-line rainbow-delimiters highlight-indent-guides
        nix-ts-mode rustic
        quickrun yasnippet dap-mode lsp-treemacs treemacs lsp-ui lsp-mode lsp-java
        treesit-grammars.with-all-grammars
      ];
    });
  };

  home.packages = with pkgs; [ texliveMedium nixd rust-analyzer maven ];

}
