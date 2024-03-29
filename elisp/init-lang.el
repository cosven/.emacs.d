;;; Package --- 一些没有详细配置的 major mode
;;; Commentary:

;;; Code:

(use-package restclient
  :defer t
  :ensure t)

(use-package yaml-mode
  :mode ("\\.yml\\'" "\\.yaml\\'")
  :ensure t)

(use-package markdown-mode
  :mode ("\\.md\\'" "\\.markdown\\'")
  :ensure t)

(use-package groovy-mode
  :mode ("\\.groovy\\'")
  :ensure t
  :config
  (add-hook 'groovy-mode-hook
            (lambda ()
              (electric-indent-local-mode -1)
              (setq tab-stop-list [2, 4, 6, 8, 10])
              (setq tab-width 2))))

(use-package thrift
  :mode ("\\.thrift\\'")
  :ensure t)

(use-package protobuf-mode
  :mode ("\\.proto\\'")
  :ensure t)

(use-package go-mode
  :mode ("\\.go\\'")
  :ensure t
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              (setq tab-width 4)
              (add-hook 'before-save-hook 'gofmt-before-save)
              )))

(use-package graphviz-dot-mode
  :mode ("\\.dot\\'")
  :ensure t)

(use-package nasm-mode
  :ensure t)

(use-package dockerfile-mode
  :mode "\\Dockerfile\\'"
  :ensure t)

(use-package rust-mode
  :ensure t
  :init
  (setq rust-format-on-save t))

(use-package clojure-mode
  :ensure t)

(use-package kotlin-mode
  :ensure t)

;; (use-package cider
;;   :ensure t)

(provide 'init-lang)
;;; init-lang ends here
