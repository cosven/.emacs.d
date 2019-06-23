

;;; Code:


(defun init-ui-look ()
  "Init Emacs look."
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  ;; (global-linum-mode -1)
  (fringe-mode -1)

  (if (display-graphic-p)
      (progn
        (menu-bar-mode -1)
        (cond ((eq system-type 'darwin)
               (menu-bar-mode -1)
               (set-fontset-font t nil (font-spec :family "Apple Color Emoji") nil 'append)
               ;; (set-face-attribute 'default nil :font "Fira Code 14"))
               (set-face-attribute 'default nil :font "Monaco 14"))
               ;; (set-frame-font "Monaco 14" nil t)
              ;; ((eq system-type 'gnu/linux)
              ;;  (set-face-attribute 'default nil :font "Ubuntu Mono 13"))
              ))
    (menu-bar-mode -1)))

(init-ui-look)

(defun cb-after-make-frame (frame)
  "Callback of after a FRAME made."
  (init-ui-look))

;; 这个配置可能会让 terminal 模式下的 emacs 渲染不正常！
;; (add-hook 'after-make-frame-functions 'cb-after-make-frame)

;;(when (eq system-type 'darwin)
;;  (add-to-list 'default-frame-alist '(ns-transparent-titlebar . t)))
;;  (add-to-list 'default-frame-alist '(ns-appearance . dark)))

(provide 'init-ui)
;;; init-ui ends here
