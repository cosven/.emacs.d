

;;; Code:


(defun init-ui-look ()
  "Init Emacs look."
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  ;; (global-linum-mode -1)
  (fringe-mode -1)
  (if (display-graphic-p)
      (progn
        (menu-bar-mode 1))
    ;; hide org string since we show it on tmux status line
    (setq-default org-mode-line-string nil))
  (menu-bar-mode -1)
  (cond ((eq system-type 'darwin)
         (set-fontset-font t nil (font-spec :family "Apple Color Emoji") nil 'append)
         (set-face-attribute 'default nil :font "Fira Code 14")
         ;; (set-face-attribute 'default nil :font "Monaco 14")
         ;; (set-frame-font "Monaco 14" nil t)
         )
        ((eq system-type 'gnu/linux)
         (set-face-attribute 'default nil :font "Ubuntu Mono 12"))
        )
  )

(init-ui-look)

(defun cb-after-make-frame (frame)
  "Callback of after a FRAME made."
  (init-ui-look))

(add-hook 'after-make-frame-functions 'cb-after-make-frame)

(provide 'init-ui)
;;; init-ui ends here
