

;;; Code:

(use-package ivy
  :ensure t
  :init
  (setq ivy-use-virtual-buffers t)
  (setq enable-recursive-minibuffers t)
  :config
  (ivy-mode 1)
  :bind
  (:map global-map
        ("C-c C-r" . 'ivy-resume)
        ("C-c v s" . 'ivy-switch-view)
        ("C-c v c" . 'ivy-push-view)
        ("C-c v d" . 'ivy-pop-view))
  )

;; isearch replacement
(use-package swiper
  :ensure t
  :config
  :bind
  (:map global-map
        ("C-s" . 'swiper-isearch)))

(use-package counsel
  :ensure t
  :bind
  (:map global-map
        ("M-x" . 'counsel-M-x)
        ("C-x l" . 'counsel-fzf)
        ("M-i" . 'counsel-imenu))
  :config
  (define-key minibuffer-local-map (kbd "C-r") 'counsel-minibuffer-history)
  )

(use-package avy
  :ensure t
  :config
  (global-set-key (kbd "C-:") 'avy-goto-char)
  (global-set-key (kbd "C-'") 'avy-goto-char-2)
)


(provide 'init-ivy-family)
;;; init-ivy-family ends here
