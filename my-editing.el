(require 'generic-x) ;; for many files' editing
;; (require 'indent)
;; (require 'misc)

;; my on/off option
(defvar i-use-show-paren-mode t)
(defvar i-display-time-date nil)
(defvar i-use-column-number-mode nil)
(defvar i-use-global-hl-line-mode t)
(defvar i-use-save-history-mode t)
(defvar i-use-save-place t)
(defvar i-use-ibuffer-mode t)
(defvar i-use-directory-abbrev nil)
(defvar i-use-uniquify t)
(defvar i-use-recentf nil)
(defvar i-use-cua-mode nil)
(defvar i-use-nxhtml-mode nil)
(defvar i-use-popwin nil)
(defvar i-use-delsel t)
(defvar i-use-workgroup nil)

;; platform independent setq
(setq
 ;; no splash
 inhibit-startup-message t
 ;; no raising of frame when emacs print message on minibuffer
 minibuffer-auto-raise nil
 ;; deleting file into recycle bin...
 delete-by-moving-to-trash t
 ;; truncate none whenver it is enabled
 truncate-partial-width-windows nil
 ;; any duplicated history item will be removed!!!
 history-delete-duplicates t
 ;; ;; not to split horizontally that I hate.. especially in wide screen
 ;; split-height-threshold 120
 ;; recursive minibuffer command now possible
 enable-recursive-minibuffers t
 ;; --- hard to remember(file name completion incase sensitively) --
 ;; 
 ;; match file name case --> automatically set by emacs 
 ;; ;; match file name case
 ;; read-file-name-completion-ignore-case t ;; 
 ;; match buffer name case
 read-buffer-completion-ignore-case t
 ;; every completion excluding filename/buffername case
 completion-ignore-case t
 ;; search/match ignore case
 case-fold-search t
 ;; quiet
 visible-bell t
 ;; 
 hscroll-step 5
 ;; 
 standard-indent 4
 ;; 
 default-tab-width 4
 ;; convenient to move around currunt window.
 make-backup-files nil
 ;; 
 completion-ignored-extensions '(".svn/" "CVS/" ".o" "~" ".bin" ".bak" ".obj" ".map" ".ico" ".pif" ".lnk" ".a" ".ln" ".blg" ".bbl" ".dll" ".drv" ".vxd" ".386" ".elc" ".lof" ".glo" ".idx" ".lot" ".dvi" ".fmt" ".tfm" ".pdf" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".fasl" ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo")
 safe-local-variable-values '(
							  (eval rainbow-mode t)
							  (my-org-current-project-name . "orgwiki")
							  )
 )

;; per platform setq
(cond
 (win32p
  )
 (macp
  (setq ring-bell-function (lambda () t)))
 )

;; function alias 
(fset `yes-or-no-p `y-or-n-p)
(defalias `dtw `delete-trailing-whitespace)
(defalias `wcr `whitespace-cleanup-region)
(defalias `rrr `revert-buffer)
(defalias `cc `compile)
(defalias `ccc `my-compile-this-file-only)
(defalias `ffb `font-lock-fontify-buffer)

;; 
;; full option config
;;
(when i-use-column-number-mode
  (show-paren-mode 1)
  ;; one of parenthesis,expression, and mixed
  (setq show-paren-style 'parenthesis)
  )

(when i-display-time-date
  (display-time-mode 1)
  ;; [display-time-mode]
  ;; display fully if enabled
  display-time-day-and-date t
 )

(when i-use-column-number-mode
  (column-number-mode 0)
  )

(when i-use-global-hl-line-mode
    ;; hilight current line.
  (global-hl-line-mode 1)
  )

(when i-use-save-history-mode
  (savehist-mode 1)
  (setq
   savehist-additional-variables
   '(
     file-name-history
     compile-history
     regexp-history
     grep-files-history
     grep-regexp-history
     dired-shell-command-history
     shell-command-history
     ))
  )

(when i-use-save-place
  (setq-default save-place t)
  (require 'saveplace)
  )

(when i-use-ibuffer-mode
  (autoload 'ibuffer "ibuffer" "List buffers." t)
  (global-set-key (kbd "C-x C-b") 'ibuffer)
  (setq ibuffer-eliding-string ">>"
	ibuffer-formats (quote (("[" mark modified read-only "]" (name 30 30 :left) " " (mode 16 16 :left :elide) " " filename-and-process) (mark " " (name 16 -1) " " filename)))
	ibuffer-marked-face (quote info-menu-star)))

(when i-use-uniquify
  (require 'uniquify)
  (setq
   uniquify-buffer-name-style 'post-forward-angle-brackets
   uniquify-separator "@"
   uniquify-min-dir-content 2
   ))

(when i-use-recentf
  (require 'recentf)
  (progn
    (setq recentf-max-saved-items 500)
    (recentf-mode t)
    (global-set-key (kbd "C-c f r") 'recentf-file)
    ))

(when i-use-directory-abbrev
  (setq directory-abbrev-alist
	'(
	  ;; ("^\\(/view/[^/]*\\).*/vobs" . "\\1/vobs")
	  ("^\\.*/pis" . "d:/prj/wp/pis/trunk")
	  ("^\\.*/sis" . "d:/prj/wp/sis/trunk/src")
	  ("^\\(/view/[^/]*\\).*/opal" . "\\1/vobs/opal")
	  ("^\\(/view/[^/]*\\).*/sub" . "\\1/vobs/opal/subsystems")
	  ("^[/]?asx" . "/view/jwlee_asx/")
	  ("^[/]?rel16" . "/view/jwlee_rel16/")
	  ))

  (defun my-abbreviate-file-name (filename)
    "Return a version of FILENAME shortened using `directory-abbrev-alist'.
This also substitutes \"~\" for the user's home directory (unless the
home directory is a root directory) and removes automounter prefixes
\(see the variable `automount-dir-prefix')."
    ;; Get rid of the prefixes added by the automounter.
    (save-match-data
      (if (and automount-dir-prefix
	       (string-match automount-dir-prefix filename)
	       (file-exists-p (file-name-directory
			       (substring filename (1- (match-end 0))))))
	  (setq filename (substring filename (1- (match-end 0)))))
      (let ((tail directory-abbrev-alist)
	    (filename-cand))
	;; If any elt of directory-abbrev-alist matches this name,
	;; abbreviate accordingly.
	(while tail
	  (unless (file-exists-p filename)
	    (setq filename-cand (replace-regexp-in-string (car (car tail)) (cdr (car tail)) filename))
	    (if (file-exists-p filename-cand)
		(setq filename filename-cand)))
	  ;; (if (string-match (car (car tail)) filename)
	  ;; 	(setq filename
	  ;; 		  (concat (cdr (car tail)) (substring filename (match-end 0)))
	  ;; 		  ))
	  (setq tail (cdr tail)))
	;; Compute and save the abbreviated homedir name.
	;; We defer computing this until the first time it's needed, to
	;; give time for directory-abbrev-alist to be set properly.
	;; We include a slash at the end, to avoid spurious matches
	;; such as `/usr/foobar' when the home dir is `/usr/foo'.
	(or abbreviated-home-dir
	    (setq abbreviated-home-dir
		  (let ((abbreviated-home-dir "$foo"))
		    (concat "^" (abbreviate-file-name (expand-file-name "~"))
			    "\\(/\\|\\'\\)"))))

	;; If FILENAME starts with the abbreviated homedir,
	;; make it start with `~' instead.
	(if (and (string-match abbreviated-home-dir filename)
		 ;; If the home dir is just /, don't change it.
		 (not (and (= (match-end 0) 1)
			   (= (aref filename 0) ?/)))
		 ;; MS-DOS root directories can come with a drive letter;
		 ;; Novell Netware allows drive letters beyond `Z:'.
		 (not (and (or (eq system-type 'ms-dos)
			       (eq system-type 'cygwin)
			       (eq system-type 'windows-nt))
			   (save-match-data
			     (string-match "^[a-zA-`]:/$" filename)))))
	    (setq filename
		  (concat "~"
			  (match-string 1 filename)
			  (substring filename (match-end 0)))))
	filename)))
  ;; replace original abbreviate-file-name
  (fset 'abbreviate-file-name 'my-abbreviate-file-name)
  )

(when i-use-cua-mode
  ;;
  ;; dwim-style 'end-of-line' and 'begin-of-line'
  ;; http://www.reddit.com/r/emacs/comments/eml3a/one_key_to_delete_whitespace_sequentially/
  ;;
  (defun to-end-of-code ()
    (end-of-line)
    (skip-chars-backward " \t")
    (let ((pt (point))
	  (lbp (line-beginning-position))
	  (comment-start-re (concat (regexp-quote
				     (replace-regexp-in-string
				      "[[:space:]]*" "" comment-start))
				    "\\|\\s<"))
	  (comment-stop-re "\\s>")
	  (lim))
      (when (re-search-backward comment-start-re lbp t)
	(setq lim (point))
	(if (re-search-forward comment-stop-re (1- pt) t)
	    (goto-char pt)
	  (goto-char lim)               ; test here ->
	  (while (looking-back comment-start-re (1- (point)))
	    (backward-char))
	  (skip-chars-backward " \t")))))
  (defun end-of-code-or-line ()
    "Move to EOL. If already there, to EOL sans comments.
    That is, the end of the code, ignoring any trailing comment
    or whitespace.  Note this does not handle 2 character
    comment starters like // or /*.  Such will not be skipped."
    (interactive)
    (if (eq last-command this-command)
	(if (not (eolp))
	    (end-of-line)
	  (to-end-of-code))
      (if (not (eolp))
	  (to-end-of-code))))
  (defun beginning-of-line-dwim (arg)
    (interactive "p")
    (if (eq last-command this-command)
	(if (bolp)
	    (beginning-of-line-text arg)
	  (move-beginning-of-line arg))
      (beginning-of-line-text arg)))

  (put 'beginning-of-line-dwim 'CUA 'move)
  ;; <home> is still bound to move-beginning-of-line
  ;; (global-set-key (kbd "C-a") 'beginning-of-line-dwim)
  (put 'end-of-code-or-line 'CUA 'move)
  ;; <end> is still bound to end-of-visual-line
  ;; (global-set-key (kbd "C-e") 'end-of-code-or-line)

  ;;
  ;; cua-mode (using it for its rectangle selection feature)
  ;;
  ;; ;; CUA에서 처럼, 선택영역 활성화시 DEL이나 다른 키 입력을 하면
  ;; ;; 선택영역이 지워진다
  ;; ;; 이 내용은 반드시 icicle의 활성화보다는 먼저 와야 한다.
  ;; ;; http://www.emacswiki.org/cgi-bin/wiki/Icicles_-_Customization_and_General_Tips 참조
  ;; (require 'delsel)
  ;; ;; (delete-selection-mode t)
  (setq cua-enable-cua-keys nil)
  ;; without following hook, we cannot deactivate mark after pressing C-g !!
  (add-hook 'deactivate-mark-hook
	    (lambda ()
	      (setq cua--explicit-region-start nil)
	      ))
  (cua-mode t)
  )

(when (and i-use-nxhtml-mode
		   (my-try-require "nxhtml"))
  (load "nxhtml/autostart.el" t "loaded nxhtml...")
 )

(when (and i-use-popwin
		   (my-try-require "popwin"))
  (setq
   display-buffer-function 'popwin:display-buffer
   special-display-function 'popwin:special-display-popup-window
   special-display-regexps `(,(regexp-opt '("\\*completions\\*" "\\*Completions\\*" "\\*Help\\*")))
   ;; special-display-buffer-names '("*cmd shell*" "*compilation*"))
   )
  (global-set-key (kbd "C-c p") popwin:keymap)
  )

(when i-use-delsel
  (delete-selection-mode 1)
  )


(when (and i-use-workgroup
		   (my-try require 'workgroups))
  ;; one that should be loaded at last
  (setq
   wg-prefix-key (kbd "C-c w")
   wg-morph-on nil
   )
  (workgroups-mode t))


(eval-after-load "info"
  '(progn
	 (cond
	  (win32p
	   (setq Info-default-directory-list '(
										   "c:/dev/emacs/emacs/info"
										   "c:/dev/gnuwin32/info"
										   ))
	   )
	  (t
	   (setq Info-directory-list    '(
									  "/usr/bin/info"
									  "/usr/lib/info"
									  "/usr/share/info"
									  "/usr/share/info/info"
									  "/Applications/Emacs.app/Contents/Resources/info"
									  "/Applications/Emacs.app/Contents/Resources/info/info"
									  "/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS4.0.sdk/usr/lib/info"
									  "/Developer/Platforms/iPhoneOS.platform/Developer/usr/share/info"
									  "/Developer/usr/share/info"
									  ))
	   )
	  )
	 )
  )

;;
;; occur mode
;;
(eval-after-load "occur"
  '(progn
	 (add-hook 'occur-hook
			   '(lambda()
				  (next-error-follow-minor-mode t)))
	 )
  )

(eval-after-load "replace"
  '(progn
     ;; ;; replace+
     ;; ;; http://www.emacswiki.org/emacs/replace%2b.el
     ;; (require 'replace+)
     (setq list-matching-lines-default-context-lines 0)
     ))

(eval-after-load "woman"
  '(progn
     (cond
      (win32p
       (setq woman-manpath '("c:/dev/gnuwin32/man"
			     ;; "c:/dev/graphviz/share/man"
			     )
	     woman-show-log t))
      )))

(eval-after-load "tramp"
  '(progn
	 (require 'tramp)
	 (cond
	  (win32p
	   (setq ange-ftp-ftp-program-name "c:/dev/emacs/emacsw32/gnuwin32/bin/ftp.exe")
	   )
	  )
	 ))

(eval-after-load "dired"
  '(progn
     (define-key dired-mode-map (kbd "C-s") 'dired-isearch-filenames) ;; 'dired-isearch-forward)
     (define-key dired-mode-map (kbd "C-r") 'dired-isearch-backward)
     (define-key dired-mode-map (kbd "ESC C-s") 'dired-isearch-filenames-regexp)
     (define-key dired-mode-map (kbd "ESC C-r") 'dired-isearch-backward-regexp)))

;; activate disabled features
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; move will banish if cursor is over there...
(mouse-avoidance-mode 'banish)


;;
;; joon customized editing feature
(progn
  (global-set-key (kbd "C-c g r") 'rgrep)		; Search Recursively
  (global-set-key (kbd "C-c g l") 'lgrep)		; Search Locally
  (global-set-key (kbd "C-c b r") 'rename-buffer)
  (global-set-key (kbd "C-c e b") 'ediff-buffers)
  (global-set-key (kbd "C-c e r") 'ediff-revision)
  (global-set-key (kbd "C-c m t") '(lambda() (interactive)(move-to-window-line 0)))
  (global-set-key (kbd "C-c m b") '(lambda() (interactive)(move-to-window-line -1)))
  (global-set-key (kbd "<f1>") (lambda  () (interactive) (manual-entry (current-word))))
  (global-set-key (kbd "C-c , l") 'toggle-truncate-lines)
  (global-set-key (kbd "C-c , <RET>") 'server-start)
  )

(provide 'my-editing)
