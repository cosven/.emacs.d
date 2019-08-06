
;;; Code:

(use-package projectile
  :ensure t
  :init
  (setq-default projectile-enable-caching t)
  :config
  (setq projectile-enable-caching t)
  (projectile-mode)
  )

(use-package counsel-projectile
  :ensure t
  :config
  (counsel-projectile-mode))


(provide 'init-projectile)
;;; init-projectile ends here
