
(require 'subr-x)

;;; Code:

;; 虚拟环境管理
(use-package pyvenv
  :ensure t
  :hook python-mode)

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

(setq python-shell-interpreter "python3")
(setq python-shell-interpreter-args "-m IPython --simple-prompt -i")

;; 自动补全
(use-package anaconda-mode
  :hook python-mode
  :ensure t)
(use-package company-anaconda
  :hook python-mode
  :ensure t)

(eval-after-load "company"
  '(add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-eldoc-mode)
;; (add-hook 'python-mode-hook 'pyvenv-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key [f5] 'run-py)
            (local-set-key (kbd "C-x C-e") 'py-send-line)
            ;; this may override eldoc shortcut
            (local-set-key (kbd "C-c C-f") 'pydoc)
            ))

;; (with-eval-after-load 'flycheck
;;   (add-hook 'flycheck-mode-hook #'flycheck-pycheckers-setup))

;; 默认情况下，flycheck 将 python-pylint checker 的执行命令设计为
;; python -m pylint ...，所以，如果当前 python 环境没有 pylint 模块，
;; flycheck 默认就不会 enable python-pylint 这个 checker。flake8 同理。
;;
;; 而现在我自己机器一般都会安装 python2 和 python3 两个环境，而我可能
;; 只在一个环境中安装 pylint。所以我这里将 pylint-executable 设置为
;; pylint，这样子，我们有更大的机率自动启用 pylint 和 flake8。
;;
;; 另外，当我们使用 pyvenv 激活某个虚拟环境时，如果当前环境存在 pylint 模块，
;; flycheck 会自动切换成 python -m pylint 模式执行。
(setq flycheck-python-pylint-executable "pylint")
(setq flycheck-python-flake8-executable "flake8")

(provide 'init-python)
;;; init-python ends here
