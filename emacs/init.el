;; =======================================================================================
;; tali emacs
;; =======================================================================================

(use-package exec-path-from-shell)
(setq exec-path-from-shell-variables
      '("MANPATH" "PATH" "PKG_CONFIG_PATH"
        "CAML_LD_LIBRARY_PATH" "OCAML_TOPLEVEL_PATH" "OPAM_SWITCH_PREFIX"))
(exec-path-from-shell-initialize)

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(let ((opam-share (file-name-as-directory (car (process-lines "opam" "var" "share")))))
  (add-to-list 'load-path (concat opam-share "emacs/site-lisp")))

(require 'cl-lib)
(require 'tali-utils)
(load "~/.emacs.d/custom.el")

(use-package doom-themes)
;(tali-change-theme 'doom-city-lights)
(tali-change-theme 'doom-dark+)

(set-fontset-font t 'symbol (font-spec :family "Segoe UI Emoji") nil 'prepend)

(progn
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-display-line-numbers-mode 1)
  (setq inhibit-startup-screen t)

  (global-set-key (kbd "C-M-=") #'mark-sexp)
  (global-set-key (kbd "M-[") #'backward-paragraph)
  (global-set-key (kbd "M-]") #'forward-paragraph)
  (global-set-key (kbd "C-j") #'join-line)
  (global-set-key (kbd "M-s a") #'align-regexp)
  (global-set-key (kbd "M-s c") #'comment-or-uncomment-region)
  (global-set-key (kbd "M-s r") #'replace-regexp)
  (global-set-key (kbd "M-s s") #'sort-lines)
  (global-set-key (kbd "<f2> <f2>") #'compile)
  (global-set-key (kbd "<f2> <f3>") #'recompile)
  (global-set-key (kbd "M-<f2>") #'recompile)
                                        ;(global-set-key (kbd "M-s n") #'-next-error)
  (global-set-key (kbd "M-s M-s") #'shell)
  (global-set-key (kbd "C-x C-k") #'kill-buffer))

(use-package diminish :demand t)
(use-package eldoc :straight nil)
(diminish 'eldoc-mode)
(diminish 'smerge-mode)

(use-package autorevert
  :diminish auto-revert-mode)

(use-package compile
  :straight nil
  :hook (compilation-filter . ansi-color-compilation-filter))

(use-package company
  :demand
  :diminish
  :bind (("<C-tab>" . company-complete)
         :map company-active-map
         ("M-n" . company-select-next-or-abort)
         ("M-p" . company-select-previous-or-abort))
  :config
  (global-company-mode t))

(use-package flymake
  :defer t
  :config
  (setq flymake-wrap-around t
        flymake-start-on-save-buffer t
        flymake-no-changes-timeout nil))

(use-package lsp-mode
  :after flymake
  :config
  (setq lsp-diagnostics-provider :flymake
        lsp-enable-indentation t
        lsp-eldoc-hook nil
        lsp-enable-snippet nil
        lsp-enable-symbol-highlighting nil
        lsp-modeline-diagnostics-enable nil
        lsp-signature-auto-activate nil
        lsp-signature-render-documentation nil)
  (diminish 'lsp-lens-mode))

(use-package ivy
  :demand
  :diminish
  :bind (:map ivy-minibuffer-map
	      ("RET" . ivy-alt-done)
	      ("<C-return>" . ivy-immediate-done)
	      ("TAB" . ivy-partial))
  :config
  (setq completing-read-function      #'ivy-completing-read
        completion-in-region-function #'ivy-completion-in-region))

(use-package counsel
  :bind (("M-x" . counsel-M-x)
	 ("C-x b" . counsel-switch-buffer)
	 ("C-x C-b" . counsel-switch-buffer)
	 ("C-x C-f" . counsel-find-file)
         ("M-g M-r" . counsel-git-grep)))

(use-package swiper
  :bind (("C-s" . swiper-isearch)))

(use-package which-key :diminish which-key-mode)
(which-key-mode)

(use-package rainbow-delimiters)
(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)

(use-package rainbow-mode)

(use-package dr-racket-like-unicode
  :bind ("C-c C-\\" . dr-racket-like-unicode-char)
  :config (dolist (e '(("\\ldots" . "\u2026")
                       ("\\bbox" . "\u2610")
                       ("\\cbox" . "\u2611")))
           (add-to-list 'dr-racket-like-unicode-table e)))

(use-package magit
  :bind ("M-g M-s" . magit-status)
  :bind ("M-g M-b" . magit-blame)
  :bind (:map magit-revision-mode-map ("C-M-p" . diff-hunk-prev))
  :bind (:map magit-revision-mode-map ("C-M-n" . diff-hunk-next)))

(use-package agda2-mode
  :straight nil
  :load-path "~/Code/agda/src/data/emacs-mode"
  :mode ("\\.l?agda\\'" . agda2-mode))

(use-package js
  :straight nil
  :mode ("\\.js[mx]?\\'" . javascript-mode)
  :mode ("\\.ts\\'" . javascript-mode)
  :mode ("\\.json\\'" . tali-json-mode)
  :config (setq js-indent-level 4))

(defun tali-json-mode ()
  (interactive)
  (javascript-mode)
  (setq-local js-indent-level 2))

(use-package rustic
  :mode ("\\.rs\\'" . rustic-mode))

(use-package racket-mode
  :mode ("\\.rktl\\'" . racket-mode)
  :mode ("\\.rktd\\'" . racket-mode)
  :mode ("\\.rkt\\'" . racket-mode)
  :hook (racket-mode . rainbow-delimiters-mode))

(use-package glsl-mode
  :mode ("\\.glsl\\'" . glsl-mode)
  :mode ("\\.geom\\'" . glsl-mode)
  :mode ("\\.frag\\'" . glsl-mode)
  :mode ("\\.vert\\'" . glsl-mode))

(use-package tuareg
  ;; FIXME: make this conditional if opam/tuareg/merlin is not found on system
  :straight nil
  :mode ("\\.ml[ip]?\\'" . tuareg-mode)
  :mode ("\\.eliomi?\\'" . tuareg-mode))

(use-package tuareg-menhir
  :straight nil
  :mode ("\\.mly\\'" . tuareg-menhir-mode))

(use-package tuareg-opam
  :straight nil
  :mode ("[./]opam_?\\'" . tuareg-opam-mode))

(use-package ocp-indent
  :hook (tuareg-mode . ocp-setup-indent))

(use-package dune
  :straight nil
  :mode ("\\(?:\\`\\|/\\)dune\\(?:\\.inc\\|\\-project\\)?\\'" . dune-mode))

(use-package merlin
  :straight nil
  :hook (tuareg-mode . merlin-mode))

(use-package parinfer
  )

(use-package sass-mode
  :mode ("\\.sass\\'" . sass-mode))

(use-package julia-mode
  :mode ("\\.jl\\'" . julia-mode))
