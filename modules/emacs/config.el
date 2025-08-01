(use-package evil
  :ensure t
  :init
  (setq evil-want-keybinding nil
        evil-vsplit-window-right t
        evil-split-window-below t
        evil-default-state 'normal
        evil-emacs-state-modes nil 
        evil-insert-state-modes nil
        evil-motion-state-modes nil)
  (evil-mode))
(use-package evil-collection
  :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package general
  :config
  (general-evil-setup)
  (general-create-definer n3mo/leader-keys
    :states '(normal insert visual emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC") 
  (n3mo/leader-keys "e" '(:ignore t :wk "buffer")
    "eb" '(switch-to-buffer :wk "Switch buffer")
    "ej" '(previous-buffer :wk "Previous buffer")
    "ek" '(next-buffer :wk "Next buffer")
    "er" '(revert-buffer :wk "Reload buffer")
    "eq" '(kill-buffer (current-buffer) :wk "Kill this buffer")
    "w" '(:ignore t :wk "window")
    "wh" '(windmove-left :wk "Move to left window")
    "wl" '(windmove-right :wk "Move to right window")
    "wj" '(windmove-down :wk "Move to lower window")
    "wk" '(windmove-up :wk "Move to upper window")
    "wH" '(windmove-swap-states-left
           :wk "Swap window to the left")
    "wL" '(windmove-swap-states-right
           :wk "Swap window to the right")
    "ws" '(evil-window-split
           :wk "Split window horizontally")
    "wv" '(evil-window-vsplit
           :wk "Split window vertically")
    "wq" '(evil-quit
           :wk "Close window")
    "t" '(:ignore t :wk "tab")
    "th" '(tab-bar-switch-to-prev-tab :wk "Previous tab")
    "tj" '(tab-bar-switch-to-prev-tab :wk "Previous tab")
    "tk" '(tab-bar-switch-to-next-tab :wk "Next tab")
    "tl" '(tab-bar-switch-to-next-tab :wk "Next tab")
    "tt" '(tab-bar-new-tab :wk "New tab")
    "tq" '(tab-bar-close-tab :wk "Close tab")))

(setenv "SSH_AUTH_SOCK" "/run/user/1000/gnupg/S.gpg-agent.ssh")

