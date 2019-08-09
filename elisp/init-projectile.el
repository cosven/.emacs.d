
;;; Code:

(use-package projectile
  :ensure t
  :init
  (setq projectile-enable-caching t)
  :config
  (add-hook 'after-init-hook 'projectile-mode)
  )


(provide 'init-projectile)
;;; init-projectile ends here
