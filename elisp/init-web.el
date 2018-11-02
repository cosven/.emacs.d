

;;; Code:

(defun init-web-settings ()
  "Init web settings."
  (interactive)
  ;; (electric-indent-local-mode -1)
  (setq tab-stop-list [2, 4, 6, 8, 10])
  (setq tab-width 2))

(use-package web-mode
  :ensure t
  :init
  (setq-default web-mode-enable-auto-indentation t)
  (setq-default web-mode-code-indent-offset 2)
  (setq-default web-mode-markup-indent-offset 2)
  (setq-default web-mode-css-indent-offset 2)
  (add-hook 'web-mode-hook 'init-web-settings)
  (add-hook 'js2-mode-hook 'init-web-settings)
  (setq-default js2-strict-missing-semi-warning nil)
  (setq-default js2-missing-semi-one-line-override nil)
  (setq-default js2-strict-trailing-comma-warning nil)
  (setq-default js-indent-level 2)

  :config
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\*fuo\\*\\'" . fuo-mode))
  )

(use-package js2-mode
  :ensure t
  :init
  ;; (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
  ;; (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . js2-jsx-mode))
  )

(use-package rjsx-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("\\.jsx?\\'" . rjsx-mode))
  (add-to-list 'auto-mode-alist '("components\\/.*\\.js\\'" . rjsx-mode))
  )

(use-package htmlize :ensure t)

(provide 'init-web)
;;; init-web ends here
