(require 'anything)
(require 'anything-config)
(require 'anything-match-plugin)

;; display function mod
(cond
 ((featurep 'popwin)
  (setq anything-same-window nil)
  (push '("\\*[aA]nything.*\\*":regexp t :height 20) popwin:special-display-config)
  (add-to-list 'special-display-regexps "\\*anything.*\\*")
  (setq anything-display-function 'popwin:display-buffer)
  (add-hook 'popwin:after-popup-hook
			(lambda ()
			  ;; (message (concat "popwin hook : buffer:" (buffer-name)))
			  (if (search "colors" (buffer-name))
				  (text-scale-decrease 1))))
  )
 (t
  (defun my-anything-default-display-buffer (buf)
	(funcall (if anything-samewindow 'switch-to-buffer 'pop-to-buffer) buf)
	(if (string-equal buf "*anything colors*")
		(with-current-buffer buf
		  (setq truncate-lines nil)
		  (text-scale-decrease 1)
		  ;; (buffer-face-mode t)
		  ;; (setq buffer-face-mode-face 'my-anything-color-default-face)
		  ))
	buf
	)
  (setq anything-display-function 'my-anything-default-display-buffer)
  )
 )

(cond
 ((featurep 'anything-ack)
  (define-key anything-command-map (kbd "k") 'anything-ack)
  (cond
   (win32p
  	(setq anything-ack-command "ack.pl --no-group --no-color -i ")))
  ))

(setq
 anything-command-map-prefix-key (kbd "C-c a")
 anything-candidate-number-limit nil
 anything-c-locate-command (case system-type
							 ('gnu/linux "locate -i -r %s")
							 ('berkeley-unix "locate -i %s")
							 ('windows-nt "es -s -p -r %s")
							 (t "locate %s"))
 ;; Color
 anything-c-source-colors '((name . "Colors")
							(init . (lambda () (unless (anything-candidate-buffer)
												 (save-window-excursion (list-colors-display))
												 (anything-candidate-buffer (get-buffer "*Colors*")))))
							(candidates-in-buffer)
							(get-line . buffer-substring)
							(action
							 ("Insert RGB" . (lambda (candidate)
											   (with-current-buffer anything-current-buffer
												 (insert (anything-c-colors-get-rgb candidate)))))
							 ("Insert Name" . (lambda (candidate)
												(with-current-buffer anything-current-buffer
												  (insert (anything-c-colors-get-name candidate)))))
							 ("Copy Name" . (lambda (candidate)
											  (kill-new (anything-c-colors-get-name candidate))))
							 ("Copy RGB" . (lambda (candidate)
											 (kill-new (anything-c-colors-get-rgb candidate))))     
							 ))
 )
(cond
 (macp
  (setq anything-sources
		'(
		  ;; anything-c-source-buffers
		  ;; anything-c-source-buffer-not-found
		  anything-c-source-recentf
		  anything-c-source-file-name-history
		  anything-c-source-files-in-all-dired
		  anything-c-source-filelist
		  ;; anything-c-source-info-pages
		  ;; anything-c-source-info-elisp
		  anything-c-source-emacs-commands
		  ;; anything-cscope-db-directory
		  ;; anything-c-source-cscope-c-cymbol
		  ;; anything-c-source-cscope-global-definition
		  ;; anything-c-source-cscope-called-function
		  ;; anything-c-source-cscope-calling-this-function
		  ;; anything-c-source-cscope-text-string
		  )))
 (t
  (setq
   anything-sources '(anything-c-source-everything
					  anything-c-source-files-in-all-dired
					  anything-c-source-filelist
					  ;; anything-c-source-buffers
					  ;; anything-c-source-buffer-not-found
					  anything-c-source-recentf
					  anything-c-source-file-name-history
					  ;; anything-c-source-info-pages
					  ;; anything-c-source-info-elisp
					  anything-c-source-emacs-commands
					  ;; anything-cscope-db-directory
					  ;; anything-c-source-cscope-c-cymbol
					  ;; anything-c-source-cscope-global-definition
					  ;; anything-c-source-cscope-called-function
					  ;; anything-c-source-cscope-calling-this-function
					  ;; anything-c-source-cscope-text-string
					  )
   ;;
   ;; top for windows : sysinternals' pslist.exe
   ;;
   anything-c-top-command "pslist"
   )
  ))
(define-key anything-command-map (kbd "<RET>") 'anything)
(define-key anything-command-map (kbd "C-l") 'anything-filelist)
(global-set-key (read-kbd-macro anything-command-map-prefix-key)
				'anything-command-map)
(global-set-key (kbd "C-c C-x C-d") 'anything-debug-output)

;; ;; [2008/01/14]
;; ;; (auto-install-from-emacswiki "anything-dabbrev-expand.el")
;; (require 'anything-dabbrev-expand)
;; (define-key anything-command-map (kbd "/") 'anything-dabbrev-expand)
;; (define-key anything-dabbrev-map [(control ?@)] 'anything-dabbrev-find-all-buffers)
;; (setq anything-dabbrev-input-idle-delay 0.0)
;; (setq anything-dabbrev-idle-delay 1.0)
;; (setq anything-dabbrev-expand-candidate-number-limit 20)
;; (setq anything-dabbrev-expand-strategies
;;       '(;; anything-dabbrev-expand--first-partial-dabbrev
;;         anything-dabbrev-expand--anything))
;; (setq anything-dabbrev-sources
;;       '(anything-dabbrev-partial-source
;;         ;; anything-c-source-complete-emacs-commands
;;         ;; anything-c-source-complete-emacs-functions
;;         ;; anything-c-source-complete-emacs-variables
;;         ;; anything-c-source-complete-emacs-other-symbols
;;         anything-dabbrev-all-source))

;;
;; anything grep
;;
(setq anything-grep-candidates-fast-directory-regexp ".*")
(setq anything-c-source-filelist
	  '((name . "FileList")
		(grep-candidates . anything-c-filelist-file-name)
		(candidate-number-limit . 200)
		(requires-pattern . 3)
		(type . file)))

;;
;; my anything files
;;
(setq anything-for-files-prefered-list
	  '(
		;; anything-c-source-eproject-files
		;; anything-c-source-eproject-projects
		anything-c-source-ffap-line
		anything-c-source-ffap-guesser
		anything-c-source-files-in-current-dir+
		;; anything-c-source-buffers+
		anything-c-source-recentf
		;; anything-c-source-filelist
		;; anything-c-source-bookmarks
		;; anything-c-source-file-cache
		;; anything-c-source-locate
		))

;;
;; old hack for 'everything' in windows
;;
(defun anything-c-locate-init ()
  "Initialize async locate process for `anything-c-source-locate'."
  (setq mode-line-format
        '(" " mode-line-buffer-identification " "
          (line-number-mode "%l") " "
          (:eval (propertize "(Locate Process Running) "
                  'face '((:foreground "red"))))))
  (prog1
      (start-process-shell-command "locate-process" nil
                                   (format anything-c-locate-command
                                           anything-pattern))
    (set-process-sentinel (get-process "locate-process")
                          #'(lambda (process event)
                              (when (string= event "finished\n")
                                (kill-local-variable 'mode-line-format)
                                (with-anything-window
                                  (anything-update-move-first-line)))))))


;; (start-process-shell-command "project-root-find"
;; 							 "*testproc*"
;; 							 "gfind"
;; 							 "d:/prj/wp/sis/trunk/src"
;; 							 "-iname *.cpp")
(setq anything-c-filelist-file-name "d:/prj/wp/sis/trunk/cscope.files.anything.filelist")
;; (put 'anything-c-filelist-file-name 'disabled nil)
;; (setq anything-c-filelist-file-name "")

(add-to-list 'anything-after-initialize-hook 'my-disable-truncate-line)

(defvar anything-c-everything-preferred-directory
  nil)

(defun my-anything-cc-mode-hook ()
  (make-local-variable 'anything-c-everything-preferred-directory))

(add-hook 'c-mode-hook 'my-anything-cc-mode-hook)
(add-hook 'c++-mode-hook 'my-anything-cc-mode-hook)

(defvar last-anything-c-everything-pattern nil)

(defun anything-c-source-everything-process ()
  (let* ((my/dir (buffer-local-value 'anything-c-everything-preferred-directory anything-current-buffer))
		 (my/pattern (if (stringp my/dir)
					  (concat (regexp-quote my/dir) ".*" anything-pattern)
					anything-pattern)))
	(setq last-anything-c-everything-pattern my/pattern)
	(apply 'start-process "everything-process" nil
		   (append anything-c-everything-options
				   (list my/pattern)))))
  
(defvar anything-c-source-everything
	  '((name . "Everything")
		(candidates . anything-c-source-everything-process)
		(type . file)
		(requires-pattern . 3)
		(delayed))
  "Source for retrieving files matching the current input pattern with locate.")

(defun my-anything-customize-face ()
  (interactive)
  (anything 'anything-c-source-customize-face))

;; (defun my-anything-c-source-ctags ()
;;   (interactive)
;;   (anything 'anything-c-source-ctags))

;; (defun everything-search(everything-pattern)
;;   (with-temp-buffer
;; 	(apply 'start-process "everything" temp-buffer
;; 	   (append anything-c-everything-options (list everything-pattern)))
;; (apply 'start-process )

;; (progn
;;   (apply 'start-process "everything-process" (get-buffer-create "*everything*")
;; 		 (append anything-c-everything-options (list anything-pattern)))
;;   (with-current-buffer "*everything*"
;; 	(goto-char (point-min))
;; 	(search-forward-regexp "^\\(.*\\)$" (point) t)
;; 	(match-beginning "\\1")

;; (defun my-anything-show-in-new-frame (buf)
;;   (let* ((my-anything-frame
;; 		  (window-frame 
;; 		   (special-display-popup-frame
;; 			(current-buffer)
;; 			'((top . 1)
;; 			  (left . 120)
;; 			  (width . 140)
;; 			  (height . 64)
;; 			  (font . "Monaco-10"))))))
;; 	(anything-maybe-fit-frame)
;; 	(select-frame-set-input-focus my-anything-frame)))


;; (unless macp
;;   (progn
;; 	(setq anything-display-function 'my-anything-show-in-new-frame)
;; 	(setq anything-save-configuration-functions '(set-frame-configuration . current-frame-configuration))))

;; (if my-anything-show-dedicate-frame
;; 	(progn
;; 	  (setq anything-display-function 'my-anything-show-in-new-frame)
;; 	  (setq anything-save-configuration-functions '(set-frame-configuration . current-frame-configuration)))
;;   (progn
;; 	(setq anything-samewindow nil)
;; 	(push '("*anything*" :height 40) popwin:special-display-config)))

(provide 'my-anything)
