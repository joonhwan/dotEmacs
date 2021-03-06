;; -*- coding:utf-8-auto; -*-

(require 'cc-mode)
(require 'cc-vars)

(when (my-try-require 'codesearch)
  (global-set-key (kbd "C-c , ,") 'codesearch-search-at-point)
  (global-set-key (kbd "C-c , /") 'codesearch-build-index)
  (global-set-key (kbd "C-c , u") 'codesearch-update-index)
  )

(when (my-try-require 'cmake-project)
  (setq cmake-project-default-build-dir-name "build/")
  (defun my-maybe-cmake-project-hook ()
	(if (file-exists-p "CMakeLists.txt")
		(cmake-project-mode)))
  )

;; order of cdr list is IMPORTANT!  (for example, when
;; 'ff-find-other-file' failed it would ask user the default file name
;; with the extension which is car of this list!)
(setq cc-other-file-alist
	  '(("\\.cc\\'"
		 (".hh" ".h"))
		("\\.hh\\'"
		 (".cc" ".C"))
		("\\.c\\'"
		 (".h"))
		("\\.h\\'"
		 (".cpp" ".cxx" ".C" ".CC" ".c" ".cc" ".m" ".mm" "_win32.cpp" ))
		("\\.C\\'"
		 (".H" ".hh" ".h"))
		("\\.H\\'"
		 (".C" ".CC"))
		("\\.CC\\'"
		 (".HH" ".H" ".hh" ".h"))
		("\\.HH\\'"
		 (".CC"))
		("\\.c\\+\\+\\'"
		 (".h++" ".hh" ".h"))
		("\\.h\\+\\+\\'"
		 (".c++"))
		("\\.cpp\\'"
		 (".hpp" ".hh" ".h" ".hxx"))
		("\\.hpp\\'"
		 (".cpp"))
		("\\.cxx\\'"
		 (".hxx" ".hh" ".h"))
		("\\.hxx\\'"
		 (".cxx" ".cpp"))
		("\\.m[m]*"
		 (".h"))
		))
(setq cc-search-directories
	  '(
		"."
		"../include"
		"../src"
		"../source"
		".."
		"../../framework"
		"../../common"
		"c:/qt/4.8.1/include/Qt"
		"c:/qt/4.8.1/include"
		"c:/dev/gnuwin32/include"
		))

;; when opening a header like the one in stl
(add-to-list 'magic-fallback-mode-alist
			 '("[.*]*#include[ ]*\"" . c++-mode))

(mapcar (lambda(elem)
		  (add-to-list 'c++-font-lock-extra-types elem))
		'(
		  ;; "\\b[_Q]*ASSERT[a-zA-Z_]*\\b"
		  "\\bWp[:alnum:]*\\b"
		  "\\Q[:alnum:]*\\b"
		  ))

;;
;; Customizations for all modes in CC Mode.
;;
;; TODO : use 'regexp-opt'
;; wxXXX / Qt class name in wxWidgets
(add-to-list 'c++-font-lock-extra-types
			 "\\b\\(wx\\|Q[t]*\\)[A-Z][a-z][a-zA-Z]*?\\b")

(defun my-c-lineup-topmost-intro-cont(langelm)
  (save-excursion
	(back-to-indentation)
	(cond
	 ((looking-at "\\:")
	  '+)
	 (t
	  (progn
		(beginning-of-line)
		(cond
		 ((re-search-forward
		   (regexp-opt '("EVT_"
						 "ON_"
						 ))
		   (line-end-position) t)
		  'c-basic-offset)
		 ((re-search-forward 
		   (regexp-opt '("DEFINE"
						 "template"
						 "END_"
						 "IMPLEMENT"
						 "DECLARE"
						 "MAP_PROPERTY"))
		   (line-end-position) t)
		  0)
		 ((save-excursion
			(c-backward-syntactic-ws (c-langelem-pos langelm))
			(re-search-backward
			 (regexp-opt '("BEGIN_STATE"))
			 (line-beginning-position) t)
			)
		  'c-basic-offset
		  )
		 (t
		  (c-lineup-topmost-intro-cont langelm))))))))

;; (font-lock-add-keywords
;;  'c++-mode
;;  '(((regexp-opt '("foreach" "emit" "Q_ASSERT")) . font-lock-keyword-face)))


(defun my-c-lineup-statement-cont(langelm)
  (save-excursion
	(previous-line)
	(back-to-indentation)
	(cond
	 ((looking-at "MAP")
	  0)
	 (t
	  nil))))

(defun my-block-close-case-align(langelm)
  (save-excursion
	(backward-list)
	(let ((syntax (car (car (c-guess-basic-syntax)))))
	  (if (eq syntax 'case-label)
		  '+
		0))))

(defun my-block-close-in-switch-case-align(langelm)
  (save-excursion
	(backward-up-list)
	(let ((syntax (car (car (c-guess-basic-syntax)))))
	  (if (eq syntax 'case-label)
		  '+
		0))))

(defun my-file-containig-signature-exist-p (dir file-pattern-regexp signature-regexp)
  (let ((found-file-list (directory-files-and-attributes
						  dir
						  t
						  file-pattern-regexp))
		(exist nil))
	(while (and (not exist)
				found-file-list)
	  (with-temp-buffer
		(erase-buffer)
		(beginning-of-buffer)
		(insert-file-contents (caar found-file-list))
		(if (search-forward-regexp signature-regexp nil t)
			(setq exist t))
		(setq found-file-list (cdr found-file-list))))
	exist))

;;
;; compile mode
;;
(require 'compile)
(defun my-recommend-compile-command(&optional arg)
  (let* ((my-buffer (current-buffer))
		 (srcname (file-name-nondirectory buffer-file-name))
		 (srctitle (file-name-sans-extension srcname))
		 (srcext (file-name-extension buffer-file-name))
		 (dirname (file-name-directory buffer-file-name))
		 (targetname nil)
		 (makeprog "make"))
	(unless (null arg)
	  (cond
	   ((member major-mode '(c++-mode cc-mode))
		(setq targetname (concat srctitle ".o")))))
	;; (if (string-match "/vobs" dirname)
	;;     (setq makeprog "pbuild"))
	(concat
	 (cond
	  ;; when there is makefile in this dir..
	  ((or (file-exists-p "Makefile")
		   (file-exists-p "makefile"))
	   "make")
	  ;; when there is *.mak and it is Borland C++ Builder's make file..
	  ((my-file-containig-signature-exist-p
		dirname
		"\\.mak$"
		"BCB IDE")
	   (unless (null arg)
		 (setq targetname (concat srctitle ".obj")))
	   "bmake")
	  ;; file is header but if makefile is in ../src fortunately...
	  ((and (string-match "\\.h\\(\\(h\\)\\|\\(pp\\)\\)?$" srcname)
			(or (file-exists-p (concat dirname "../src/Makefile"))
				(file-exists-p (concat dirname "../src/makefile"))))
	   (concat "pushd ../src; " makeprog))
	  ;; no makefile but file is c++ source
	  ((string-match "\\.c\\(\\(c\\)\\|\\(pp\\)\\)$" srcname)
	   (if win32p
		   (format "gcc -o %s %s %s" srctitle "-g" srcname)
		 (format "CC -o %s %s %s" srctitle "-g -mt -D_REENTRANT" srcname)))
	  ;; no makefile but file is c source
	  ((string-match "\\.c$" srcname)
	   (if win32p
		   (format "gcc -o %s %s %s" srctitle "-g" srcname)
		 (format "cc -o %s %s %s" srctitle "-g -mt -D_REENTRANT" srcname)))
	  ;; unexpected case
	  (t "echo unknown compilation case!"))
	 (if targetname (concat " " targetname)))
	))
(setq my-compile-key
	  '((",c" . compile)
		(",r" . recompile)))
(dolist (joonkey my-compile-key)
  (define-key mode-specific-map (car joonkey) (cdr joonkey)))

;;
;; style
;;
(c-add-style 
 "mystyle"
 '("stroustrup"
   ;; other could use tab :(
   (indent-tabs-mode . t)
   (c-basic-offset . 4)
   (tab-width . 4) ;;necessary setq!!!
   (c-cleanup-list . (brace-else-brace
					  brace-elseif-brace
					  brace-catch-brace
					  ;; empty-defun-braces
					  defun-close-semi
					  scope-operator
					  ))
   (c-hanging-braces-alist
	. (
	   (defun-open after)
	   (defun-close before after)
	   (class-open after)
	   (class-close before after)
	   (namespace-open after)
	   (inline-open after)
	   (inline-close before after)
	   (block-open after)
	   (block-close . c-snug-do-while)
	   (extern-lang-open after)
	   (extern-lang-close after)
	   (statement-case-open after)
	   (substatement-open after)
	   ))
   (c-hanging-colons-alist
	. (
	   (case-label)
	   (label after)
	   (access-label after)
	   (member-init-intro before)
	   (inher-intro)
	   ))
   (c-hanging-semi&comma-criteria
	;; following order is important
	. (c-semi&comma-no-newlines-before-nonblanks
	   c-semi&comma-no-newlines-for-oneline-inliners
	   c-semi&comma-inside-parenlist
	   ))
   (c-offsets-alist
	. ((arglist-intro . ++)
	   (comment-intro . 0)
	   (inher-cont . c-lineup-multi-inher)
	   (inline-open . 0)
	   (innamespace . -)
	   (label . 0)
	   (member-init-intro . +)
	   (statement-case-open . +)
	   (statement-case-open . +)
	   (statement-cont . (my-c-lineup-statement-cont c-lineup-math))
	   (substatement-open . 0)
	   (template-args-cont . +)
	   (topmost-intro-cont . my-c-lineup-topmost-intro-cont)
	   ;; (block-close . my-block-close-case-align)
	   (block-close . 0)
	   ;; (statement-block-intro . my-block-close-in-switch-case-align)
	   (statement-block-intro . +)
	   (statement-case-intro . +)
	   ))
   )
 )
(c-add-style 
 "mystyle2"
 '("stroustrup"
   (indent-tabs-mode . t) ;; other could use tab :(
   (c-basic-offset . 4) 
   (tab-width . 4) ;;necessary setq!!!
   (c-offsets-alist
	. ((arglist-intro . ++)
	   (comment-intro . 0)
	   (inher-cont . c-lineup-multi-inher)
	   (inline-open . 0)
	   (innamespace . -)
	   (label . 0)
	   (member-init-intro . +)
	   (statement-case-open . +)
	   (statement-case-open . +)
	   (statement-cont . (my-c-lineup-statement-cont c-lineup-math))
	   (substatement-open . 0)
	   (template-args-cont . +)
	   (topmost-intro-cont . my-c-lineup-topmost-intro-cont)
	   ;; (block-close . my-block-close-case-align)
	   (block-close . 0)
	   ;; (statement-block-intro . my-block-close-in-switch-case-align)
	   (statement-block-intro . +)
	   (statement-case-intro . +)
	   ))
   )
 )

(defun my-c-mode-common-hook ()
  (subword-mode 1)
  (electric-indent-mode 1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1)
  (setq show-trailing-whitespace t)
  (hs-minor-mode 1)
  ;; (which-function-mode 1) 
  (c-set-style "mystyle2" nil)
  ;; ;; TODO more reasonable way to do this?
  ;; (if debug-on-error
  ;; 	  (toggle-debug-on-error))
  ;; for work with auto-complete and yasnippet
  (when (boundp 'ac-sources)
	(add-to-list 'ac-sources 'ac-source-yasnippet t))
  (if (featurep 'expand-region-core)
	  ;; in c++ mode i do not use er/mark-word actually.
	  (set (make-local-variable 'er/try-expand-list) '(;; er/mark-word
													   er/mark-symbol
													   er/mark-symbol-with-prefix
													   er/mark-next-accessor
													   er/mark-method-call
													   er/mark-comment
													   er/mark-comment-block
													   er/mark-inside-quotes
													   er/mark-outside-quotes
													   er/mark-inside-pairs
													   er/mark-outside-pairs)))
  (if (featurep 'projectile)
  	  (projectile-mode 1))
  (if (featurep 'cmake-project)
	  (my-maybe-cmake-project-hook))
  ;; (flymake-mode 0)
  ;; (set (make-local-variable 'compile-command)
  ;; 	   (my-recommend-compile-command))
  
  )

(setq my-build-dir "")
(set (make-local-variable 'my-build-dir) nil)
(put 'my-build-dir 'disabled nil)

(add-hook 'c-mode-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c-mode-common-hook)


(when (my-try-require 'omnisharp)
  (setq
   omnisharp--windows-curl-tmp-file-path "d:/temp/omnisharp-tmp-file.cs"
   ;; omnisharp-auto-complete-popup-help-delay nil ;; no delay
   ;; omnisharp-host "http://localhost:2000"
   omnisharp-server-executable-path "c:/dev/omnisharp/omnisharp.exe"
   ;; omnisharp-timeout 1
   )
  )
  
(defun my-csharp-mode-hook ()
  (subword-mode 1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1)
  (setq show-trailing-whitespace t)
  (hs-minor-mode 1)
  ;; (which-function-mode 1) 
  (c-set-style "c#" nil)
  ;; ;; TODO more reasonable way to do this?
  ;; (if debug-on-error
  ;; 	  (toggle-debug-on-error))
  ;; for work with auto-complete and yasnippet
  (when (boundp 'ac-sources)
	(add-to-list 'ac-sources 'ac-source-yasnippet t))
  (if (featurep 'expand-region-core)
	  ;; in c++ mode i do not use er/mark-word actually.
	  (set (make-local-variable 'er/try-expand-list) '(;; er/mark-word
													   er/mark-symbol
													   er/mark-symbol-with-prefix
													   er/mark-next-accessor
													   er/mark-method-call
													   er/mark-comment
													   er/mark-comment-block
													   er/mark-inside-quotes
													   er/mark-outside-quotes
													   er/mark-inside-pairs
													   er/mark-outside-pairs)))
  (if (featurep 'projectile)
  	  (projectile-mode 1))
  ;; (flymake-mode nil)
  (omnisharp-mode 1)
  )

(add-hook 'csharp-mode-hook 'my-csharp-mode-hook)

;; (add-to-list 'load-path "~/elisp/project-buffer")
;; (require 'sln-mode)
;; (autoload 'find-sln "sln-mode")
;; (defun dump-file-list-from-sln (sln-file)
;;   (cd (file-name-directory sln-file))
;;   (let ((sln-projects (sln-extract-projects sln-file)))
;;     (let ((vcproj-file (cdr (pop sln-projects))))
;;       (let* ((project-dir (file-name-directory vcproj-file))
;; 	     (project-data (and (file-exists-p vcproj-file)
;; 				(vcproj-extract-data vcproj-file))))
;; 	(when project-data
;; 	  (let ((files (vcproj-update-file-folders (caddr project-data) project-dir)))
;; 	    (while files
;; 	      (let ((file (cdr (pop files))))
;; 		;; (prin1 file)
;; 		))))))))

(add-to-list 'auto-mode-alist '("\\.\\(c\\|cpp\\|cxx\\|cc\\|h\\|inl\\|hpp\\|ihh\\|hh\\)\\(\\.~[^~]+[~]?\\)?$" . c++-mode) nil)

;; *.h objc file criteria
;; - if there are a pair of *.h/*.m (skipped for now)
;; - if there is "@class" or "@interface" or "@class"
;; - if the directory contains xcodeproj
;; - if the directory contains xib
(defun my/source-file-looks-like-objc()
  ;; (message (concat "file path : " (buffer-file-name)))
  (let* ((file-path (buffer-file-name))
		 (fne (file-name-extension (if (stringp file-path) file-path "")))
		 (file-ext (or (and (stringp file-path)
							(stringp fne)
							(downcase fne))
					   ""))
		 )
	(and (string-match-p file-ext (regexp-opt '("h" "m")))
		 (search-forward-regexp (regexp-opt '("@interface" "@class" "@implement")) 500 t 1)
		 ;; (or (search-forward-regexp (regexp-opt '("@interface" "@class" "@implement")) 500 t 1)
		 ;; 	 (directory-files (file-name-directory file-path) t (regexp-opt '("\.xib" "\.xcodeproj" "\.lproj"))))
		 ))
  )
(add-to-list 'magic-mode-alist '(my/source-file-looks-like-objc . objc-mode))
(add-to-list 'auto-mode-alist '("\\.\\(m\\)?$" . objc-mode) nil)

;; pairing.?! cpp <--> h no matter cursor position
(defun my-ff-find-other-file (arg)
  (interactive "P")
  (ff-find-other-file arg t))

(define-key c-mode-base-map (kbd "C-m") 'newline)
(define-key c-mode-base-map (kbd "C-<f7>") 'compile)
(define-key c-mode-base-map (kbd "C-<f8>") 'recompile)
(define-key c-mode-base-map (kbd "C-c h p") 'ff-find-other-file)
(define-key c-mode-base-map (kbd "C-c h o") 'ff-find-other-file)

;; csharp-mode
(when (my-try-require 'csharp-mode)
  (setq auto-mode-alist
      (append '(("\\.cs$" . csharp-mode)) auto-mode-alist))
   (defun my-csharp-mode-fn ()
      "function that runs when csharp-mode is initialized for a buffer."
	  ;; (my-c-mode-common-hook)
   )
   (add-hook  'csharp-mode-hook 'my-csharp-mode-fn t)
   )


(provide 'my-cc-mode)
