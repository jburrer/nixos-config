{ pkgs, emacs-overlay, ... }:

{
 
  programs.emacs = {
    enable = true;
    package = emacs-overlay.packages.${pkgs.system}.emacs-pgtk.override {
      withTreeSitter = true;
    };
    extraConfig = (builtins.readFile ./init.el);
    extraPackages = epkgs: with epkgs; [
      evil evil-collection
      vterm multi-vterm
      doom-themes
      nix-ts-mode
      org-roam
      #eglot
      treesit-grammars.with-all-grammars
    ];
  };

  services.emacs.enable = true;

  stylix.targets.emacs.enable = false;

}
