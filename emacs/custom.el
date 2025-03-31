(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(backup-by-copying t)
 '(backup-directory-alist '(("." . "~/.emacs.d/backups")))
 '(blink-cursor-blinks 3)
 '(column-number-mode t)
 '(company-idle-delay 0.5)
 '(company-insertion-on-trigger nil)
 '(compilation-max-output-line-length nil)
 '(custom-file "~/.emacs.d/custom.el")
 '(delete-old-versions t)
 '(fill-column 90)
 '(frame-resize-pixelwise t)
 '(indent-tabs-mode nil)
 '(initial-major-mode 'text-mode)
 '(kept-new-versions 3)
 '(kept-old-versions 2)
 '(lsp-enable-on-type-formatting nil)
 '(lsp-restart 'ignore)
 '(ring-bell-function 'ignore)
 '(rustic-cargo-check-arguments "--all-features")
 '(rustic-default-test-arguments "--tests --all-features")
 '(shell-file-name "/bin/bash")
 '(tuareg-match-clause-indent 0)
 '(vc-follow-symlinks t)
 '(version-control t))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#1D252C" :foreground "#A0B3C5" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight regular :height 120 :width normal :foundry "CTDB" :family "Fira Code"))))
 '(ivy-minibuffer-match-face-2 ((t (:weight normal))))
 '(ivy-minibuffer-match-face-3 ((t (:weight normal))))
 '(ivy-minibuffer-match-face-4 ((t (:weight normal))))
 '(lsp-headerline-breadcrumb-path-error-face ((t (:inherit lsp-headerline-breadcrumb-path-face))))
 '(lsp-headerline-breadcrumb-path-face ((t (:inherit mode-line-face))))
 '(lsp-headerline-breadcrumb-separator-face ((t (:inherit mode-line-face :weight thin))))
 '(merlin-compilation-error-face ((t (:underline (:color "#D95468" :style wave :position nil)))))
 '(tuareg-font-lock-error-face ((t (:underline (:color "firebrick" :style wave)))))
 '(tuareg-font-lock-governing-face ((t (:inherit font-lock-keyword-face))))
 '(tuareg-font-lock-operator-face ((t nil))))
