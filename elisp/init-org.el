

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

(let ((babel-languages
              '((python . t)
                (C . t)
                (plantuml . t))))
  (if (version< emacs-version "26.0")
      (map-put babel-languages 'sh t)
    (map-put babel-languages 'shell t))
  (org-babel-do-load-languages 'org-babel-load-languages babel-languages))

;; org
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(provide 'init-org)
;;; init-org ends here
