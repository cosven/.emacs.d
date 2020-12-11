;;; Package --- 一些不需要大量配置的包
;;; Commentary:

;;; Code:

(use-package tramp
  :ensure t
  :config
  ;; https://www.gnu.org/software/emacs/manual/html_node/tramp/Remote-programs.html
  ;; golang lsp-mode goto-definition 会调用 go 命令，而默认的 tramp-remote-path
  ;; 不会读取 .profile 里面的配置，而 tramp-own-remote-path 是会的
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(use-package general
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package imenu-list
  :ensure t
  :general
  (general-define-key :prefix "C-c i"
                      "l" 'imenu-list-smart-toggle
                      "r" 'imenu-list-refresh))

(use-package bm
  :ensure t
  :init
  (setq bm-cycle-all-buffers t)
  :general
  (general-define-key :prefix "C-c m"
                      "n" 'bm-next
                      "p" 'bm-previous
                      "m" 'bm-toggle))

(use-package edit-server
  :ensure t)

(use-package exec-path-from-shell
   :ensure t
   :init
   (when (memq window-system '(mac ns x))
     (exec-path-from-shell-initialize)
     ))

(use-package fzf
  :ensure t)

(use-package magit
  :defer t
  :init
  (setq ediff-split-window-function 'split-window-vertically)
  :ensure t
  )

(use-package flycheck
  :ensure t
  :init
  (setq flycheck-clang-language-standard "c++11")
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode)
  )

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode)
  )


(use-package ace-window
  :ensure t
  :init
  (setq aw-scope 'frame)
  :bind
  (:map global-map
        ("M-o" . 'ace-window))
  )

(use-package goto-chg
  :ensure t)

(use-package eyebrowse
  :ensure t
  :init
  (setq eyebrowse-mode-line-style t)
  (defun rename-eyebrowse-default-window ()
    (interactive)
    (eyebrowse-rename-window-config eyebrowse-default-workspace-slot "adhoc")
    )
  (add-hook 'eyebrowse-mode-hook 'rename-eyebrowse-default-window)
  :config
  (eyebrowse-mode t)
  (eyebrowse-setup-opinionated-keys)
  :custom-face
  (eyebrowse-mode-line-active
   ((t
     (:inherit mode-line-emphasis
               :foreground "systemBlueColor"
               )
     )))
  :custom
  (eyebrowse-mode-line-left-delimiter "[")
  (eyebrowse-mode-line-right-delimiter "]"))

(use-package writeroom-mode
  :ensure t)

(use-package goto-chg
  :ensure t
  :config
  (global-set-key (kbd "\C-c ;") 'goto-last-change)
  )

;; ui related

(use-package page-break-lines
  :ensure t)

(use-package all-the-icons
  :ensure t)

;; 没有在维护了
;; (use-package git-gutter
;;   :ensure t
;;   :config
;;   (global-git-gutter-mode))
;;

(use-package diff-hl
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-diff-hl-mode))

(use-package pyim
  :ensure t
;;  :demand t
  :config
  ;; 激活 basedict 拼音词库，五笔用户请继续阅读 README
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))

  (setq default-input-method "pyim")
  (setq pyim-dicts
        '((:name "pyim-bigdict" :file "~/Dropbox/public/emacs/pyim-bigdict.pyim")
          (:name "cosven-dict" :file "~/Dropbox/public/emacs/cosven.pyim")))

  ;; 我使用全拼
  (setq pyim-default-scheme 'quanpin)

  ;; 设置 pyim 探针设置，这是 pyim 高级功能设置，可以实现 *无痛* 中英文切换 :-)
  ;; 我自己使用的中英文动态切换规则是：
  ;; 1. 光标只有在注释里面时，才可以输入中文。
  ;; 2. 光标前是汉字字符时，才能输入中文。
  ;; 3. 使用 M-j 快捷键，强制将光标前的拼音字符串转换为中文。
  (setq-default pyim-english-input-switch-functions
                '(pyim-probe-dynamic-english
                  pyim-probe-isearch-mode
                  pyim-probe-program-mode
                  pyim-probe-org-structure-template))

  (setq-default pyim-punctuation-half-width-functions
                '(pyim-probe-punctuation-line-beginning
                  pyim-probe-punctuation-after-punctuation))

  ;; 开启拼音搜索功能
  (pyim-isearch-mode 1)

  ;; 使用 pupup-el 来绘制选词框, 如果用 emacs26, 建议设置
  ;; 为 'posframe, 速度很快并且菜单不会变形，不过需要用户
  ;; 手动安装 posframe 包。
  (setq pyim-page-tooltip 'posframe)

  ;; 选词框显示5个候选词
  (setq pyim-page-length 5)

  :bind
  (("M-j" . pyim-convert-string-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(use-package multi-term
  :defer t
  :load-path "third_party/multi-term/"
  :config
  ;; /bin/bash --login 命令可以启动 login shell
  ;; login shell vs non-login shell: https://unix.stackexchange.com/a/46856
  (setq multi-term-program "/bin/bash")
  (setq multi-term-program-switches nil)

  ;; multi-term 默认配置中将 ESC 键给 unbind 了，
  ;; 这会影响 vim 使用。
  (custom-set-variables
   '(term-unbind-key-list
     '("C-z" "C-x" "C-c" "C-h" "M-x" "M-m" "M-C-o"
       "M-o")))

  ;; 设置一些常见的 shell 快捷键，在默认的 term 模式中，
  ;; M-d, M-DEL 等组合键都不生效。
  (custom-set-variables
   '(term-bind-key-alist
     '(
       ("C-c C-c" . term-interrupt-subjob)
       ("C-c C-j" . term-line-mode)
       ;; 这样可以访问系统粘贴板的内容
       ;; C-y 在 multi-term 源码中也有特意绑定 term-paste
       ("C-y" . term-paste)
       ("<kp-delete>" . term-send-del)
       ("M-f" . term-send-forward-word)
       ("M-b" . term-send-backward-word)
       ("M-DEL" . term-send-backward-kill-word)
       ("M-d" . term-send-forward-kill-word)
       ("M-p" . term-send-up)
       ("M-n" . term-send-down)
       )))
  )

(use-package ibuffer-vc
  :ensure t
  :config
  (add-hook 'ibuffer-mode-hook
            (lambda ()
              (ibuffer-vc-set-filter-groups-by-vc-root)
              (unless (eq ibuffer-sorting-mode 'alphabetic)
                (ibuffer-do-sort-by-alphabetic))))
  )

(when (eq system-type 'darwin)
  (use-package dash-at-point
    :ensure t)
  )

(use-package projectile
  :ensure t
  :init
  (setq projectile-enable-caching t)
  (setq projectile-completion-system 'ivy)
  :config
  (add-hook 'after-init-hook 'projectile-mode)
  )

;; 当我们想启用这个 mode 的时候，人肉运行 cnfonts-enable
(use-package cnfonts)

(use-package markdown-toc
  :ensure t)


(provide 'init-common-packages)
;;; init-common-packages.el ends here
