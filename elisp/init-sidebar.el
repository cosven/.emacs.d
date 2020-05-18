
;;; Code:

(use-package neotree
  :ensure t
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :bind
  (:map global-map
        ([f2] . neotree-toggle)
        ))

(provide 'init-sidebar)

;;; init-sidebar ends here
