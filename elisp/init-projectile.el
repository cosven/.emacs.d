
;;; Code:

(use-package projectile
  :ensure t
  :init
  (setq-default projectile-enable-caching t)
  :config
  (setq projectile-enable-caching t)
  (projectile-mode)
  :bind
  (:map global-map
        ("M-p" . projectile-find-file))
  )

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))


(provide 'init-projectile)
;;; init-projectile ends here
