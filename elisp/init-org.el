

;;; Code:

(use-package org
  :ensure t)

(use-package calfw
  :ensure t)

(use-package calfw-org
  :ensure t)

(use-package alert
  :ensure t
  )

(use-package org-alert
  :ensure t
  :init
  (setq alert-default-style 'notifier)
  )

(org-babel-do-load-languages 'org-babel-load-languages
                             '((python . t)
                               (shell . t)  ;; emacs >= 26
                               (C . t)
                               (plantuml . t)))

;; org
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'init-org)
;;; init-org ends here
