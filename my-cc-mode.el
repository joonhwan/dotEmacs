;; -*- coding:utf-8; -*-

(require 'cc-mode)
(require 'cc-vars)

(define-key c-mode-base-map "\C-m" 'newline)
(define-key c-mode-base-map "\C-cc" 'compile)
(define-key c-mode-base-map "\C-c\C-c" 'compile)
(define-key c-mode-base-map "\C-c\C-f" 'my-compile-this-file-only)
(define-key c-mode-base-map "\C-c\C-r" 'recompile)
(define-key c-mode-base-map "\C-chp" '(lambda(arg)
										(interactive "P")
										(ff-find-other-file arg t)))
(define-key c-mode-base-map "\C-cho" 'ff-find-other-file)

(setq cc-other-file-alist
	  '(("\\.cc\\'"
		 (".hh" ".h"))
		("\\.hh\\'"
		 (".cc" ".C"))
		("\\.c\\'"
		 (".h"))
		("\\.h\\'"
		 (".c" ".cc" ".C" ".CC" ".cxx" ".cpp"))
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
		 (".cxx" ".cpp"))))
(setq cc-search-directories
	  '(
		"."
		"../include"
		".."
		"../../framework"
		"../../common"
		"c:/qt/4.8.0/include/Qt"
		"c:/qt/4.8.0/include"
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
;; 아직 완성 안된 mfc macro 들여쓰기 line-up 함수
(defun my-c-msvc-macro-indent (langelem)
  (save-excursion
	(message "--------------------------")
	(let* ((dummy 0)
		   (anch (c-langelem-pos langelem))
		   (throws (catch 'thrownval
					 (while (< dummy 1)
					   (goto-char (c-point 'boi))
					   (if (looking-at "[A-Z]+_[A-Z]+")
						   (progn
							 (message "macro detected!")
							 (goto-char (c-point 'boi))
							 ;;(message "%s" (thing-at-point 'line))
							 (if (or (looking-at "BEGIN_[A-Z_]+")
									 (looking-at "DECLARE_[A-Z_]+"))
								 (progn (message "mfc begin macro!")
										(throw 'thrownval 0))
							   (if (looking-at "END_[A-Z_]+")
								   (throw 'thrownval 0)
								 (while (> (point) anch)
								   (goto-char (1- (c-point 'bol)))
								   (goto-char (c-point 'boi))
								   ;;(message "%s" (thing-at-point 'line))
								   (if (or (looking-at "BEGIN_[A-Z_]+")
										   (looking-at "DECLARE_[A-Z_]+"))
									   (throw 'thrownval c-basic-offset))))))
						 (throw 'thrownval c-basic-offset))
					   (setq dummy (+ dummy 1))))))
	  ;;(message "throwval is %d" throws)
	  (if (>= throws 0) throws 2))))
(defun my-c-brach-after-case-indent (langelem)
  "when brach appear right after case-statement within switch...

   switch(...)
   {
   case XXX:
   {
        xxxx;
   }
   break;
   case YYY:
   .

will be

   switch(...)
   {
   case XXX:
      {
         xxxx;
      }
      break;
   case YYY:
   .
"
  (save-excursion
	(let ((anch (c-langelem-pos langelem)))
	  (goto-char anch)
	  (if (looking-at "case")
		  c-basic-offset
		0))))

;; wx
(add-to-list 'c++-font-lock-extra-types "\\bwx[A-Z][a-z][a-zA-Z]*?\\b")

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
		 ((re-search-forward "EVT_\\|ON_" (line-end-position) t)
		  'c-basic-offset)
		 ((re-search-forward "DEFINE\\|template\\|END_\\|IMPLEMENT\\|DECLARE\\|MAP_PROPERTY" (line-end-position) t)
		  0)
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
(setq my-compile-key
	  '((",c" . compile)
		(",r" . recompile)))
(dolist (joonkey my-compile-key)
  (define-key mode-specific-map (car joonkey) (cdr joonkey)))
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

;;
;; flymake - for cc mode
;;
;; (require 'flymake)

;; (define-key c-mode-base-map [?\C--] 'flymake-goto-prev-error)
;; (define-key c-mode-base-map [?\C-=] 'flymake-goto-next-error)

;; (setq flymake-gui-warnings-enabled nil)
;; (defun flymake-display-warning (warning)
;;   "Display a warning to user."
;;   (lwarn 'flymake :warning warning))
;; (setq flymake-log-level 1)

;; following tips from
;; http://stackoverflow.com/questions/5726988/flymake-complains-x-is-not-available-even-when-configured-not-to-use-x

;; show error in the mini buffer instead of in the menu.
;; flymake-ler(file line type text &optional full-file)
;; (defun show-fly-err-at-point ()
;;   "If the cursor is sitting on a flymake error, display the message in the minibuffer"
;;   (interactive)
;;   (let ((line-no (line-number-at-pos)))
;;     (dolist (elem flymake-err-info)
;;       (if (eq (car elem) line-no)
;;           (let ((err (car (second elem))))
;;             (message "%s" (flymake-ler-text err)))))))
;; (defadvice flymake-goto-next-error (after display-message activate compile)
;;   "Display the error in the mini-buffer rather than having to mouse over it"
;;   (show-fly-err-at-point))
;; (defadvice flymake-goto-prev-error (after display-message activate compile)
;;   "Display the error in the mini-buffer rather than having to mouse over it"
;;   (show-fly-err-at-point))
;; (defadvice flymake-mode (before post-command-stuff activate compile)
;;   "Add functionality to the post command hook so that if the
;; cursor is sitting on a flymake error the error information is
;; displayed in the minibuffer (rather than having to mouse over
;; it)"
;;   (set (make-local-variable 'post-command-hook)
;;        (cons 'show-fly-err-at-point post-command-hook)))
;;

;; (setq flymake-allowed-file-name-masks
;; 	  '(("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" my-flymake-simple-make-init)
;; 		("\\.xml\\'" flymake-xml-init)
;; 		("\\.html?\\'" flymake-xml-init)
;; 		("\\.cs\\'" flymake-simple-make-init)
;; 		("\\.p[ml]\\'" flymake-perl-init)
;; 		("\\.php[345]?\\'" flymake-php-init)
;; 		("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
;; 		("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup)
;; 		("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
;; 		("\\.tex\\'" flymake-simple-tex-init)
;; 		("\\.idl\\'" flymake-simple-make-init)))

;; (setq flymake-allowed-file-name-masks
;; 	  (cons '(".+\\.c$"
;; 			  flymake-simple-make-init
;; 			  flymake-simple-cleanup
;; 			  flymake-get-real-file-name)
;; 			flymake-allowed-file-name-masks))

;; (defun my-flymake-simple-make-init ()
;;   (flymake-simple-make-init-impl
;;    'flymake-create-temp-inplace
;;    t
;;    t
;;    "flymake.mak"
;;    'my-flymake-get-make-cmdline))

;; (defun my-flymake-get-make-cmdline (source base-dir)
;;   (list "nmake"
;; 		(list (concat "/fflymake.mak")
;; 			  "/I"
;; 			  (concat "CHK_SOURCES=" source)
;; 			  "check-syntax")))
;; ;;
;; ;; cc-mode hook configuration
;; ;;
(c-add-style
 "mystyle"
 '("stroustrup"
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
   (c-offsets-alist
	(arglist-intro . ++)
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
	)))

(defun my-c-mode-common-hook ()
  (subword-mode 1)
  (c-toggle-auto-newline 1)
  (c-toggle-hungry-state 1)
  (setq show-trailing-whitespace t)
  (hs-minor-mode 1)
  (c-set-style "mystyle" nil)
  ;; for work with auto-complete and yasnippet
  (when (boundp 'ac-sources)
	(append ac-sources '(ac-source-yasnippet)))
  ;; (flymake-mode 1)
  ;; (set (make-local-variable 'compile-command)
  ;; 	   (my-recommend-compile-command))
  )

(defun my-compile-this-file-only()
  (interactive)
  (set (make-local-variable 'compile-command)
	   (my-recommend-compile-command t))
  ;; check if we compile only current buffer...
  (let ((compile-one-file (string-match (file-name-sans-extension (file-name-nondirectory buffer-file-name))
										compile-command))
		(old-compilation-ask-about-save compilation-ask-about-save))
	(if compile-one-file
		(progn
		  (save-buffer)
		  (setq compilation-ask-about-save nil)))
	(call-interactively 'compile)
	(if compile-one-file
		(setq compilation-ask-about-save old-compilation-ask-about-save))
	))

(setq my-build-dir "")
(set (make-local-variable 'my-build-dir) nil)
(put 'my-build-dir 'disabled nil)

(add-hook 'c-mode-hook 'my-c-mode-common-hook)
(add-hook 'c++-mode-hook 'my-c-mode-common-hook)

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

(provide 'my-cc-mode)
