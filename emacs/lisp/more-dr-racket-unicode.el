(defun tali--sup-char (n)
  (cond
   ((= n 1) #xb9)
   ((< n 4) (+ #xb0 n))
   (t       (+ #x2070 n))))

(defun tali--sub-char (n)
  (+ #x2080 n))

(cl-loop
 for i from 0 upto 9 do
 (let ((seq (format "\\sup%d" i))
       (str (string (tali--sup-char i))))
   (add-to-list 'dr-racket-like-unicode-table (cons seq str)))
 (let ((seq (format "\\sub%d" i))
       (str (string (tali--sub-char i))))
   (add-to-list 'dr-racket-like-unicode-table (cons seq str))))

(defvar tali--extra-unicode-seqs
  '(("\\ldots" . "\u2026")
    ("\\bbox" . "\u2610")
    ("\\cbox" . "\u2611")))

(dolist (x tali--extra-unicode-seqs)
  (add-to-list 'dr-racket-like-unicode-table x))
