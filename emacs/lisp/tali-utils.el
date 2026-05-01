(defun tali-no-op ()
  (interactive))

;; themes
;; ===

(defvar tali--light-theme nil)
(defvar tali--dark-theme nil)
(defvar tali--current-activating-theme-p nil)

(defun tali-activate-theme (flavor)
  (unless tali--current-activating-theme-p
    (message "Activating theme flavor: %s" flavor)
    (let ((curr (cond ((eq flavor 'dark)  tali--dark-theme)
                      ((eq flavor 'light) tali--light-theme))))
      (when curr
        (dolist (prev custom-enabled-themes) (disable-theme prev))
        (let ((tali--current-activating-theme-p t))
          (load-theme curr t nil))))))

(defcustom tali-theme-flavor 'dark
  "Theme flavor (light or dark)."
  :type '(choice (const :tag "Dark theme" dark)
                 (const :tag "Light theme" light))
  :set (lambda (symbol flavor)
         (tali-activate-theme flavor)
         (custom-set-default symbol flavor)))

(defun tali-set-themes (dark-theme light-theme)
  (setq tali--dark-theme dark-theme)
  (setq tali--light-theme light-theme)
  (tali-activate-theme tali-theme-flavor))

;; fonts
;; ===

(defun tali--get-font-foundry (family)
  (let ((foundry nil) (family-seen nil))
    (dolist (ln (process-lines "fc-list" family "-f" "=%{family}\\n:%{foundry}\\n"))
      (if family-seen (setq foundry (substring ln 1)))
      (setq family-seen (equal ln (format "=%s" family))))
    (unless foundry (error "couldn't find font %s" family))
    foundry))

(defun tali-change-font (fam wgt siz)
  (custom-set-faces
   (let ((face (list :family fam
                     :foundry (tali--get-font-foundry fam)
                     :height siz
                     :weight wgt)))
     `(default ((t ,face))))))

(provide 'tali-utils)
