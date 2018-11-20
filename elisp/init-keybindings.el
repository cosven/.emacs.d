
;;; Code:

;; 定义 M-m 前缀，
(define-prefix-command 'm-m-map)
(global-set-key (kbd "M-m") 'm-m-map)

(global-set-key (kbd "M-m p") 'projectile-command-map)
(global-set-key (kbd "M-m g") 'magit-dispatch-popup)

;; Emacs 工作流：frame vs window
;; http://ergoemacs.org/emacs/emacs_effective_windows_management.html
(global-set-key (kbd "C-M-o") 'other-frame)
(global-set-key [f3] 'other-frame)

(global-set-key (kbd "M-o") 'other-window)

(provide 'init-keybindings)
;;; init-keybindings ends here
