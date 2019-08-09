(use-package evil
  :defer t
  :ensure t
  :init
  (add-hook 'evil-mode-hook
            (lambda ()
              (setq general-default-keymaps 'evil-normal-state-map)
              (setq my-leader-default "<SPC>")
              (general-define-key :prefix my-leader-default
                                  "b" 'switch-to-buffer
                                  "e" '(lambda ()
                                         (interactive)
                                         (find-file user-init-file))
                                  "r" '(lambda ()
                                         (interactive)
                                         (load-file user-init-file))
                                  )
              (general-define-key
               "<SPC> p" '(:keymap projectile-command-map :package projectile))
              (general-define-key
               "<SPC> g" '(:keymap magit-mode-map :package magit))
              (general-define-key
               "<SPC> f" '(:keymap fuo-mode-map :package fuo))
              (evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
              (evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
              (evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

              (define-key evil-normal-state-map "tt" 'neotree-toggle)
              (define-key evil-normal-state-map "tb" 'imenu-list-smart-toggle)
              (define-key evil-normal-state-map "f" 'counsel-git-grep)

              ;; try to use emacs key in insert mode
              (define-key evil-insert-state-map (kbd "\C-k") 'kill-line)
              (define-key evil-insert-state-map (kbd "\C-d") 'delete-forward-char)
              (define-key evil-insert-state-map (kbd "\C-a") 'move-beginning-of-line)
              (define-key evil-insert-state-map (kbd "\C-e") 'move-end-of-line)
              (define-key evil-insert-state-map (kbd "\C-n") 'next-line)
              (define-key evil-insert-state-map (kbd "\C-p") 'previous-line)
              (define-key evil-insert-state-map (kbd "\C-v") 'scroll-up-command)
              (define-key evil-insert-state-map (kbd "\C-y") 'yank)

              (setq-default evil-insert-state-cursor 'box)
              (modify-syntax-entry ?_ "w")))
  :config
  (evil-mode 0)
  )

(provide 'init-evil)
;;; init-evil ends here
