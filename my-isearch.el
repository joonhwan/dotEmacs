;;
;; isearch improvement..
;;

;; i do isearch by sexp more than by word
(defun my-isearch-yank-sexp ()
  "*Pull next expression from buffer into search string."
  (interactive)
  (isearch-yank-internal
   (lambda ()
     (forward-sexp 1)
     (point)
     )))
(define-key isearch-mode-map "\C-w" 'my-isearch-yank-sexp)
(define-key isearch-mode-map "\C-x" 'isearch-yank-word-or-char)

;; lgrep while isearch among the files having same file extension as
;; visited buffer file name(press C-S-o while isearch!)
(define-key isearch-mode-map [(control shift o)]
  (lambda () (interactive)
    (let ((shk-search-string isearch-string))
      (grep-compute-defaults)
      (lgrep (if isearch-regexp shk-search-string (regexp-quote shk-search-string))
	     (format "*.%s" (file-name-extension (buffer-file-name)))
	     default-directory)
      (isearch-abort))))

(if nil
    (progn
      (defvar mast-isearch-orig-syntax-table nil)

      (defun mast-isearch-prepare-syntax-table (new-syntax-table)
	;; It's tricky to search through the whole syntax table for symbol
	;; chars, so let's just try some likely ones.
	(dolist (char '(?_ ?- ?+ ?$ ?! ?. ?, ?: ?\; ?* ?% ?# ?@ ?& ?< ?>))
	  (if (eq (char-syntax char) ?_)
	      (modify-syntax-entry char "w" new-syntax-table))))

      (defun mast-isearch-restore-syntax-table ()
	(when mast-isearch-orig-syntax-table
	  (set-syntax-table mast-isearch-orig-syntax-table)
	  (setq mast-isearch-orig-syntax-table nil)
	  (remove-hook 'isearch-mode-end-hook 'mast-isearch-restore-syntax-table)))

      (defun mast-isearch-forward-regexp (&optional not-regexp no-recursive-edit)
	"Do incremental search forward for a regular expression while all
symbol constituents are treated as word characters.  This means that
\\=\\< and \\=\\> match the limits of identifiers in programming languages.
With prefix argument, do a regular string search instead.  Behaves
otherwise like ordinary incremental search; see \\[isearch-forward] for more
info."
	(interactive "P\np")
	(setq mast-isearch-orig-syntax-table (syntax-table))
	(set-syntax-table (copy-syntax-table mast-isearch-orig-syntax-table))
	(mast-isearch-prepare-syntax-table (syntax-table))
	(add-hook 'isearch-mode-end-hook 'mast-isearch-restore-syntax-table)
	(isearch-forward-regexp not-regexp no-recursive-edit))

      (defun mast-isearch-backward-regexp (&optional not-regexp no-recursive-edit)
	"Do incremental search backward for a regular expression while all
symbol constituents are treated as word characters.  This means that
\\=\\< and \\=\\> match the limits of identifiers in programming languages.
With prefix argument, do a regular string search instead.  Behaves
otherwise like ordinary incremental search; see \\[isearch-forward] for more
info."
	(interactive "P\np")
	(setq mast-isearch-orig-syntax-table (syntax-table))
	(set-syntax-table (copy-syntax-table mast-isearch-orig-syntax-table))
	(mast-isearch-prepare-syntax-table (syntax-table))
	(add-hook 'isearch-mode-end-hook 'mast-isearch-restore-syntax-table)
	(isearch-backward-regexp not-regexp no-recursive-edit))

      (define-key esc-map "\C-s" 'mast-isearch-forward-regexp)
      (define-key esc-map "\C-r" 'mast-isearch-backward-regexp)
      ))


(provide 'my-isearch)
