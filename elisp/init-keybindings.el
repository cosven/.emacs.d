
;;; Code:

;; 定义 M-m 前缀，
(define-prefix-command 'm-m-map)
(global-set-key (kbd "M-m") 'm-m-map)

(global-set-key (kbd "M-m p") 'projectile-command-map)
(global-set-key (kbd "M-m g") 'magit-dispatch-popup)

(provide 'init-keybindings)
;;; init-keybindings ends here
