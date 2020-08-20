
;;; Code:

;;; Set default value for variables

(setq-default inhibit-startup-screen t)
(setq-default cursor-type 'box)
(setq-default truncate-lines t)
(setq-default eww-search-prefix "https://www.google.com/search?q=")
;; (setq-default python-shell-completion-native-enable nil)
(setq-default help-window-select t)
(setq vc-follow-symlinks t)
(setq-default org-agenda-files '("~/Dropbox/life"
                                 "~/Dropbox/public"))
(setq-default imenu-list-focus-after-activation t)
(setq-default imenu-list-size 35)
(setq-default org-log-done 'time)
(setq-default indent-tabs-mode nil)
(setq-default c-default-style "linux"
              c-basic-offset 4)
(setq confirm-kill-emacs 'y-or-n-p)
(setq-default org-babel-python-command "python3")
(setq-default org-babel-sh-command "bash")
(setq-default make-backup-files nil)
(setq-default org-babel-python2-command "python")
(setq-default tramp-inline-compress-start-size 1048576)  ;; 1KB
(setq-default tramp-copy-size-limit 268435456)  ;; 256KB
(setq-default column-number-mode t)

;; Enable mouse support
(unless window-system
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))


(add-hook 'before-save-hook 'delete-trailing-whitespace)
(global-auto-revert-mode)
(xterm-mouse-mode 1)
(electric-pair-mode -1)
(show-paren-mode 1)
(which-function-mode -1)
(recentf-mode)

(when (eq system-type 'darwin) ;; mac specific settings
  (progn
    (setq mac-option-modifier 'meta)
    (setq mac-command-modifier 'meta)
    )
  (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
  )


(provide 'init-defaults)
;;; init-defaults ends here
