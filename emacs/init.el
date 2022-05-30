;; =======================================================================================
;; tali emacs
;; =======================================================================================

(add-to-list 'load-path (concat user-emacs-directory "lisp"))
(require 'tali-utils)
(load "~/.emacs.d/custom.el")

(use-package doom-themes)

(tali-change-font "Source Code Pro" 'normal 131)
(tali-change-theme 'doom-moonlight)

(use-package nlinum)

(progn
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)
  (global-nlinum-mode t)

  (global-set-key (kbd "C-M-=") #'mark-sexp)
  (global-set-key (kbd "M-[") #'backward-paragraph)
  (global-set-key (kbd "M-]") #'forward-paragraph)
  (global-set-key (kbd "C-j") #'join-line)
  (global-set-key (kbd "M-s a") #'align-regexp)
  (global-set-key (kbd "M-s c") #'comment-or-uncomment-region)
  (global-set-key (kbd "M-s r") #'replace-regexp)
  (global-set-key (kbd "M-s s") #'sort-lines)
  (global-set-key (kbd "<f2> <f2>") #'compile)
  (global-set-key (kbd "M-<f2>") #'recompile)
                                        ;(global-set-key (kbd "M-s n") #'-next-error)
  (global-set-key (kbd "M-s M-s") #'shell)
  (global-set-key (kbd "C-x C-k") #'kill-buffer))

(use-package diminish :demand t)
(use-package eldoc :straight nil)
(diminish 'eldoc-mode)

(use-package company
  :demand
  :diminish
  :bind (("<C-tab>" . company-complete)
         :map company-active-map
         ("M-n" . company-select-next-or-abort)
         ("M-p" . company-select-previous-or-abort))
  :config
  (setq company-idle-delay nil)
  (global-company-mode t))

(use-package flymake
  :defer t
  :config
  (setq flymake-wrap-around t
        flymake-start-on-save-buffer t
        flymake-no-changes-timeout nil))

(use-package lsp-mode
  :after flymake
  :custom-face (lsp-headerline-breadcrumb-separator-face
                ((t (:inherit mode-line-face :weight thin))))
  :custom-face (lsp-headerline-breadcrumb-path-face
                ((t (:inherit mode-line-face))))
  :custom-face (lsp-headerline-breadcrumb-path-error-face
                ((t (:inherit lsp-headerline-breadcrumb-path-face))))
  :custom-face (lsp-headerline-breadcrumb-symbols-face
                ((t (:inherit mode-line-face :weight bold))))
  :config
  (setq lsp-diagnostics-provider :flymake
        lsp-enable-indentation t
        lsp-eldoc-hook nil
        lsp-enable-snippet nil
        lsp-enable-symbol-highlighting nil
        lsp-modeline-diagnostics-enable nil
        lsp-signature-auto-activate nil
        lsp-signature-render-documentation nil))

(use-package ivy
  :demand
  :diminish
  :custom-face (ivy-minibuffer-match-face-2 ((t (:weight normal))))
  :custom-face (ivy-minibuffer-match-face-3 ((t (:weight normal))))
  :custom-face (ivy-minibuffer-match-face-4 ((t (:weight normal))))
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

(use-package dr-racket-like-unicode
  :bind ("C-c C-\\" . dr-racket-like-unicode-char))

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
  :mode ("\\.rkt\\'" . racket-mode))
