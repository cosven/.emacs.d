;;; Package --- helm family init
;;; Commentary:
;;; Code:

(use-package helm
  :ensure t
  :bind (:map global-map ("M-x" . 'helm-M-x))
  :config
  (helm-mode 1)
  )

(provide 'init-helm)

;;; init-helm ends here
