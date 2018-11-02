

;;; Code:

(defun grep-curword ()
  "Grep word under cursor in whole project."
  (interactive)
  (counsel-rg (thing-at-point 'word)))

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode 1)
  (global-set-key (kbd "C-c C-r") 'ivy-resume)

  (global-set-key (kbd "C-c v s") 'ivy-switch-view)
  (global-set-key (kbd "C-c v c") 'ivy-push-view)
  (global-set-key (kbd "C-c v d") 'ivy-pop-view)
  )

;; isearch replacement
(use-package swiper
  :ensure t
  :config
  (global-set-key "\C-s" 'swiper))

(use-package counsel
  :ensure t
  :config
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-m") 'counsel-M-x)
  (global-set-key (kbd "C-c g") 'counsel-git-grep)
  (global-set-key (kbd "C-c C-p") 'counsel-projectile)
  (global-set-key (kbd "C-c f") 'grep-curword)
  (global-set-key (kbd "C-x l") 'counsel-fzf)
  (global-set-key (kbd "M-i") 'counsel-imenu)
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  )


(provide 'init-ivy-family)
;;; init-ivy-family ends here
