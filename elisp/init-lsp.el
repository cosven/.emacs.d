
;;; Code:

(use-package lsp-mode
  :ensure t
  :init
  (setq lsp-eldoc-hook nil)
  :custom
  ;; 各种参数的配置强烈建议参考这个文档
  ;; https://emacs-lsp.github.io/lsp-mode/tutorials/how-to-turn-off/
  ;;
  ;; try to disable automatic-doc-help in echo erea
  ;; when it is enabled, lsp will send requests to lsp-server
  ;; when cursor is moved, which may block the editor
  ;; https://github.com/emacs-lsp/lsp-mode/issues/1223
  (lsp-signature-auto-activate nil)
  (lsp-signature-render-documentation nil)
  (lsp-headerline-breadcrumb-enable nil)
  ;; 举个例子，在使用 rust-analyzer 的时候，codeAction 可能会比较慢，
  ;; 从而导致移动光标有点卡顿（其实不确定是不是 codeAction 的锅）。
  (lsp-modeline-code-actions-enable nil)
  ;; 由于 flycheck 也会把诊断信息显示在 modeline 上，
  ;; 并且不是很方便把 flycheck 的诊断信息隐藏起来，所以只能把 lsp
  ;; 的诊断信息先隐藏了。
  (lsp-modeline-diagnostics-enable nil)
  (lsp-lens-enable nil)
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
  ;;

  ;; 遇到了几个问题，其中这个比较致命:
  ;;   1. https://github.com/emacs-lsp/lsp-mode/issues/3491
  ;;   2. 在 macOS 上（不确定在其它系统上是否有此问题）
  ;;      开启 lsp 的时候，它会让我用当前用户去登录远端机器。
  ;;      但其实我已经在 ~/.ssh/config 指定了用其它用户名来登录。
  ;;
  (with-eval-after-load "lsp-rust"
    (lsp-register-client
     (make-lsp-client
      :new-connection (lsp-tramp-connection "rust-analyzer")
      :remote? t
      :major-modes '(rust-mode rustic-mode)
      :initialization-options 'lsp-rust-analyzer--make-init-options
      :notification-handlers (ht<-alist lsp-rust-notification-handlers)
      :action-handlers (ht ("rust-analyzer.runSingle" #'lsp-rust--analyzer-run-single))
      :library-folders-fn (lambda (_workspace) lsp-rust-analyzer-library-directories)
      :after-open-fn (lambda ()
                       (when lsp-rust-analyzer-server-display-inlay-hints
                         (lsp-rust-analyzer-inlay-hints-mode)))
      :ignore-messages nil
      :server-id 'rust-analyzer-remote)))

  (dolist (m '(clojure-mode
               clojurec-mode
               clojurescript-mode
               clojurex-mode))
    (add-to-list 'lsp-language-id-configuration `(,m . "clojure"))))

(use-package lsp-ui
  :ensure t
  :init
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-doc-show-with-cursor nil)
  (setq lsp-ui-doc-show-with-mouse nil)

  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-show-diagnostics t)
  (setq lsp-ui-sideline-show-hover nil)
  (setq lsp-ui-sideline-show-code-actions nil)
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
(use-package dap-mode
  :ensure t
  :config
  (dap-mode 1)
  ;; (dap-ui-mode 1)
  ;; (require 'dap-lldb)
  ;; (setq dap-lldb-debug-program `("lldb-vscode"))
  (dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                           :gdbpath "rust-gdb"
                                   :target nil
                                   :cwd nil))
  )

;;
(provide 'init-lsp)

;;; init-lsp.el ends here
