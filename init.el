;;; package --- Summary
;;; Commentary:
;; Emacs config created by cosven
;;; Code:

(setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
                         ("melpa" . "http://elpa.emacs-china.org/melpa/")))
(add-to-list 'load-path (expand-file-name "elisp" user-emacs-directory))
(add-to-list 'load-path (expand-file-name "third-elisp" user-emacs-directory))

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
(setq use-package-verbose t)

(require 'init-defaults)
(require 'init-ui)
(require 'init-common-packages)
(require 'init-ivy-family)
(require 'init-projectile)
(require 'init-web)
(require 'init-evil)
(require 'init-fuo)
(require 'init-org)
(require 'init-awesome-tab)
(require 'init-diminish)

;; person use
(global-set-key (kbd "C-c e")
  (lambda ()
    (interactive)  ;; interactive can turn a function to a command
    (find-file user-init-file)))
(global-set-key (kbd "C-c t")
  (lambda ()
    (interactive)  ;; interactive can turn a function to a command
    (find-file "~/Dropbox/life/life_tracking.org")))

(setq custom-file "~/.emacs-custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

(custom-set-variables
 '(plantuml-jar-path "~/Documents/plantuml.jar")
 '(org-plantuml-jar-path "~/Documents/plantuml.jar")
 )

(provide '.emacs)

;; Local Variables:
;; byte-compile-warnings: (not free-vars)
;; End:

;;; init.el ends here
