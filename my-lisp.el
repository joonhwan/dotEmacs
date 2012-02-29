(call-interactively 'toggle-debug-on-error nil)

;;
;; hints from http://www.mygooglest.com/fni/dot-emacs.html
;; 
(defvar my-missing-packages-list nil
  "List of packages that `try-require' can't find.")
;; attempt to load a feature/library, failing silently
(defun my-try-require (feature)
  "Attempt to load a library or module. Return true if the
library given as argument is successfully loaded. If not, instead
of an error, just add the package to a list of missing packages."
  (condition-case err
      ;; protected form
      (progn
        (message "Checking for library `%s'..." feature)
        (if (stringp feature)
            (load-library feature)
          (require feature))
        (message "Checking for library `%s'... Found" feature))
    ;; error handler
    (file-error  ; condition
     (progn
       (message "Checking for library `%s'... Missing" feature)
       (add-to-list 'my-missing-packages-list feature 'append))
     nil)))

;; [TIP] http://dreamstorm.cafe24.com/cgi-bin/moin.cgi/dreamstorm/emacs
;; 여러 환경에서 쓰기 위한 설정값들
(defconst win32p
  (if (eq system-type 'windows-nt) t nil)
  "true if win32 nt-emacs")
(defconst unixp
  (if (memq system-type '(hpux dgux usg-unix-v irix linux gnu/linux)) t nil)
  "true if any unix emacs")
(defconst officep
  (if (string-match "JHLEE" system-name) t nil)
  "true if office pc")
(defconst macp
  (if (eq system-type 'darwin) t nil))
(defconst homep
  (not officep)
  "true if office pc")

;; from gmm-regexp-concat
(defun my-regexp-concat (regexp)
  "Potentially concat a list of regexps into a single one.
The concatenation is done with logical ORs."
  (cond ((null regexp)
	 nil)
	((stringp regexp)
	 regexp)
	((listp regexp)
	 (mapconcat (lambda (elt) (concat "\\(" elt "\\)"))
		    regexp
		    "\\|"))))

;; from regexp-opt. 
(defun my-file-ext-regexp-opt (extensions)
  "modified version of original `regex-opt' to handle file
extension matcher"
  (concat "\\(?:\\.\\(?:" (regexp-opt extensions) "\\$\\)\\)"))

;; for better look(?) in c++ source code(align text lines of member var or func)
(defun my-regexp-align-c++-member ()
  (interactive
   (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)[^ ]+\\((\\|;\\)" align-default-spacing 1)))


(defun my-disable-truncate-line ()
  (setq truncate-lines nil))

;; hint from
;; http://curiousprogrammer.wordpress.com/2009/03/10/elisp-association-lists/
(defun my-modify-alist (seq key-to-change value-to-change)
  "Replace an element within an association list where the cars match."
  (let ((modified-list nil))
	(mapcar (lambda (elem)
			  (let* ((key (car elem))
					 (val (cdr elem)))
				(if (equal key-to-change key)
					(add-to-list 'modified-list `(,key . ,value-to-change))
				  (add-to-list 'modified-list elem))
				)
			  )
			seq)
	(setq seq modified-list)
	seq
	))

(provide 'my-lisp)
