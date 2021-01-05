
;;; Code:

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
  (evil-mode 0))

(provide 'init-evil)
;;; init-evil ends here
