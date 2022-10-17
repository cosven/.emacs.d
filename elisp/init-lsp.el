;;; init-lsp.el --- init LSP                            -*- lexical-binding: t; -*-

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
  ;;
  ;;   1. https://github.com/emacs-lsp/lsp-mode/issues/3491
  ;;      UPDATE(2022-08-29):
  ;;      下面这个方法是有用的，但不是默认可用，需要很多折腾。
  ;;      https://github.com/m-fleury/isabelle-emacs/commit/edf782c2b91692d5ede9cbce46be85ee0ed652d9
  ;;
  ;;   2. 在 macOS 上（不确定在其它系统上是否有此问题）
  ;;      开启 lsp 的时候，它会让我用当前用户去登录远端机器。
  ;;      但其实我已经在 ~/.ssh/config 指定了用其它用户名来登录。
  ;;
  ;;      UPDATE: 把 .emacs.d 文件夹移除后，发现问题可以解决，应该是某个缓存。
  ;;      不过我尝试过 grep -R，但并没有发现问题所在。
  ;;
  ;; (with-eval-after-load "lsp-rust"
  ;;   (lsp-register-client
  ;;    (make-lsp-client
  ;;     :new-connection (lsp-tramp-connection "rust-analyzer")
  ;;     :remote? t
  ;;     :major-modes '(rust-mode rustic-mode)
  ;;     :server-id 'rust-analyzer-remote)))

  (cl-defun lsp-find-locations-no-wait (method &optional extra &key display-action references?)
    (lsp-request-async
     method
     (append (lsp--text-document-position-params) extra)
     (lambda
       (loc)
       (if (seq-empty-p loc)
           (lsp--error "Not found for: %s" (or (thing-at-point 'symbol t) ""))
         (lsp-show-xrefs (lsp--locations-to-xref-items loc) display-action references?)))))

  (cl-defun lsp-find-definition-no-wait (&key display-action)
    (interactive)
    (lsp-find-locations-no-wait "textDocument/definition") nil :display-action display-action)

  (cl-defun lsp-find-references-no-wait (&optional exclude-declaration &key display-action)
    (interactive "P")
    (lsp-find-locations-no-wait
     "textDocument/references"
     (list
      :context `(:includeDeclaration
                 ,(lsp-json-bool (not (or exclude-declaration lsp-references-exclude-definition)))))
     :display-action display-action
     :references? t))

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

;; 这个东西和 lsp 连用的时候，有时候会导致光标移动卡顿，不太能接受。
;; 不建议使用，建议找一个更可靠的折叠方案。
;;
;; (use-package lsp-origami
;;   :ensure t
;;   :config
;;   (add-hook 'lsp-after-open-hook #'lsp-origami-try-enable))

;; 目前非常难用，并且实践发现很少使用。
;; (use-package dap-mode
;;   :ensure t
;;   :config
;;   (dap-mode 1)
;;   ;; (dap-ui-mode 1)
;;   ;; (require 'dap-lldb)
;;   ;; (setq dap-lldb-debug-program `("lldb-vscode"))
;;   (dap-register-debug-template "Rust::GDB Run Configuration"
;;                              (list :type "gdb"
;;                                    :request "launch"
;;                                    :name "GDB::Run"
;;                            :gdbpath "rust-gdb"
;;                                    :target nil
;;                                    :cwd nil))
;;   )

;;
(provide 'init-lsp)

;;; init-lsp.el ends here
