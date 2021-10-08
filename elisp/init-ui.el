

;;; Code:

(defun mrecenter-current-frame ()
  "Frame 屏幕居中."
  (interactive)
  (let* ((workarea (frame-monitor-workarea (selected-frame)))
         (min-x (pop workarea))
         (min-y (pop workarea))
         (max-x (pop workarea))
         (max-y (pop workarea))
         (pos-x (/ (- max-x min-x (frame-outer-width)) 2))
         (pos-y (/ (- max-y min-y (frame-outer-height)) 2)))
    (message "%d %d" pos-x pos-y)
    (set-frame-position (selected-frame) pos-x pos-y)))

(defun init-ui-look ()
  "Init Emacs look."
  (tool-bar-mode -1)
  (when (featurep 'fringe)
    (set-fringe-mode '(nil . 0)))
  ;; (fringe-mode -1)
  (when (featurep 'scroll-bar)
    (scroll-bar-mode -1))
  (menu-bar-mode -1)
  ;; (global-linum-mode -1)

  (cond ((eq system-type 'darwin)
         (menu-bar-mode -1)
         ;; (set-fontset-font t nil (font-spec :family "Apple Color Emoji") nil 'append)
         ;; (set-face-attribute 'default nil :font "Fira Code 14"))
         ;; (set-face-attribute 'default nil :font "Source Code Pro for Powerline 13")

         ;; 使用 emacsclient + daemon 模式启动后，字体不会生效，
         (setq default-frame-alist '((font . "Monaco-12")))
         (set-fontset-font
          t 'symbol (font-spec :family "Apple Color Emoji") nil 'prepend)))
        ;; ((eq system-type 'gnu/linux)
        ;;  (set-face-attribute 'default nil :font "Ubuntu Mono 13"))
        )

(init-ui-look)
(mrecenter-current-frame)

;; 这个配置可能会让 terminal 模式下的 emacs 渲染不正常！
;; (add-hook 'after-make-frame-functions 'cb-after-make-frame)

;;(when (eq system-type 'darwin)
;;  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
;;  (add-to-list 'default-frame-alist '(ns-appearance . dark)))


(provide 'init-ui)
;;; init-ui ends here
