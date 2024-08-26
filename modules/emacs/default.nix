{ pkgs, ... }: {

  programs.emacs = {
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = ./init.el;
      #config = ./config.org;
      defaultInitFile = true;
      #alwaysTangle = true;
      package = pkgs.emacs-pgtk.override {
        withTreeSitter = true;
      };
      extraEmacsPackages = epkgs: with epkgs; [
        evil evil-collection general which-key
        vterm multi-vterm
        org-bullets toc-org org-roam org-roam-ui
        auctex pdf-tools
        pass
        adwaita-dark-theme telephone-line rainbow-delimiters highlight-indent-guides
        nix-ts-mode treesit-grammars.with-all-grammars
      ];
    });
  };

  home.packages = with pkgs; [ texliveMedium nixd ];

  #services.emacs.enable = true;

}
