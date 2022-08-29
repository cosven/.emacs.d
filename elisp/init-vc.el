
;;; Code:

(use-package git-gutter
  :ensure t
  )

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-diff-hl-mode))

(use-package blamer
  :ensure t)

(provide 'init-vc)
;;; init-vc ends here
