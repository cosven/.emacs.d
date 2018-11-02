

;;; Code:

(use-package pyvenv :ensure t)
(use-package anaconda-mode :ensure t)
(use-package company-anaconda :ensure t)
(use-package ein :ensure t)

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

(eval-after-load "company"
                 '(add-to-list 'company-backends 'company-anaconda))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook #'hs-minor-mode)
(add-hook 'python-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-p") 'counsel-projectile)
            (local-set-key [f5] 'run-py)))


(provide 'init-python)
;;; init-python ends here
