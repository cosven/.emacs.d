

;;; Code:

(use-package org
  :mode ("\\.org\\'" . org-mode)
  :ensure t
  :bind
  (:map global-map
        ("\C-cl" . 'org-store-link)
        ("\C-ca" . 'org-agenda)
        ("\C-cc" . 'org-capture)
        ("\C-cb" . 'org-iswitchb))
  :config
  (let ((babel-languages
         '((python . t)
           (C . t)
           (plantuml . t))))
    (if (version< emacs-version "26.0")
        (map-put babel-languages 'sh t)
      (map-put babel-languages 'shell t))
    (org-babel-do-load-languages 'org-babel-load-languages babel-languages)))


(provide 'init-org)
;;; init-org ends here
