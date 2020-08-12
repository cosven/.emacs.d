
;;; Code:

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-enable-snippet nil)
  (setq lsp-prefer-flymake nil)
  :hook  ((c++-mode . lsp-deferred)
          (go-mode . lsp-deferred)
          (rust-mode . lsp-deferred)
          (clojure-mode . lsp-deferred)
          (clojurec-mode . lsp-deferred)
          (clojurescript-mode . lsp-deferred))
  :commands (lsp lsp-deferred)
  :config
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection "~/.cargo/bin/rls")
                    :major-modes '(rust-mode)
                    :remote? t
                    :server-id 'rls-remote))
  (lsp-register-client
   (make-lsp-client :new-connection (lsp-tramp-connection
                                     (lambda () (cons "~/go/bin/gopls" lsp-gopls-server-args)))
                    :major-modes '(go-mode)
                    :remote? t
                    :server-id 'gopls-remote))
  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure")))
  )

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-sideline-enable nil)
  :commands lsp-ui-mode
  :config
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)

  :bind (:map lsp-ui-mode-map
              ("M-'" . (lambda ()
                         (interactive)
                         ;; toggle lsp ui doc frame
                         (if (lsp-ui-doc--visible-p)
                             (lsp-ui-doc-hide)
                           (lsp-ui-doc-show)
                           ))))
  )

(use-package company-lsp
  :defer t
  :ensure t
  :config
  (push 'company-lsp company-backends))


;; ccls 包加载比较慢，defer
(use-package ccls
  :defer t
  :ensure t
  :hook ((c-mode c++-mode objc-mode) .
         (lambda () (require 'ccls) (lsp)))
  )

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
