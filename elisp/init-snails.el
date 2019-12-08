;;; init-snails.el --- snails -*- lexical-binding: nil; -*-
;;; Commentary:
;;; Requires

;;; Code:


(defun switch-project (project)
  (projectile-switch-project-by-name project))

;; 加载 snails 包需要 0.5 秒左右，defer snails
(use-package snails
  :defer t
  :load-path "third_party/snails/"
  :init
  (autoload 'snails "snails" nil t)
  :config

  (snails-create-sync-backend
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

   ;; FIXME: 不知道为什么，这里不能用 lambda
   :candiate-do switch-project)
  :hook ((snails-mode) .
         (lambda() (display-line-numbers-mode -1)))
  :bind
  (:map global-map
        ("M-p" . 'snails)))

(provide 'init-snails)

;;; init-snails.el ends here
