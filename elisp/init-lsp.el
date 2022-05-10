
;;; Code:

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-eldoc-hook nil)
  :custom
  ;; try to disable automatic-doc-help in echo erea
  ;; when it is enabled, lsp will send requests to lsp-server
  ;; when cursor is moved, which may block the editor
  ;; https://github.com/emacs-lsp/lsp-mode/issues/1223
  (lsp-signature-auto-activate nil)
  (lsp-signature-render-documentation nil)
  (lsp-headerline-breadcrumb-enable nil)
  (lsp-enable-snippet nil)
  (lsp-prefer-flymake nil)

  ;; Python
  (lsp-pyls-configuration-sources ["flake8"])

  :hook  ((c++-mode . lsp-deferred)
          (go-mode . lsp-deferred)
          (rust-mode . lsp-deferred)
          (clojure-mode . lsp-deferred)
          (clojurec-mode . lsp-deferred)
          (clojurescript-mode . lsp-deferred))

  :commands (lsp lsp-deferred)
  :config
  ;; lsp mode with tramp does not works well
  ;; (lsp-register-client
  ;;  (make-lsp-client :new-connection (lsp-tramp-connection
  ;;                                    (lambda () (cons "~/go/bin/gopls" lsp-gopls-server-args)))
  ;;                   :major-modes '(go-mode)
  ;;                   :remote? t
  ;;                   :server-id 'gopls-remote))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable nil)
  :commands lsp-ui-mode
  :config
  :bind (:map lsp-ui-mode-map
              ("M-'" . (lambda ()
                         (interactive)
                         ;; toggle lsp ui doc frame
                         (if (or (and (overlayp lsp-ui-doc--inline-ov)
                                      (overlay-buffer lsp-ui-doc--inline-ov))
                                 (and (lsp-ui-doc--get-frame)
                                      (frame-visible-p (lsp-ui-doc--get-frame))))
                             (lsp-ui-doc-hide)
                           (lsp-ui-doc-show)))))
  )

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

;; ccls 包加载比较慢，defer
(use-package ccls
  :defer t
  :ensure t
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  )

(use-package lsp-treemacs
  :defer t
  :ensure t
  )

(use-package lsp-origami
  :ensure t
  :config
  (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable))

;; 目前非常难用
;; (use-package dap-mode
;;   :ensure t
;;   :config
;;   ;; (dap-mode 1)
;;   ;; (dap-ui-mode 1)
;;   ;; (require 'dap-lldb)
;;   (setq dap-lldb-debug-program `("lldb-vscode"))
;;   )
;;
(provide 'init-lsp)

;;; init-lsp.el ends here