(set-face-attribute 'default nil
                    :font "Adwaita Mono Bold"
                    :height 110
                    :weight 'medium)
(set-face-attribute 'variable-pitch nil
                    :font "Cantarell"
                    :height 120
                    :weight 'medium)
(set-face-attribute 'fixed-pitch nil
                    :font "Adwaita Mono"
                    :height 110
                    :weight 'medium)
(set-face-attribute 'font-lock-comment-face nil :slant 'italic)
(set-face-attribute 'font-lock-keyword-face nil :slant 'italic)
(add-to-list 'default-frame-alist '(font . "Adwaita Mono-11"))

(setq frame-resize-pixelwise t)
(add-to-list 'default-frame-alist '(internal-border-width . 10))
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq visible-bell 1)

(use-package adwaita-dark-theme
  :ensure t
  :config
  (load-theme 'adwaita-dark :no-confirm))

(defface n3mo-tab-bar-tab
  `((t
     :inherit 'tab-bar-tab
     :foreground ,(face-attribute 'font-lock-keyword-face :foreground nil t)))
  "Face for active tab in tab-bar."
  :group 'n3mo-tab-bar)
(defface n3mo-tab-bar-tab-inactive
  `((t :inherit 'tab-bar-tab-inactive
       :foreground ,(face-attribute 'font-lock-comment-face :foreground nil t)))
  "Face for inactive tab in tab-bar."
  :group 'n3mo-tab-bar)
(defun n3mo-tab-bar-tab-name-format-default (tab i)
  (let* ((current-p (eq (car tab) 'current-tab))
         (tab-face (if current-p
                       'n3mo-tab-bar-tab
                     'n3mo-tab-bar-tab-inactive)))
    (propertize (concat "  " (alist-get 'name tab) "  ") 'face tab-face)))
(setq tab-bar-show 1
      tab-bar-new-button nil
      tab-bar-close-button-show nil
      tab-bar-new-tab-choice 'multi-vterm
      tab-bar-tab-name-format-function 'n3mo-tab-bar-tab-name-format-default)
(tab-bar-mode 1)

(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)
(global-visual-line-mode t)
(setq-default indent-tabs-mode nil)

(use-package telephone-line
  :ensure t
  :config
                                        ;(set-face-attribute 'telephone-line-evil-normal
                                        ;                    nil
                                        ;                    :foreground
                                        ;                    "#1e1e2e"
                                        ;                    :background
                                        ;                    "#cba6f7")
                                        ;(set-face-attribute 'telephone-line-evil-insert
                                        ;                    nil
                                        ;                    :foreground
                                        ;                    "#1e1e2e"
                                        ;                    :background
                                        ;                    "#a6e3a1")
                                        ;(set-face-attribute 'telephone-line-evil-visual
                                        ;                    nil
                                        ;                    :foreground
                                        ;                    "#1e1e2e"
                                        ;                    :background
                                        ;                    "#f38ba8")
  (setq telephone-line-primary-left-separator 'telephone-line-flat
        telephone-line-secondary-left-separator 'telephone-line-nil
        telephone-line-primary-right-separator 'telephone-line-flat
        telephone-line-secondary-right-separator 'telephone-line-nil)
  (setq telephone-line-lhs
        '((evil . (telephone-line-evil-tag-segment))
          (accent . (telephone-line-vc-segment
                     telephone-line-erc-modified-channels-segment
                     telephone-line-process-segment))
          (nil . (telephone-line-minor-mode-segment
                  telephone-line-buffer-segment))))
  (setq telephone-line-rhs
        '((nil . (telephone-line-misc-info-segment))
          (accent . (telephone-line-major-mode-segment))
          (evil . (telephone-line-airline-position-segment)))) 
  (telephone-line-mode 1))

(setq redisplay-dont-pause t
      scroll-margin 500
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

(use-package rainbow-delimiters
  :ensure t
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

(use-package org
  :ensure t
  :mode (("\\.org$" . org-mode))
  :config
  (setq org-edit-src-content-indentation 0
        org-src-tab-acts-natively t
        org-src-preserve-indentation t
        org-startup-folded t))

(setq org-todo-keywords
      '((sequence "TODO(t)" "PLANNING(p)" "IN-PROGRESS(i@/!)" "VERIFYING(v!)"
                  "BLOCKED(b@)"  "|" "DONE(d!)" "OBE(o@!)" "WONT-DO(w@/!)" ))
      org-todo-keyword-faces
      '(
        ("TODO" . (:foreground "GoldenRod" :weight bold))
        ("PLANNING" . (:foreground "DeepPink" :weight bold))
        ("IN-PROGRESS" . (:foreground "Cyan" :weight bold))
        ("VERIFYING" . (:foreground "DarkOrange" :weight bold))
        ("BLOCKED" . (:foreground "Red" :weight bold))
        ("DONE" . (:foreground "LimeGreen" :weight bold))
        ("OBE" . (:foreground "LimeGreen" :weight bold))
        ("WONT-DO" . (:foreground "LimeGreen" :weight bold))))

(setq org-tag-alist '(
                      ("school"       . ?s)
                      (:startgroup    . nil)
                      ("cs251"        . nil)
                      ("biol110"      . nil)
                      ("mus270"       . nil)
                      ("hist31205"    . nil)
                      (:endgroup      . nil)

                      ("tech"         . ?t)
                      (:startgroup    . nil)
                      ("l4p70p"       . nil)
                      ("d35k70p"      . nil)
                      ("m3d14"        . nil)
                      ("vp5"          . nil)
                      (:endgroup      . nil)

                      ("venue"        . ?v)

                      ("band"         . ?b)

                      ("personal"     . ?p)

                      ("professional" . ?P)

                      ("idea"         . ?i)

                      ("test"         . ?T))

      org-tag-faces '(
                      ("school"       . (:foreground "green"               :weight bold))
                      ("cs251"        . (:foreground "spring green"        :weight bold))
                      ("biol110"      . (:foreground "medium spring green" :weight bold))
                      ("mus270"       . (:foreground "dark green"          :weight bold))
                      ("hist31205"    . (:foreground "sea green"           :weight bold))
                      ("tech"         . (:foreground "royalblue1"          :weight bold))
                      ("venue"        . (:foreground "yellow1"             :weight bold))
                      ("band"         . (:foreground "forest green"        :weight bold))
                      ("personal"     . (:foreground "sienna"              :weight bold))
                      ("professional" . (:foreground "chocolate"           :weight bold))
                      ("idea"         . (:foreground "lawn green"          :weight bold))
                      ("test"         . (:foreground "red1"                :weight bold))))

(use-package toc-org
  :commands toc-org-enable
  :init (add-hook 'org-mode-hook 'toc-org-enable))

(add-hook 'org-mode-hook 'org-indent-mode)
(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(use-package org-roam
  :ensure t
  :config
  (setq org-roam-directory "~/Org"
        org-roam-capture-templates
        '(("d" "default" plain
           "%?"
           :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
           :unnarrowed t)
          ("t" "task" entry
           "** TODO [#B] ${title}\n\n:Created: %T\n\n%?"
           :target (file+olp "~/Org/tasks.org" ("tasks"))
           :unnarrowed t)
          ("n" "note" entry
           "** ${title}\n%?"
           :target (file+olp "~/Org/notes.org" ("notes"))
           :unnarrowed t)))
  ;        ("c" "code task"
  ;         entry (file+headline "~/Org/tasks.org" "Code-Related Tasks")
  ;         "* TODO [#B] %?\n:Created: %T\n%i\n%a\nProposed Solution: "
  ;         :empty-lines 0)))
  (org-roam-db-autosync-mode)
  :bind
  (("C-c n l" . org-roam-buffer-toggle)
   ("C-c n f" . org-roam-node-find)
   ("C-c n i" . org-roam-node-insert)))
(use-package org-roam-ui
  :ensure t
  :after org-roam
  :hook (after-init . org-roam-ui-mode)
  :config
  (setq org-roam-ui-sync-theme t
        org-roam-ui-follow t
        org-roam-ui-update-on-save t
        org-roam-ui-open-on-start t))

(use-package which-key
  :init
  (which-key-mode 1)
  :config
  (setq which-key-side-window-location 'bottom
        which-key-sort-order #'which-key-key-order-alpha
        which-key-sort-uppercase-first nil
        which-key-add-column-padding 1
        which-key-max-display-columns nil
        which-key-min-display-lines 6
        which-key-side-window-slot -10
        which-key-side-window-max-height 0.25
        which-key-idle-delay 0.8
        which-key-max-description-length 25
        which-key-allow-imprecise-window-fit t
        which-key-separator " → " ))

(use-package auctex
  :ensure t
  :hook
  (LaTex-mode . turn-on-prettify-symbols-mode)
  (LaTex-mode . turn-on-flyspell))
(setq TeX-view-program-selection '((output-pdf "PDF Tools"))
      TeX-source-correlate-start-server t)
(add-hook 'TeX-after-compilation-finished-functions #'TeX-revert-document-buffer)
(add-hook 'LaTeX-mode-hook #'rainbow-delimiters-mode)
(add-hook 'LaTeX-mode-hook 'display-line-numbers-mode)

(use-package pdf-tools
  :ensure t
  :init
  (pdf-tools-install))

(use-package vterm
  :ensure t
  :config
  (setq initial-buffer-choice 'multi-vterm
        vterm-term-environment-variable "eterm-color"
        vterm-kill-buffer-on-exit t))
;;(evil-set-initial-state 'vterm-mode 'emacs))

(use-package nix-ts-mode
  :ensure t
  :mode "\\.nix\\'")
(add-hook 'prog-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'eglot-format nil t)))
(with-eval-after-load 'eglot
  (dolist (mode '((nix-ts-mode . ("nixd"))))
    (add-to-list 'eglot-server-programs mode)))

(use-package highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character
        highlight-indent-guides-character ?|))
                                        ;(set-face-background 'highlight-indent-guides-odd-face "darkgray")
                                        ;(set-face-background 'highlight-indent-guides-even-face "dimgray"))
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(add-hook 'org-mode-hook 'highlight-indent-guides-mode)

(use-package pass :ensure t)
