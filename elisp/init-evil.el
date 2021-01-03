
;;; Code:
(use-package general :ensure t)

(defvar my-buffer-map (make-sparse-keymap)
  "Keymap for operating buffers.")
(defvar my-flycheck-map (make-sparse-keymap)
  "Keymap for flycheck buffers.")
(defvar my-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(general-define-key
 :keymaps 'my-buffer-map
 "b" 'switch-to-buffer
 "l" 'ibuffer)
(general-define-key
 :keymaps 'my-flycheck-map
 "n" 'flycheck-next-error
 "p" 'flycheck-previous-error
 "o" 'flycheck-list-errors)
(general-define-key
 :prefix-map 'my-leader-map
 "e" '(lambda ()
        (interactive)
        (find-file user-init-file))
 "o" 'other-window
 ;; prefix key for mode map
 "b" '(:keymap my-buffer-map)
 "p" '(:keymap projectile-command-map :package projectile))

;; https://github.com/noctuid/evil-guide
(use-package evil
  :ensure t
  :custom
  (evil-disable-insert-state-bindings t)
  :init
  :config
  ;; define my-leader-map and keybindings
  (general-evil-setup)
  (evil-set-leader 'normal "," t)
  (general-nmap
    "tt" 'treemacs
    "f" 'grep-curword)
  (general-nmap :prefix "SPC" :prefix-map 'my-leader-map)
  (general-nmap :prefix "c"   :prefix-map 'my-flycheck-map)

  (modify-syntax-entry ?_ "w")
  (evil-mode 1))

(provide 'init-evil)
;;; init-evil ends here
