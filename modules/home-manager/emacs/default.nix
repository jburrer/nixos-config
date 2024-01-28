{ pkgs, ... }:

{

  programs.emacs = {
    enable = true;
    package = (pkgs.emacsWithPackagesFromUsePackage {
      config = ./init.el;
      defaultInitFile = true;
      alwaysTangle = true;
      package = pkgs.emacs-pgtk.override {
        withTreeSitter = true;
      };
      extraEmacsPackages = epkgs: with epkgs; [
        evil evil-collection general which-key
        vterm multi-vterm
	org-bullets toc-org
        auctex pdf-tools
        catppuccin-theme rainbow-delimiters highlight-indent-guides
        nix-ts-mode treesit-grammars.with-all-grammars
      ];
    });
  };

  home.packages = with pkgs; [ texliveBasic ];

  stylix.targets.emacs.enable = false;

  services.emacs.enable = true;

}
