(defun rust-racer-hook ()
  (setq racer-cmd (concat (getenv "HOME") "/.cargo/bin/racer"))
  ; hmm ... not sure about this one
  (setq racer-rust-src-path (concat (getenv "HOME")
    "/.rustup/toolchains/nightly-x86_64-apple-darwin/lib/rustlib/src/rust/src/"))
  (setq company-tooltip-align-annotations t)
  (local-set-key (kbd "TAB") #'company-indent-or-complete-common))

(use-package flycheck-rust)

(use-package rust-mode
  :mode ("\\.rs" . rust-mode)
  :config
  (add-hook 'rust-mode-hook #'smartparens-mode)
  (add-hook 'rust-mode-hook #'company-mode)
  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup)
  (add-hook 'rust-mode-hook 'rust-racer-hook))

(provide 'lang-rust)
