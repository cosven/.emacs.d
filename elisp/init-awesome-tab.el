

;;; Code:

(use-package awesome-tab
  :config
  ;; (awesome-tab-mode)
  )

(custom-set-faces
 '(awesome-tab-selected
   ((t
     (:inherit awesome-tab-default
               :foreground "green3"
               :overline "green3"
               :underline "green3"
               :width semi-expanded))))
 '(awesome-tab-unselected
   ((t
     (:inherit awesome-tab-default
               :foreground "grey"
               :overline "grey"
               :underline "grey"
               :width semi-expanded))))
)

(provide 'init-awesome-tab)
;;; init-awesome-tab ends here
