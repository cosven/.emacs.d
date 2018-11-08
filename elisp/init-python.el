
(require 'subr-x)

;;; Code:

;; 虚拟环境管理
(use-package pyvenv :ensure t)

;; 自动补全
(use-package anaconda-mode :ensure t)
(use-package company-anaconda :ensure t)

;; emacs ipython notebook
(use-package ein :ensure t)

; (use-package flycheck-pycheckers :ensure t)

(defun org-babel-execute:python2 (body params)
  "Execute BODY by python2 with PARAMS."
  (org-babel-eval "python2" body))

(defun org-babel-execute:python3 (body params)
  "Execute BODY by python2 with PARAMS."
  (org-babel-eval "python3" body))

(defun run-py ()
  "Run py file."
  (interactive)
  (shell-command
   (format "%s %s" python-shell-interpreter
           (buffer-file-name (current-buffer)))))

(defun py-send-line()
  "将当前行发送到 python shell.

发送前会对删除前后空格，主要使用场景是将 doctest 代码发送到 shell 进行测试。"
  (interactive)
  (python-shell-send-string (string-trim (thing-at-point 'line)))
  )

(eval-after-load "company"
                 '(add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook #'hs-minor-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key [f5] 'run-py)
            (local-set-key (kbd "C-x C-e") 'py-send-line)))
;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

(provide 'init-python)
;;; init-python ends here
