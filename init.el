;;; package --- Summary
;;; Commentary:
;; Emacs config created by cosven
;;; Code:

(setq gc-cons-threshold 128000000)  ;; 128Mb
(add-hook 'after-init-hook #'(lambda ()
                               ;; restore after startup
                               (setq gc-cons-threshold 800000)))
(setq package-enable-at-startup nil)
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "third-elisp" user-emacs-directory))
;; https://github.com/emacs-lsp/lsp-mode/issues/4054
(add-to-list 'image-types 'svg)

(defun require-or-install-pkg (pkg)
  "PKG is a package name."
  (unless (package-installed-p pkg)
    (package-refresh-contents)  ;; 重要
    (package-install pkg))
  (require pkg))

(require 'package)
;; 加载已经安装的包，这样子，之后 requrie 一个包就可以让该包生效
(package-initialize)
(require-or-install-pkg 'use-package)
(setq use-package-verbose t
      use-package-minimum-reported-time 0.05)

(require 'init-defaults)
(require 'init-ui)
(require 'init-common-packages)
(require 'init-code)
(require 'init-vc)
;; (require 'init-sidebar)
(require 'init-treemacs)
(require 'init-themes)
(require 'init-lang)
(require 'init-ivy-family)

;;(use-package smex :ensure t :bind (:map global-map ("M-x" . 'smex)))
;;(require 'init-helm)

(require 'init-python)

;; 很少进行前端相关开发，因此注释掉。
;; (require 'init-web)

(require 'init-fuo)
(require 'init-org)
;; (require 'init-awesome-tab)
(require 'init-diminish)
(require 'init-keybindings)
(require 'init-lsp)

;; (require 'init-snails)
;; (require 'init-mode-line)

;; 很少用到 evil，所以注释掉。
(require 'init-evil)

;; (server-start)
(setq custom-file "~/.emacs-custom.el")
;;(when (file-exists-p custom-file)
;;  (load custom-file))

(custom-set-variables
 '(plantuml-jar-path "~/Documents/plantuml.jar")
 '(org-plantuml-jar-path "~/Documents/plantuml.jar")
 )
(provide '.emacs)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; init.el ends here
