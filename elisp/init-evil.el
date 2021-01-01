
;;; Code:
(use-package general :ensure t)

;; https://github.com/noctuid/evil-guide
(use-package evil
  :ensure t
  :custom
  (evil-disable-insert-state-bindings t)
  ;; (evil-insert-state-cursor 'box)
  :init
  :config
  ;; define my-leader-map and keybindings
  (defvar my-leader-map (make-sparse-keymap)
    "Keymap for \"leader key\" shortcuts.")
  (general-evil-setup)
  (evil-set-leader 'normal "," t)
  (general-nmap
    "tt" 'treemacs
    "f" 'grep-curword)
  (general-nmap
   :prefix "SPC"
   :prefix-map 'my-leader-map
   "b" 'switch-to-buffer
   "e" '(lambda ()
          (interactive)
          (find-file user-init-file))
   "o" 'other-window
   "p" '(:keymap projectile-command-map :package projectile))

  (modify-syntax-entry ?_ "w")
  (evil-mode 1))

(provide 'init-evil)
;;; init-evil ends here
