
;;; Code:

;; 定义 M-m 前缀，
(define-prefix-command 'm-m-map)
(global-set-key (kbd "M-m") 'm-m-map)

(global-set-key (kbd "M-m p") 'projectile-command-map)
(global-set-key (kbd "M-m g") 'magit-dispatch-popup)

;; Emacs 工作流：frame vs window
;; http://ergoemacs.org/emacs/emacs_effective_windows_management.html
(global-set-key (kbd "C-M-o") 'other-frame)

(global-set-key (kbd "M-o") 'other-window)


;; awesome-tab 配置
(global-set-key [f3] 'awesome-tab-backward)
(global-set-key [f4] 'awesome-tab-forward)

;; personal use case
(global-set-key (kbd "C-c e")
  (lambda ()
    (interactive)  ;; interactive can turn a function to a command
    (find-file user-init-file)))

(defun mwiki ()
  "Find my wiki index org file."
  (interactive)
  (find-file "~/Dropbox/public/index.org"))
(global-set-key (kbd "C-c t") 'mwiki)


(provide 'init-keybindings)
;;; init-keybindings ends here
