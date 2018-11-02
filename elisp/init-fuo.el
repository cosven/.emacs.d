


;;; Code:
(use-package fuo
  :ensure t)

;; (when (file-exists-p "~/coding/emacs-fuo/fuo.el")
;;  (load "~/coding/emacs-fuo/fuo.el"))

;; ---
;; fuo
;; ---

;; (add-hook 'evil-mode-hook
;;           (lambda ()
;;             (evil-define-key 'normal fuo-mode-map
;;               (kbd "<return>") 'fuo--play-current-line-song)))

;; (setq frame-title-format
;;       '("%b" "\t" (:eval (concat "["
;;          (string-join
;;           (--map
;;            (car it)
;;            (--map (cons (eyebrowse-format-slot it) (car it))
;;                   (eyebrowse--get 'window-configs)))
;;           ", ")
;;          "]"))
;;         )
;;       )


(provide 'init-fuo)
;;; init-fuo ends here
