
;;; Code:


(use-package magit
  :defer t
  :init
  (setq ediff-split-window-function 'split-window-vertically)
  :ensure t
  )

;; diff-hl 似乎比 git-gutter 更胜一筹？
;; (use-package git-gutter
;;   :ensure t
;;   )

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-diff-hl-mode))

(use-package blamer
  :ensure t)

(provide 'init-vc)
;;; init-vc ends here
