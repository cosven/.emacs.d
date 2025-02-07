
;;; Code:

(use-package general :ensure t)

;; 定义 M-m 前缀，
(define-prefix-command 'leader-map)
(global-set-key (kbd "M-m") 'leader-map)

(global-set-key (kbd "M-m p") 'projectile-command-map)
;; M-p 这个组合键在特定的模式下有特定的功能，不适合作为全局快捷键。
(global-set-key (kbd "s-p") 'projectile-command-map)
(global-set-key (kbd "C-c p") 'projectile-command-map)
(global-set-key (kbd "M-m M-p") 'projectile-find-file)

;; M-m t 应该为 term 相关命令的前缀
(global-set-key (kbd "M-m t") 'vterm-toggle)
;; (global-set-key (kbd "M-m t n") 'multi-term-next)
;; (global-set-key (kbd "M-m t p") 'multi-term-prev)

;; M-m z 为折叠命令前缀。
(global-set-key (kbd "M-m z z") 'hs-toggle-hiding)

(global-set-key (kbd "M-m m") 'point-to-register)
(global-set-key (kbd "M-m '") 'jump-to-register)

;; (global-set-key (kbd "M-m z z") 'origami-toggle-node)
;; (global-set-key (kbd "M-m z Z") 'origami-recursively-toggle-node)
;; (global-set-key (kbd "M-m z a") 'origami-toggle-all-nodes)
;; (global-set-key (kbd "M-m z f") 'origami-show-only-node)
;; ;; 由于折叠在长文件中经常需要，所以尝试给它一个方便的快捷键。
;; (global-set-key (kbd "C-c TAB") 'origami-recursively-toggle-node)

;; Emacs 工作流：frame vs window
;; http://ergoemacs.org/emacs/emacs_effective_windows_management.html
(global-set-key (kbd "C-M-o") 'other-frame)

(global-set-key (kbd "M-o") 'other-window)

(defun grep-curword ()
  "Grep word under cursor in whole project."
  (interactive)
  ;; http://ergoemacs.org/emacs/elisp_thing-at-point_problems.html
  (counsel-rg (thing-at-point 'symbol)))
(global-set-key (kbd "M-m M-f") 'grep-curword)
;; M-m f 这种组合键比较容易按错，也很容易收到拼音输入法的影响。
(global-set-key (kbd "M-m f") 'format-all-buffer)

(define-prefix-command 'my-tabbar-map)
(global-set-key (kbd "C-t") 'my-tabbar-map)
(global-set-key (kbd "C-t C-n") 'tab-next)
(global-set-key (kbd "C-t C-p") 'tab-previous)
(global-set-key (kbd "C-t C-t") 'tab-bar-switch-to-next-tab)

;; xref 配置
(global-set-key (kbd "M-.") 'xref-find-definitions)
(global-set-key (kbd "M-?") 'xref-find-references)
(global-set-key (kbd "M-m M-d") 'lsp-find-definition-no-wait)
(global-set-key (kbd "M-m M-r") 'lsp-find-references-no-wait)

;; 配合 awesome-tab 使用
;; awesome-tab 上经常会显示很多 buffer，这时可以使用 f6 逐个 kill
(global-set-key [f5] 'kill-current-buffer)

;; personal use case
(global-set-key (kbd "C-c e")
  (lambda ()
    (interactive)  ;; interactive can turn a function to a command
    (find-file user-init-file)))

;; 单（右）手浏览代码 - 尝试失败
;;
;; 1. the left command key of Filco minila air is recognized
;;    as right command on macOS
;; 2. 经过最近实践，自己兵部并不会这样使用
;;
;;(when (eq system-type 'darwin) ;; mac specific settings
;;  (progn
;;    (setq ns-right-command-modifier 'control)))
;; (global-set-key (kbd "C-,") 'next-line)
;; (global-set-key (kbd "C-,") 'next-line)

(defun mwiki ()
  "Find my wiki index org file."
  (interactive)
  (find-file "~/cosven.github.io/index.org"))
(global-set-key (kbd "C-c t") 'mwiki)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(defvar my-buffer-map (make-sparse-keymap)
  "Keymap for operating buffers.")
(defvar my-flycheck-map (make-sparse-keymap)
  "Keymap for flycheck buffers.")
(defvar my-leader-map (make-sparse-keymap)
  "Keymap for \"leader key\" shortcuts.")
(general-define-key
 :keymaps 'my-buffer-map
 "b" 'switch-to-buffer
 "l" 'ibuffer)
(general-define-key
 :keymaps 'my-flycheck-map
 "n" 'flycheck-next-error
 "p" 'flycheck-previous-error
 "o" 'flycheck-list-errors)
(general-define-key
 :prefix-map 'my-leader-map
 "e" '(lambda ()
        (interactive)
        (find-file user-init-file))
 "o" 'other-window
 ;; prefix key for mode map
 "b" '(:keymap my-buffer-map)
 "p" '(:keymap projectile-command-map :package projectile))
(general-define-key
 :prefix-map 'swiper-isearch-map
 "C-SPC" #'swiper-isearch-thing-at-point)

(provide 'init-keybindings)
;;; init-keybindings ends here
