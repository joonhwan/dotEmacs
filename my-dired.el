(require 'dired)
(require 'dired-x)
(require 'wdired)
(require 'find-lisp)

(when (my-try-require 'dired+)
  (toggle-diredp-find-file-reuse-dir 1)
  )

(when (featurep 'magit)
  ;; magit 에서 dired-jump 를 하고 싶다.
  (defun my-magit-dired-jump-action-hook()
	(dired-jump)
	t)
  (setq magit-dired-jump-action-hook nil)
  (add-hook 'magit-dired-jump-action-hook 'my-magit-dired-jump-action-hook)
  )

;;
;; benrina wdired in normal dired mode
;;
(define-key dired-mode-map "r" 'wdired-change-to-wdired-mode)

;;
;; ls-lisp emulation setting
;;
(cond
 (win32p
  (progn
	(require 'ls-lisp)
	(setq dired-listing-switches "-alh"
		  ;; ls-lisp-use-insert-directory-program nil
		  ls-lisp-verbosity '('links 'uid)
		  ls-lisp-ignore-case nil
		  ls-lisp-use-localized-time-format t
		  ls-lisp-format-time-list '("%y/%m/%d %H:%M" "%y/%m/%d %H:%M")
		  ls-lisp-dirs-first t
		  )
	(setq ls-lisp-emulation (quote MS-Windows))
	(ls-lisp-set-options) ;; special functionupdating parameters for ls-lisp
	))
 (macp
  (message "macp")
  (setq
   ls-lisp-use-insert-directory-program nil
   ls-lisp-emulation 'MacOS
   ls-lisp-use-localized-time-format t
   ls-lisp-format-time-list '("%y/%m/%d %H:%M" "%y/%m/%d %H:%M")
   ls-lisp-dirs-first t
   )
  (require 'ls-lisp)
  ))

(setq my-omit-extension '(".svn/" "CVS/" ".o" "~" ".bin" ".bak" ".obj" ".map" ".ico" ".pif" ".lnk" ".a" ".ln" ".blg" ".bbl" ".dll" ".drv" ".vxd" ".386" ".elc" ".lof" ".glo" ".idx" ".lot" ".dvi" ".fmt" ".tfm" ".pdf" ".class" ".fas" ".lib" ".mem" ".x86f" ".sparcf" ".fasl" ".ufsl" ".fsl" ".dxl" ".pfsl" ".dfsl" ".lo" ".la" ".gmo" ".mo" ".toc" ".aux" ".cp" ".fn" ".ky" ".pg" ".tp" ".vr" ".cps" ".fns" ".kys" ".pgs" ".tps" ".vrs" ".pyc" ".pyo" ".idx" ".lof" ".lot" ".glo" ".blg" ".bbl" ".cp" ".cps" ".fn" ".fns" ".ky" ".kys" ".pg" ".pgs" ".tp" ".tps" ".vr" ".vrs"))

;;
;; hack find-lisp-dired
;;
;; (defun my-find-lisp-format (file-name file-attr switches now)
;;   (let ((file-type (nth 0 file-attr)))
;;     (concat (if (memq ?i switches)	; inode number
;; 		(format "%6d " (nth 10 file-attr)))
;; 	    ;; nil is treated like "" in concat
;; 	    (if (memq ?s switches)	; size in K
;; 		(format "%4d " (1+ (/ (nth 7 file-attr) 1024))))
;; 	    (nth 8 file-attr)		; permission bits
;; 	    (format " %3d %-8s %-8s %8d "
;; 		    (nth 1 file-attr)	; no. of links
;; 		    (if (numberp (nth 2 file-attr))
;; 			(int-to-string (nth 2 file-attr))
;; 		      (nth 2 file-attr)) ; uid
;; 		    (if (eq system-type 'ms-dos)
;; 			"root"		; everything is root on MSDOS.
;; 		      (if (numberp (nth 3 file-attr))
;; 			  (int-to-string (nth 3 file-attr))
;; 			(nth 3 file-attr))) ; gid
;; 		    (nth 7 file-attr)	; size in bytes
;; 		    )
;; 	    (find-lisp-format-time file-attr switches now)
;; 	    " "
;; 	    file-name
;; 	    (if (stringp file-type)	; is a symbolic link
;; 		(concat " -> " file-type)
;; 	      "")
;; 	    "\n")))
;; (if (functionp 'find-lisp-format)
;; 	(fset 'find-lisp-format 'my-find-lisp-format))
;; ;; (defun my-find-lisp-format-time (file-attr switches now)
;; ;;   ;; Format time string for file with attributes FILE-ATTR according
;; ;;   ;; to SWITCHES (a list of ls option letters of which c and u are recognized).
;; ;;   ;; Use the same method as `ls' to decide whether to show time-of-day or year,
;; ;;   ;; depending on distance between file date and NOW.
;; ;;   (let* ((time (nth (find-lisp-time-index switches) file-attr))
;; ;; 	 (diff16 (- (car time) (car now)))
;; ;; 	 (diff (+ (ash diff16 16) (- (car (cdr time)) (car (cdr now)))))
;; ;; 	 (past-cutoff (- (* 6 30 24 60 60)))	; 6 30-day months
;; ;; 	 (future-cutoff (* 60 60)))		; 1 hour
;; ;;     (format-time-string
;; ;;      "%Y/%_2m/%e %2H:%2M
;; ;;      time)))))
;; ;; (if (functionp 'find-lisp-format-time)
;; ;; 	(fset 'find-lisp-format-time 'my-find-lisp-format-time))

;; 
;; dired setting
;;
(setq dired-dwim-target t)
(if win32p
	(defun my-open-in-total-cmd (dir-to-open)
	  "open window in total command"
	  (interactive "DDir: ")
	  (let ((w32file (substitute ?\\ ?/ (expand-file-name dir-to-open))))
		(if (file-directory-p w32file)
			(shell-command (concat "c:/dev/totalcmd/totalcmd -O -L=\"" w32file "\""))))))

;; great hint from
;; http://whattheemacsd.com//setup-dired.el-02.html
(defun dired-back-to-top ()
  (interactive)
  (beginning-of-buffer)
  (dired-next-line 4))

(define-key dired-mode-map
  (vector 'remap 'beginning-of-buffer) 'dired-back-to-top)

(defun dired-jump-to-bottom ()
  (interactive)
  (end-of-buffer)
  (dired-next-line -1))

(define-key dired-mode-map
  (vector 'remap 'end-of-buffer) 'dired-jump-to-bottom)
;; http://whattheemacsd.com//setup-dired.el-02.html

;;
;; dired-x setting
;;
(dired-omit-mode nil)
(setq
 dired-omit-files (concat dired-omit-files "\\|\\.DS_Store$\\|\\.git$")
 ;; several exceptional extension that i wanna see.
 dired-omit-extensions (remove-if
						#'(lambda (elem)
							(or
							 (string-equal elem ".lib")
							 (string-equal elem ".dll")
							 nil)
							)
						dired-omit-extensions)
 )

;; from hint http://whattheemacsd.com/setup-dired.el-01.html
;; Make dired less verbose
(require 'dired-details)
(setq-default dired-details-hidden-string "--- ")
(dired-details-install)

;; override
;; (define-key dired-mode-map [(meta return)] 'my-open-in-total-cmd)

(defun my-dired-mode-hook ()
  ;; (dired-omit-mode 1)
  (subword-mode 1)
  )

(add-hook 'dired-mode-hook 'my-dired-mode-hook)

(provide 'my-dired)

