;; -*- coding:utf-8-auto; -*-

(require 'generic-x) ;; for many files' editing
;; (require 'indent)
;; (require 'misc)

;; my on/off option
(defvar i-use-show-paren-mode t)
(defvar i-display-time-date nil)
(defvar i-use-column-number-mode nil)
(defvar i-use-global-hl-line-mode nil)
(defvar i-use-save-history-mode t)
(defvar i-use-save-place t)
(defvar i-use-ibuffer-mode t)
(defvar i-use-directory-abbrev nil)
(defvar i-use-uniquify t)
(defvar i-use-recentf nil)
(defvar i-use-cua-mode nil)
(defvar i-use-nxhtml-mode nil)
(defvar i-use-popwin t)
(defvar i-use-delsel t)
(defvar i-use-workgroup nil)
(defvar i-use-truncate-line-mode t)
(defvar i-use-desktop nil)
(defvar i-use-yas t)

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
 ;; when pressing 'q' in customize buffer, kill it
 custom-buffer-done-kill t
 ;; 
 make-backup-files nil
 ;; no need double space between sentences
 sentence-end-double-space nil
 ;;
 revert-without-query '("\\.cpp" "\\.h" "\\.m" "\\.hpp" "\\.py" "CMakeLists.txt" "\\.cmake")
 ;;
 completion-ignored-extensions '(".svn/" "CVS/" ".o" "~" ".bin" ".bak" ".obj" ".map" ".ico" ".pif" ".lnk" ".a" ".ln" ".blg" ".bbl" ".dll" ".drv" ".vxd" ".386" ".elc" ".lof" ".glo" ".idx" ".lot" ".dvi" ".fmt" ".tfm" ".pdf" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".fasl" ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo")
 safe-local-variable-values '(
							  (eval rainbow-mode t)
							  (my-org-current-project-name . "orgwiki")
							  )
 )

(progn
  ;; Auto refresh buffers
  (global-auto-revert-mode 1)
  ;; Also auto refresh dired, but be quiet about it
  (setq global-auto-revert-non-file-buffers t
		auto-revert-verbose nil
		)
  ;; Turn off mouse interface early in startup to avoid momentary display
  (if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
  (if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
  (if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
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
    (recentf-mode t)
	(global-set-key (kbd "C-c f r") 'recentf-file)
    ))
(add-hook 'recentf-load-hook
		  (lambda ()
			(setq recentf-max-saved-items 500)
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
   special-display-regexps `(,(regexp-opt '(
											"\\*selection\\*"
											"\\*completions\\*"
											"\\*Completions\\*"
											"\\*Help\\*"
											"\\*shell\\*"
											)))
   ;; special-display-buffer-names '("*cmd shell*" "*compilation*"))
   )
  (setq popwin:special-display-config
		'(("*cscope*" :height 20)
		  ("*shell*" :height 15)
		  ("*Python*" :height 15)
		  ("*Help*")
		  ("*Completions*" :noselect t)
		  ;; ("*compilation*" :noselect t)
		  ;; ("*Occur*" :noselect t)
		  ))
  ;; (push '("*Python*" :height 15) popwin:special-display-config)
  ;; (push '("*shell*" :height 15) popwin:special-display-config)
  ;; (push '("*cscope*" :height 20) popwin:special-display-config)
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

(when i-use-truncate-line-mode
	  (toggle-truncate-lines 1))

(when i-use-desktop
  (desktop-save-mode 1)
  (setq
   desktop-modes-not-to-save (append desktop-modes-not-to-save '(emacs-lisp helm))
   desktop-buffer-mode-handlers (regexp-opt '("\.rcp$"))
   )
  )

(when (and i-use-yas
		   (my-try-require 'yasnippet))
  (setq
   ;; not to use original yas/x-prompt at first
   yas/prompt-functions '(yas/dropdown-prompt yas/completing-prompt)
   ;; my private snippets
   )
  (setq yas/snippet-dirs
  		`(,(concat my-dotfiles-dir "snippets")
  		  ,(concat my-dotfiles-dir "alien/el-get-package/yasnippet/snippets")))
  (yas/global-mode 1)
  )

(eval-after-load "info"
  '(progn
	 (cond
	  (win32p
	   (setq Info-default-directory-list '(
										   "c:/dev/emacs/emacs/info"
										   "c:/dev/gnuwin32/info"
										   ))
	   )
	  )
	 )
  )

(eval-after-load "rainbow-mode"
  '(progn
	 (add-to-list 'rainbow-hexadecimal-colors-font-lock-keywords
				  '("QColor(\s*\\([0-9]\\{1,3\\}\\(?:\s*%\\)?\\)\s*,\s*\\([0-9]\\{1,3\\}\\(?:\s*%\\)?\\)\s*,\s*\\([0-9]\\{1,3\\}\\(?:\s*%\\)?\\)\s*)" (0 (rainbow-colorize-rgb))))
	 )
  )

;;
;; replace/occur
;; 
(eval-after-load "replace"
  '(progn
     (setq list-matching-lines-default-context-lines 0)
	 (add-hook 'occur-hook
			   '(lambda()
				  (next-error-follow-minor-mode t)))
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

(eval-after-load "man"
  '(progn
	 (setq Man-width 80)))

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

(eval-after-load "ace-jump-mode"
  '(progn
	 ;; (define-key global-map (kbd "C-c C-SPC") 'ace-jump-mode)
	 ;; (define-key global-map (kbd "C-=") 'ace-jump-mode)
	 (define-key global-map (kbd "C-'") 'ace-jump-mode)
	 (define-key global-map (kbd "M-g l") 'ace-jump-line-mode)
	 )
  )

;; mark-more-like-this : "mark-multiple" package.
;; from https://github.com/magnars/mark-multiple.el
(when (my-try-require 'inline-string-rectangle)
  (global-set-key (kbd "C-x r t") 'inline-string-rectangle)
  )
;; (when (my-try-require 'mark-more-like-this)
;;   (global-set-key (kbd "C-<") 'mark-previous-like-this)
;;   (global-set-key (kbd "C->") 'mark-next-like-this)
;;   ;; like the other two, but takes an argument (negative is previous)
;;   (global-set-key (kbd "C-M-m") 'mark-more-like-this) 
;;   (global-set-key (kbd "C-*") 'mark-all-like-this)
;;   )
(when (my-try-require 'multiple-cursors)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<return>") 'mc/edit-lines)
  (global-set-key (kbd "C-c C-;") 'mc/mark-all-like-this)
  )

(when (my-try-require 'rename-sgml-tag)
  (eval-after-load "sgml-mode"
	'(progn
	   (define-key sgml-mode-map (kbd "C-c C-r") 'rename-sgml-tag)
	   ))
  )
(when (my-try-require 'js2-rename-var)
  (define-key js2-mode-map (kbd "C-c C-r") 'js2-rename-var)
  )

;; expand-region
(when (my-try-require 'expand-region)
  (global-set-key (kbd "C-M-SPC") 'er/expand-region)
  )
;; (when (my-try-require 'expand-region-core)
;;   ;; hack original code
;;   (defun er/mark-outside-pairs ()
;; 	"Mark pairs (as defined by the mode), including the pair chars."
;; 	(interactive)
;; 	(cond
;; 	 ((looking-at "[ ]*[({]")
;; 	  ;; do nothing ?!
;; 	  t)
;; 	 ((looking-back "\\s)+\\=")
;; 	  (ignore-errors (backward-list 1)))
;; 	 (t
;;       (skip-chars-forward er--space-str))
;; 	 )
;; 	(when (and (er--point-inside-pairs-p)
;; 			   (or (not (er--looking-at-pair))
;; 				   (er--looking-at-marked-pair)))
;; 	  (goto-char (nth 1 (syntax-ppss))))
;; 	(when (er--looking-at-pair)
;; 	  (set-mark (point))
;; 	  (forward-list)
;; 	  (exchange-point-and-mark)))
;;   )

(when (my-try-require 'miniedit)
  (miniedit-install)
  )

(when (my-try-require 'iedit)
  )

(when (my-try-require 'undo-tree)
  (global-undo-tree-mode 1)
  )

(when (my-try-require 'iflipb)
  ;; wrap is better?! trying..
  (setq iflipb-wrap-around t)
  ;; auto off function iflipb'ing
  (setq my-iflipb-auto-off-timeout-sec 1)
  (setq my-iflipb-auto-off-timer-canceler-internal nil)
  (setq my-iflipb-ing-internal nil)
  (defun my-iflipb-auto-off ()
	(message nil)
	(setq my-iflipb-auto-off-timer-canceler-internal nil
		  my-iflipb-ing-internal nil)
	)
  (defun my-iflipb-next-buffer (arg)
	(interactive "P")
	(iflipb-next-buffer arg)
	(if my-iflipb-auto-off-timer-canceler-internal
		(cancel-timer my-iflipb-auto-off-timer-canceler-internal))
	(run-with-idle-timer my-iflipb-auto-off-timeout-sec 0 'my-iflipb-auto-off)
	(setq my-iflipb-ing-internal t)
	)
  (defun my-iflipb-previous-buffer ()
	(interactive)
	(iflipb-previous-buffer)
	(if my-iflipb-auto-off-timer-canceler-internal
		(cancel-timer my-iflipb-auto-off-timer-canceler-internal))
	(run-with-idle-timer my-iflipb-auto-off-timeout-sec 0 'my-iflipb-auto-off)
	(setq my-iflipb-ing-internal t)
	)
  (global-set-key (kbd "<C-tab>") 'my-iflipb-next-buffer)
  (global-set-key (kbd "<C-S-tab>") 'my-iflipb-previous-buffer)
  (defun iflipb-first-iflipb-buffer-switch-command ()
	"Determines whether this is the first invocation of
iflipb-next-buffer or iflipb-previous-buffer this round."
	(not (and (or (eq last-command 'my-iflipb-next-buffer)
				  (eq last-command 'my-iflipb-previous-buffer))
			  my-iflipb-ing-internal)))
  )

(when (my-try-require 'warp)
  (global-set-key (kbd "C-c C-w C-w") 'warp-mode) ;; Modify key bind as you want.
  (setq warp-server-command "warp"
		warp-node-js-program "c:/program files/nodejs/node.exe"
		warp-server-command-args '("c:/Users/jhlee/elisp/alien/el-get-package/warp/warp"))
  ;; Set markdown converter (if you want)
  (add-to-list 'warp-format-converter-alist
			   '("\\.md\\|\\.markdown" t (lambda ()
										   ;; Set command you are using
										   '("markdown"))))

  ;; Below line is needed if you installed websocket npm module globally.
  (setenv "NODE_PATH" "c:/Program Files/nodejs/node_modules/websocket")
  ;; ;; or, if you have setup NODE_PATH in the shell
  ;; (setenv "NODE_PATH"
  ;; 		  (replace-regexp-in-string
  ;; 		   "\n+$" "" (shell-command-to-string "echo $NODE_PATH")))
  )

(if win32p
	(when (my-try-require 'everything)
	  (setq everything-port 18000)
	  )
  )
;; activate disabled features
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)

;; move will banish if cursor is over there...
(mouse-avoidance-mode 'banish)

;; sometimes... some mode(ie. *Help*) display shows ^M
;; http://stackoverflow.com/questions/730751/hiding-m-in-emacs
(defun my-remove-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(add-hook 'help-mode-hook 'my-remove-dos-eol)

;; http://stackoverflow.com/questions/251908/how-can-i-insert-current-date-and-time-into-a-file-using-emacs
;; insert date and time
(defvar my-current-date-time-format "%Y/%m/%d-%H:%M:%S" ;; "%a %b %d %H:%M:%S %Z %Y" "%a %b %d %H:%M:%S %Z %Y"
  "Format of date to insert with `my-insert-current-date-time' func
See help of `format-time-string' for possible replacements")
(defvar my-current-time-format "%a %H:%M:%S"
  "Format of date to insert with `my-insert-current-time' func.
Note the weekly scope of the command's precision.")
(defun my-insert-current-date-time ()
  "insert the current date and time into current buffer.
Uses `my-current-date-time-format' for the formatting the date/time."
  (interactive)
  ;; (insert "==========\n")
  ;; (insert (let () (comment-start)))
  (insert (format-time-string my-current-date-time-format (current-time)))
  ;; (insert "\n")
  )
(defun my-insert-current-time ()
  "insert the current time (1-week scope) into the current buffer."
  (interactive)
  (insert (format-time-string my-current-time-format (current-time)))
  (insert "\n")
  )
(global-set-key (kbd "C-c i t") 'my-insert-current-date-time)

;; hint from http://emacs.wordpress.com/2007/01/16/quick-and-dirty-code-folding/
(defun my-toggle-selective-display ()
  (interactive)
  (set-selective-display (if selective-display nil 1)))
(global-set-key [f1] 'my-toggle-selective-display)

;; make it damm hard key for hideshow easy
(eval-after-load "hideshow"
  '(progn
	 (global-set-key (kbd "M-<left>") 'hs-hide-block)
	 (global-set-key (kbd "M-<right>") 'hs-show-block)
	 (global-set-key (kbd "M-S-<left>") 'hs-hide-all)
	 (global-set-key (kbd "M-S-<right>") 'hs-show-all)
	 )
  )

;; hint from http://whattheemacsd.com//key-bindings.el-03.html
;; 눌러보면 알게될 한줄합치기.
(global-set-key (kbd "M-]") (lambda () (interactive) (join-line -1)))
(global-set-key (kbd "M-[") 'join-line)
;; Move more quickly
(global-set-key (kbd "C-S-n") (lambda () (interactive) (ignore-errors (next-line 5))))
(global-set-key (kbd "C-S-p") (lambda () (interactive) (ignore-errors (previous-line 5)))) 
(global-set-key (kbd "C-S-f") (lambda () (interactive) (ignore-errors (forward-char 5))))
(global-set-key (kbd "C-S-b") (lambda () (interactive) (ignore-errors (backward-char 5))))

;;
;; joon customized editing feature
;; 
(progn
  (global-set-key (kbd "C-c r b") 'rename-buffer)
  (global-set-key (kbd "C-c e b") 'ediff-buffers)
  (global-set-key (kbd "C-c e r") 'ediff-revision)
  (global-set-key (kbd "C-c m t") '(lambda() (interactive)(move-to-window-line 0)))
  (global-set-key (kbd "C-c m b") '(lambda() (interactive)(move-to-window-line -1)))
  (global-set-key (kbd "<f1>") (lambda  () (interactive) (manual-entry (current-word))))
  (global-set-key (kbd "C-c t l") 'toggle-truncate-lines)
  (global-set-key (kbd "C-c s <RET>") 'server-start)
  (global-set-key (kbd "C-c f f") 'font-lock-fontify-buffer)
  (global-set-key (kbd "C-c r r") 'revert-buffer)
  )

(provide 'my-editing)
