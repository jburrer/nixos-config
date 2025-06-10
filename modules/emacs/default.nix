{ pkgs, osConfig, ... }:

let emacsPackage = (pkgs.emacsWithPackagesFromUsePackage {
  config = ./init.el;
  defaultInitFile = true;
  package = pkgs.emacs-gtk;
  alwaysEnsure = true;
  extraEmacsPackages = epkgs: with epkgs; [
    evil evil-collection general which-key
    vterm multi-vterm
    org-bullets toc-org org-roam org-roam-ui
    auctex pdf-tools
    pass
    adwaita-dark-theme telephone-line rainbow-delimiters highlight-indent-guides
    nix-ts-mode
    rust-mode rustic
    quickrun yasnippet dap-mode lsp-treemacs treemacs lsp-ui lsp-mode
    treesit-grammars.with-all-grammars
  ];
});
in {

  programs.emacs = {
    enable = true;
    package = emacsPackage;
  };

  home.packages = (with pkgs; [
    texliveFull texlivePackages.wrapfig2 nixd
    rust-analyzer rustfmt
  ]);

}
