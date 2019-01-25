
;;; Code:

(defvar m-mode-line-minor-modes
  `(:propertize ("" minor-mode-alist)
                mouse-face mode-line-highlight
                local-map ,mode-line-minor-mode-keymap
                )
  "Customized mode line minor modes.")
;; XXX: 这一行非常重要，但目前不是很懂为什么？
(put 'm-mode-line-minor-modes 'risky-local-variable t)

;; (custom-set-variables '(pyvenv-mode-line-indicator ""))
;; (defvar m-pyvenv-mode-line
;;   (list (propertize "🐍"
;; 	 'help-echo pyvenv-virtual-env-name)
;; 	)
;;   "Pyvenv activated flag.")
;; (put 'm-pyvenv-mode-line 'risky-local-variable t)

(custom-set-variables
 '(mode-line-format
      ;;(list "%b, " "line %l ")
      '(
        "%e"
        mode-line-front-space
        mode-line-mule-info
        mode-line-client
        mode-line-modified
        mode-line-remote
        mode-line-frame-identification
        mode-line-buffer-identification
        "  "
        ;; mode-line-position
        ;; (vc-mode vc-mode)
        ;; mode-line-modes
        ;; mode-line-end-spaces
        mode-line-misc-info
        " "
        m-mode-line-minor-modes
        " "
        ;; (pyvenv-mode m-pyvenv-mode-line)
        )))

(provide 'init-mode-line)

;;; init-mode-line ends here
