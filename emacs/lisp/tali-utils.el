(defun tali-no-op ()
  (interactive))

(defun tali-change-theme (th)
  (interactive "STheme: ")
  (dolist (en custom-enabled-themes)
    (disable-theme en))
  (load-theme th t))

(defun tali-get-font-foundry (family)
  (let ((foundry nil) (family-seen nil))
    (dolist (ln (process-lines "fc-list" family "-f" "=%{family}\\n:%{foundry}\\n"))
      (message ln)
      (if family-seen (setq foundry (substring ln 1)))
      (setq family-seen (equal ln (format "=%s" family))))
    (unless foundry (error "couldn't find font %s" family))
    foundry))

(defun tali-change-font (fam wgt siz)
  (custom-set-faces
   (let ((face (list :family fam
                     :foundry (tali-get-font-foundry fam)
                     :height siz
                     :weight wgt)))
     `(default ((t ,face))))))

(provide 'tali-utils)
