
;;; Code:

(use-package treemacs
  :ensure t
  :init
  (setq treemacs-width 28)
  (setq treemacs-recenter-after-file-follow t)
  (setq treemacs-recenter-after-tag-follow t)
  (with-eval-after-load 'treemacs
    (defun treemacs-ignore-customize (filename abs-path)
      (or (string-equal filename "foo")
          (string-suffix-p ".o" abs-path)
          (string-match-p "_flymake." abs-path)
          )
      )
    (add-to-list 'treemacs-ignored-file-predicates #'treemacs-ignore-customize))
  (with-eval-after-load 'eyebrowse
    (global-set-key (kbd "M-0") #'treemacs-select-window))
  :config
  (treemacs-follow-mode nil)
  (treemacs-tag-follow-mode nil)
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ([f2] . treemacs)))

(use-package treemacs-projectile
  :after treemacs projectile
  :ensure t)

(use-package treemacs-magit
  :after treemacs magit
  :ensure t)

(use-package treemacs-icons-dired
  :after treemacs dired
  :ensure t
  :config (treemacs-icons-dired-mode))

(provide 'init-treemacs)
;;; init-treemacs ends here
