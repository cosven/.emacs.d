
;;; Code:

(use-package general :ensure t)
(use-package smart-mode-line
  :ensure t)

(use-package page-break-lines
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package imenu-list
  :ensure t
  :general
  (general-define-key :prefix "C-c i"
                      "l" 'imenu-list-smart-toggle
                      "r" 'imenu-list-refresh))

(use-package bm
  :ensure t
  :init
  (setq bm-cycle-all-buffers t)
  :general
  (general-define-key :prefix "C-c m"
                      "n" 'bm-next
                      "p" 'bm-previous
                      "m" 'bm-toggle))

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package edit-server
  :ensure t)

(use-package git-gutter
  :ensure t
  :config
  (global-git-gutter-mode))

(use-package exec-path-from-shell
   :ensure t
   :init
   (when (memq window-system '(mac ns x))
     (exec-path-from-shell-initialize)))

(use-package fzf
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (global-set-key [f2] 'neotree-toggle))

(use-package magit
  :ensure t
  )

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))
(use-package ace-window
  :ensure t
  :init
  (setq aw-scope 'frame)
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package thrift
  :ensure t)
(use-package goto-chg
  :ensure t)
(use-package diminish
  :ensure t)

;; lang
(use-package markdown-mode
  :ensure t)
(use-package groovy-mode
  :ensure t
  :config
  (add-hook 'groovy-mode-hook
            (lambda ()
              (electric-indent-local-mode -1)
              (setq tab-stop-list [2, 4, 6, 8, 10])
              (setq tab-width 2))))
(use-package plantuml-mode
  :ensure t)
(use-package restclient
  :ensure t)
(use-package yaml-mode
  :ensure t)

;; theme
(use-package solarized-theme
  :ensure t)
(use-package zenburn-theme
  :ensure t)
(use-package color-theme-sanityinc-tomorrow
  :ensure t)

(use-package eyebrowse
  :ensure t
  :init
  (setq-default eyebrowse-mode-line-style t)
  :config
  (eyebrowse-mode t)
  (eyebrowse-setup-opinionated-keys))

(use-package writeroom-mode
  :ensure t)

(use-package goto-chg
  :ensure t
  :config
  (global-set-key (kbd "\C-c ;") 'goto-last-change)
  )

(provide 'init-common-packages)
;;; init-common-packages ends here
