;;; Package --- 一些没有详细配置的 major mode
;;; Commentary:

;;; Code:

(use-package plantuml-mode
  :ensure t)

(use-package restclient
  :ensure t)

(use-package yaml-mode
  :ensure t)

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

(use-package thrift
  :ensure t)

(use-package go-mode
  :ensure t
  :config
  (add-hook 'go-mode-hook
            (lambda ()
              (setq tab-width 4)
              (add-hook 'before-save-hook 'gofmt-before-save)
              )))

(use-package graphviz-dot-mode
  :ensure t)

(use-package nasm-mode
  :ensure t)

(provide 'init-lang)
;;; init-lang ends here
