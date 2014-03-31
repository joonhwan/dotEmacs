;; * common lisp -*- coding:utf-8; -*-
(require 'cl)

;; * the very first package of mine

;; ** hints from http://www.mygooglest.com/fni/dot-emacs.html
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

;; ** which box i am using? mac? windows?
;; [TIP] http://dreamstorm.cafe24.com/cgi-bin/moin.cgi/dreamstorm/emacs
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

;; ** regexp concat : from gmm-regexp-concat
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

;; ** regexp concat for file ext : from regexp-opt. 
(defun my-file-ext-regexp-opt (extensions)
  "modified version of original `regex-opt' to handle file
extension matcher"
  (concat "\\(?:\\.\\(?:" (regexp-opt extensions) "\\$\\)\\)"))

;; ** cc-mode aligner : for better look(?) in c++ source code(align text lines of member var or func)
(defun my-regexp-align-c++-member ()
  (interactive
   (align-regexp (region-beginning) (region-end) "\\(\\s-*\\)[^ ]+\\((\\|;\\)" align-default-spacing 1)))

;; ** newbie's list processor 
(defun my-modify-alist (alist-to-modify key-to-change value-to-change)
  "Replace an element within an association list. 

ALIST-TO-MODIFY must be association list's symbol.
KEY-TO-CHANGE is a search key
VALUE-TO-CHANGE is a value of which is KEY by matching `equal' function

example:

\(progn
  (setq my-frame-parameters '((menu-bar-lines . 0)
							  (tool-bar-lines . 0)
							  (scroll-bar . 14)
							  (font . \"Ubuntu Mono-11:normal:antialias=natural\")))
  (setq my-frame-parameters `(,@my-frame-parameters (height . 10)))
  (my-modify-alist 'my-frame-parameters 'height 20)
  my-frame-parameters)

"
  (let ((seq (symbol-value alist-to-modify))
		(alist-temp nil)
		(match-found))
	(mapcar (lambda (elem)
			  (let* ((key (car elem))
					 (val (cdr elem)))
				(if (equal key-to-change key)
					(progn
					  (add-to-list 'alist-temp `(,key . ,value-to-change) t)
					  (setq match-found t))
				  (add-to-list 'alist-temp elem t)
				  )
				)
			  )
			seq)
	(unless match-found
	  (add-to-list 'alist-temp `(,key-to-change . ,value-to-change)))
	(set alist-to-modify alist-temp)
	(symbol-value alist-to-modify)
	))

(defun my-modify-alist-with-alist(alist-to-modify alist-source)
  "Replace more than one element within an association list"
  (mapcar
   (lambda (elem)
	 (let* ((key (car elem))
			(val (cdr elem)))
	   (my-modify-alist alist-to-modify key val)))
   alist-source))

;;
;; * Load path etc.
;;
(setq my-dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name))
	  my-autoinstall-dir (concat my-dotfiles-dir "auto-install")
	  ;; my-ccmode-dir (concat my-dotfiles-dir "cc-mode")
	  my-dropbox-dir (cond
					  (macp "~/DropBox")
					  (t "~/DropBox"))
	  my-etc-dir (concat my-dotfiles-dir "etc")
	  )
(make-variable-buffer-local 'my-project-root)

(add-to-list 'load-path my-dotfiles-dir)
(add-to-list 'load-path my-autoinstall-dir)
(add-to-list 'load-path (concat my-dotfiles-dir "alien/manual-package"))
(load ".manual-package-loaddefs.el")

;; * language
(progn
  (cond
   (win32p
	(set-language-environment "Korean")
	;; elisp은 그냥 utf-8이 편하다.(github등의 코드들)
	(add-to-list 'file-coding-system-alist '("\\.el\\'" utf-8))
	(add-to-list 'process-coding-system-alist '("git" utf-8 . utf-8))
	)
   (macp
	;; (setq default-process-coding-system "utf-8-mac")
	;; (setq buffer-file-coding-system "utf-8-mac")
	;; (setq file-name-coding-system "utf-8")
	(global-set-key (kbd "S-SPC") 'toggle-input-method)
	)
   )
  (setq default-input-method "korean-hangul390")
  (setq default-korean-keyboard "390")) ;;--> 3beolsik 390
(define-coding-system-alias 'ks_c_5601-1987 'korean-iso-8bit)
;; (add-to-list 'file-coding-system-alist '("\\.el\\'" . 'utf-8))

;; some critical key
(setq
 ;; i use command key as meta 
 mac-command-modifier 'meta
 )

;; little func for win32 path resolving.. :(
(defun my-find-any-first-exists-file (file-path-list &optional default-value)
  "find any first existing file in list"
  (let ((list file-path-list) 
		(elem)
		(found-elem))
	(catch 'break
	  (while list
		(catch 'continue
		  (setq elem (car list))
		  (when (file-exists-p elem)
			(setq found-elem elem)
			(throw 'break elem)
			)
		  (setq list (cdr list))
		  )
		)
	  )
	(if (and (not found-elem) default-value)
	  (setq found-elem default-value)
	)
  )
)

;;
;; * i'm not using normal path of emacs customization!
;;
(setq custom-file (concat my-dotfiles-dir "my-customization.el"))

(provide 'my-common)
