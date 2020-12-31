
;;; Code:
(use-package general :ensure t)

;; https://github.com/noctuid/evil-guide
(use-package evil
  :defer t
  :ensure t
  :custom
  (evil-disable-insert-state-bindings t)
  (evil-insert-state-cursor 'box)
  :init
  :config

  ;; define my-leader-map and keybindings
  (defvar my-leader-map (make-sparse-keymap)
    "Keymap for \"leader key\" shortcuts.")
  (general-nmap
   :prefix "SPC"
   :prefix-map 'my-leader-map
   "b" 'switch-to-buffer
   "e" '(lambda ()
          (interactive)
          (find-file user-init-file))
   "o" 'other-window)

  (modify-syntax-entry ?_ "w")
  (evil-mode 1))

(provide 'init-evil)
;;; init-evil ends here
