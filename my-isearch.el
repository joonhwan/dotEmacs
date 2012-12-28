;;
;; isearch improvement..
;;

;; hint from https://github.com/purcell/emacs.d/blob/master/init-isearch.el

;; Activate occur easily inside isearch
(define-key isearch-mode-map (kbd "C-o") 'isearch-occur)

;; ;; Search back/forth for the symbol at point
;; ;; See http://www.emacswiki.org/emacs/SearchAtPoint
;; (defun my-isearch-yank-symbol ()
;;   "*Put symbol at current point into search string."
;;   (interactive)
;;   (let ((sym (symbol-at-point)))
;;     (if sym
;;         (progn
;;           (setq isearch-regexp t
;;                 isearch-string (concat "\\_<" (regexp-quote (symbol-name sym)) "\\_>")
;;                 isearch-message (mapconcat 'isearch-text-char-description isearch-string "")
;;                 isearch-yank-flag t))
;;       (ding)))
;;   (isearch-search-and-update))
;; (define-key isearch-mode-map "\C-w" 'my-isearch-yank-symbol)
;; (define-key isearch-mode-map "\C-x" 'isearch-yank-word-or-char) ;; old C-w command is now C-x

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


;; http://www.emacswiki.org/emacs/ZapToISearch
(defun my-zap-to-isearch (rbeg rend)
  "Kill the region between the mark and the closest portion of
the isearch match string. The behaviour is meant to be analogous
to zap-to-char; let's call it zap-to-isearch. The deleted region
does not include the isearch word. This is meant to be bound only
in isearch mode. The point of this function is that oftentimes
you want to delete some portion of text, one end of which happens
to be an active isearch word. The observation to make is that if
you use isearch a lot to move the cursor around (as you should,
it is much more efficient than using the arrows), it happens a
lot that you could just delete the active region between the mark
and the point, not include the isearch word."
  (interactive "r")
  (when (not mark-active)
    (error "Mark is not active"))
  (message "isearch-other-end : %S" isearch-other-end)
  (let* ((isearch-bounds (list isearch-other-end (point)))
         (ismin (apply 'min isearch-bounds))
         (ismax (apply 'max isearch-bounds))
         )
    (if (< (mark) ismin)
        (kill-region (mark) ismin)
      (if (> (mark) ismax)
          (kill-region ismax (mark))
        (error "Internal error in isearch kill function.")))
    (isearch-exit)
    ))
(define-key isearch-mode-map [(meta z)] 'my-zap-to-isearch)

;; http://www.emacswiki.org/emacs/ZapToISearch
(defun my-isearch-exit-other-end (rbeg rend)
  "Exit isearch, but at the other end of the search string.
This is useful when followed by an immediate kill."
  (interactive "r")
  (isearch-exit)
  (goto-char isearch-other-end))
(define-key isearch-mode-map [(control return)] 'my-isearch-exit-other-end)

;; lgrep while isearch among the files having same file extension as
;; visited buffer file name(press C-S-o while isearch!)
(defun my-lgrep-while-isearch ()
  (interactive)
  (let ((shk-search-string isearch-string))
	(grep-compute-defaults)
	(lgrep (if isearch-regexp shk-search-string (regexp-quote shk-search-string))
		   (format "*.%s" (file-name-extension (buffer-file-name)))
		   default-directory)
	(isearch-abort)))
(define-key isearch-mode-map [(control shift o)]  'my-lgrep-while-isearch)

(provide 'my-isearch)
