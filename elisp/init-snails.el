
;;; Code:

(use-package snails
  :load-path "third_party/snails/"
  :bind
  (:map global-map
        ("M-p" . (lambda ()
                   (interactive)
                   (snails '(snails-backend-projectile
                             snails-backend-buffer
                             snails-backend-imenu
                             snails-backend-recentf
                             snails-backend-awesome-tab-group)))))
  )

(provide 'init-snails)

;;; init-snails.el ends here
