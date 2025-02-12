
;;; Code:

;;; Set default value for variables

(setq-default inhibit-startup-screen t)
(setq-default cursor-type 'box)
(setq-default visible-bell t)
(setq-default truncate-lines t)
(setq-default eww-search-prefix "https://www.google.com/search?q=")
;; (setq-default python-shell-completion-native-enable nil)
(setq-default help-window-select t)
(setq vc-follow-symlinks t)
(setq-default org-agenda-files '("~/cosven.github.io"))
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
(setq-default column-number-mode t)
(setq-default fill-column 80)

;; Enable mouse support
(unless window-system
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

;; 加速滚动速度
(setq-default mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq-default mouse-wheel-progressive-speed t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'prog-mode-hook #'hs-minor-mode)
(global-auto-revert-mode)
(xterm-mouse-mode 1)
(mouse-wheel-mode 1)
(electric-pair-mode -1)
(show-paren-mode 1)
(which-function-mode -1)
(abbrev-mode -1)
(scroll-bar-mode -1)
(recentf-mode)

;; (when (eq system-type 'darwin) ;; mac specific settings
;;   (progn
;;     (setq mac-option-modifier 'super)
;;     (setq mac-command-modifier 'meta)
;;     )
;;   (global-set-key [kp-delete] 'delete-char) ;; sets fn-delete to be right-delete
;;   )


(provide 'init-defaults)
;;; init-defaults ends here
