
;;; Code:

;; 定义 M-m 前缀，
(define-prefix-command 'm-m-map)
(global-set-key (kbd "M-m") 'm-m-map)

(global-set-key (kbd "M-m p") 'projectile-command-map)
(global-set-key (kbd "M-m g") 'magit-status)

;; M-m t 应该为 term 相关命令的前缀
(global-set-key (kbd "M-m t t") 'multi-term-dedicated-toggle)
(global-set-key (kbd "M-m t n") 'multi-term-next)
(global-set-key (kbd "M-m t p") 'multi-term-prev)

;; M-m z 为折叠命令前缀
(global-set-key (kbd "M-m z c") 'hs-hide-block)
(global-set-key (kbd "M-m z o") 'hs-show-block)
(global-set-key (kbd "M-m z R") 'hs-show-all)
(global-set-key (kbd "M-m z r") 'hs-show-level)
(global-set-key (kbd "M-m z M") 'hs-hide-all)
(global-set-key (kbd "M-m z m") 'hs-hide-level)

;; Emacs 工作流：frame vs window
;; http://ergoemacs.org/emacs/emacs_effective_windows_management.html
(global-set-key (kbd "C-M-o") 'other-frame)

(global-set-key (kbd "M-o") 'other-window)

(defun grep-curword ()
  "Grep word under cursor in whole project."
  (interactive)
  ;; http://ergoemacs.org/emacs/elisp_thing-at-point_problems.html
  (counsel-rg (thing-at-point 'symbol)))
(global-set-key (kbd "M-m f") 'grep-curword)

;; awesome-tab 配置
(global-set-key [f3] 'awesome-tab-backward)
(global-set-key [f4] 'awesome-tab-forward)

;; 配合 awesome-tab 使用
;; awesome-tab 上经常会显示很多 buffer，这时可以使用 f6 逐个 kill
(global-set-key [f6] 'kill-current-buffer)

;; personal use case
(global-set-key (kbd "C-c e")
  (lambda ()
    (interactive)  ;; interactive can turn a function to a command
    (find-file user-init-file)))

;; 单（右）手浏览代码
(when (eq system-type 'darwin) ;; mac specific settings
  (progn
    (setq ns-right-command-modifier 'control)))
(global-set-key (kbd "C-,") 'next-line)
(global-set-key (kbd "C-,") 'next-line)


(defun mwiki ()
  "Find my wiki index org file."
  (interactive)
  (find-file "~/cosven.github.io/index.org"))
(global-set-key (kbd "C-c t") 'mwiki)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(provide 'init-keybindings)
;;; init-keybindings ends here
