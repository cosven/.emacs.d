
;;; Code:

(use-package lsp-mode
  :init
  (setq lsp-enable-snippet nil)
  (setq lsp-prefer-flymake nil)
  :config
  (use-package lsp-ui
    :ensure t
    :config
    (add-hook 'lsp-mode-hook 'lsp-ui-mode)
    (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
    (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
    )
  (use-package lsp-treemacs
    :ensure t
    )
  (add-hook 'c++-mode-hook #'lsp)
  )

(use-package ccls
  :ensure t
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  )

(provide 'init-lsp)

;;; init-lsp ends here
