;; emacs config !!!

;; remove top bars
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

;; make vterm the default buffer
(setq initial-buffer-choice 'multi-vterm)

;; dont know what this does yet
(transient-mark-mode 1)

;; line numbers
(setq-default major-mode 'text-mode)
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)

;; theme
(use-package doom-themes
             :ensure t
	     :config
	     (setq doom-themes-enable-bold t
		   doom-themes-enable-italic t
		   doom-font (font-spec :family "Cascadia Mono" :size 12))
	     (load-theme 'doom-tomorrow-night t)
	     (doom-themes-visual-bell-config)
	     (doom-themes-org-config))

;; org mode
(add-hook 'org-mode-hook 'variable-pitch-mode)
(use-package org
             :ensure t
	     :mode (("\\.org$" . org-mode))
	     :config
	     (setq-default org-startup-indented t
			   org-pretty-entities t
			   org-use-sub-superscripts "{}"
			   org-hide-emphasis-markers t
			   org-startup-with-inline-images t
			   org-image-actual-width '(300)))

(setq org-ellipsis " [+]")
(add-hook 'org-mode-hook 'variable-pitch-mode)
(let* ((variable-tuple
        (cond
         ((x-list-fonts "Cantarell")  '(:family "Cantarell"))))
       (fixed-tuple
        (cond
         ((x-list-fonts "Cascadia Mono")   '(:family "Cascadia Mono"   :height 160))))
       (headline `(:inherit default :weight bold)))
  (custom-theme-set-faces
   'user
   `(org-level-1 ((t (,@headline ,@variable-tuple))))
   `(org-level-2 ((t (,@headline ,@variable-tuple))))
   `(org-level-3 ((t (,@headline ,@variable-tuple))))
   `(org-level-4 ((t (,@headline ,@variable-tuple))))
   `(org-level-5 ((t (,@headline ,@variable-tuple))))
   `(org-level-6 ((t (,@headline ,@variable-tuple))))
   `(org-level-7 ((t (,@headline ,@variable-tuple))))
   `(org-level-8 ((t (,@headline ,@variable-tuple))))
   `(org-document-title ((t (,@headline ,@variable-tuple))))

   `(variable-pitch     ((t ,@variable-tuple)))
   `(fixed-pitch        ((t ,@fixed-tuple)))

   '(org-ellipsis ((t (:inherit fixed-pitch :foreground "gray40" :underline nil))))
   '(org-block            ((t (:inherit fixed-pitch))))
   '(org-block-begin-line ((t (:inherit fixed-pitch))))
   '(org-block-end-line   ((t (:inherit fixed-pitch))))
   '(org-src              ((t (:inherit fixed-pitch))))
   '(org-properties       ((t (:inherit fixed-pitch))))
   '(org-code             ((t (:inherit (shadow fixed-pitch)))))
   '(org-date             ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info    ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-drawer           ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent           ((t (:inherit (org-hide fixed-pitch)))))
   `(org-link             ((t (:inherit fixed-pitch :foreground ,(doom-color 'blue) :underline t))))
   '(org-meta-line        ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value   ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword  ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table            ((t (:inherit fixed-pitch))))
   '(org-tag              ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim         ((t (:inherit (shadow fixed-pitch)))))))

  ;(use-package org-roam
  ;  :ensure t))

;; lsp
;(require 'eglot)

;; enable nix integration (with treesitter)
(use-package nix-ts-mode
             :ensure t
	     :mode "\\.nix\\'")

;; evil mode
(setq evil-want-keybinding nil)
(use-package evil
             :ensure t
	     :config
	     (evil-mode 1)
	     (setq evil-emacs-state-modes nil)
	     (setq evil-insert-state-modes nil)
	     (setq evil-motion-state-modes nil)
	     (dolist (mode '(ag-mode
			     flycheck-error-list-mode
			     git-rebase-mode
			     tetris-mode))
	       (add-to-list 'evil-emacs-state-modes mode))
	     (use-package evil-collection
                          :ensure t
			  :config
			  (evil-collection-init)))
