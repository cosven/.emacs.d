;;; init-snails.el --- snails -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Requires

;;; Code:

;; 为了加快启动速度，defer snails
(use-package snails
  :defer t
  :load-path "third_party/snails/"
  :init
  (autoload 'snails "snails" nil t)
  :bind
  (:map global-map
        ("M-p" . (lambda ()
                   (interactive)
                   (snails '(snails-backend-projects
                             snails-backend-projectile
                             snails-backend-buffer
                             snails-backend-recentf))))))

(eval-after-load 'snails
  '(snails-create-sync-backend
    :name
    "PROJECTS"

    :candidate-filter
    (lambda (input)
      (let ((candidates)
            (projects (projectile-relevant-known-projects)))
        (message input)
        (when projects
          (dolist (project projects)
            (when (or
                   (string-equal input "")
                   (snails-match-input-p input project))
              (snails-add-candiate 'candidates (snails-wrap-file-icon project) project))))
        (snails-sort-candidates input candidates 1 1)
        candidates))

    :candiate-do
    (lambda (candidate)
      (projectile-switch-project-by-name candidate))))

(provide 'init-snails)

;;; init-snails.el ends here
