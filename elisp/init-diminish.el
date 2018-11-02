

;;; Code:

(diminish 'projectile-mode)
(diminish 'git-gutter-mode)
(diminish 'company-mode)
(add-hook 'company-mode-hook
          (lambda ()
            (diminish 'company-mode)
            ))
(diminish 'undo-tree-mode)
(diminish 'which-key-mode)
(diminish 'ivy-mode)


(provide 'init-diminish)
;;; init-diminish ends here
