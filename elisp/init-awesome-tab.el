

;;; Code:

;; (use-package awesome-tab
;;   :config
;;   ;; (awesome-tab-mode)
;;   )
;;

(use-package awesome-tab
  :load-path "third_party/awesome-tab"
  :config
  (setq awesome-tab-style "zigzag")
  ;; 如果 height 比字体还小，似乎 awesome tab 会忽略这个高度设置
  (setq awesome-tab-height 11)
  ;; (setq awesome-tab-label-fixed-length 0)
  (awesome-tab-mode t)
  (global-set-key (kbd "s-1") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-2") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-3") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-4") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-5") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-6") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-7") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-8") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-9") 'awesome-tab-select-visible-tab)
  (global-set-key (kbd "s-0") 'awesome-tab-select-visible-tab)

  (global-set-key (kbd "s-h") 'awesome-tab-backward-group)
  (global-set-key (kbd "s-l") 'awesome-tab-forward-group))



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
