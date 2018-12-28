;;; Package --- 一些不需要大量配置的包
;;; Commentary:

;;; Code:

(use-package general :ensure t)

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
     (exec-path-from-shell-initialize)))


(use-package fzf
  :ensure t)

(use-package neotree
  :ensure t
  :init
  (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
  :config
  (global-set-key [f2] 'neotree-toggle))

(use-package magit
  :ensure t
  )

(use-package flycheck
  :ensure t
  :config
  (add-hook 'after-init-hook #'global-flycheck-mode))

(use-package company
  :ensure t
  :config
  (add-hook 'after-init-hook 'global-company-mode))


(use-package ace-window
  :ensure t
  :init
  (setq aw-scope 'frame)
  )

(use-package goto-chg
  :ensure t)

(use-package eyebrowse
  :ensure t
  :init
  (setq eyebrowse-mode-line-style nil)
  :config
  (eyebrowse-mode nil)
  (eyebrowse-setup-opinionated-keys))

(use-package writeroom-mode
  :ensure t)

(use-package goto-chg
  :ensure t
  :config
  (global-set-key (kbd "\C-c ;") 'goto-last-change)
  )

;; ui related

(use-package smart-mode-line
  :ensure t)

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

(use-package diff-hl :ensure t
  :config
  (global-diff-hl-mode 1))

(use-package pyim
  :ensure t
  :demand t
  :config
  ;; 激活 basedict 拼音词库，五笔用户请继续阅读 README
  (use-package pyim-basedict
    :ensure nil
    :config (pyim-basedict-enable))

  (setq default-input-method "pyim")

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
  (setq pyim-page-tooltip 'popup)

  ;; 选词框显示5个候选词
  (setq pyim-page-length 5)

  :bind
  (("M-j" . pyim-convert-code-at-point) ;与 pyim-probe-dynamic-english 配合
   ("C-;" . pyim-delete-word-from-personal-buffer)))

(use-package go-mode
  :ensure t)

;;(use-package highlight-indent-guides
;;  :ensure t
;;  :config
;;  (setq highlight-indent-guides-method 'character)
;;  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
;;  )

;; (use-package cnfonts
;;   :ensure t
;;   :config
;;   (cnfonts-enable))
;;

(provide 'init-common-packages)
;;; init-common-packages ends here
