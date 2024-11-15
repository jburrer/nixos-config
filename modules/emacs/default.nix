{ pkgs, ... }:

let

emacsPackage = (pkgs.emacsWithPackagesFromUsePackage {
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

in {

  services.emacs = {
    enable = true;
    defaultEditor = true;
    startWithUserSession = "graphical";
    socketActivation.enable = true;
    package = emacsPackage;
  };

  home.packages = with pkgs; [ texliveFull texlivePackages.wrapfig2 nixd rust-analyzer maven ];

  xdg.desktopEntries."emacsclient" = {
    name = "Emacs Client";
    genericName = "Text Editor";
    comment = "Edit text";
    exec = "${emacsPackage}/bin/emacsclient -c %F";
    icon = "${emacsPackage}/share/icons/hicolor/128x128/apps/emacs.png";
    settings."StartupWMClass" = "emacs";
    mimeType = [
      "text/english" "text/plain" "text/x-makefile" "text/x-c++hdr" "text/x-c++src"
      "text/x-chdr" "text/x-csrc" "text/x-java" "text/x-moc" "text/x-pascal" "text/x-tcl"
      "text/x-tex" "application/x-shellscript" "text/x-c" "text/x-c++"
    ];
  };

}
