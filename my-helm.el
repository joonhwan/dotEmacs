;; -*- coding:utf-8 -*-

(helm-mode 1)

(setq helm-c-top-command
	  (cond
	   (macp "top -ncols %s -n 1")
	   (t helm-c-top-command)))

(setq helm-c-locate-command 
	  (case system-type
		('gnu/linux "locate -i -r %s")
		('berkeley-unix "locate -i %s")
		('windows-nt "es -s -p -r %s")
		('darwin "mdfind -name %s")
		(t "locate %s"))
	  )

(defvar helm-c-source-emacs-variables
  '((name . "Emacs Variables")
    (candidates . (lambda ()
                    (sort (all-completions "" obarray 'boundp) 'string-lessp)))
    (type . variable)
    (requires-pattern . 2))
  "Source for completing Emacs variables.")

(defvar helm-c-source-emacs-functions
  '((name . "Emacs Functions")
    (candidates . (lambda ()
                    (let (commands)
                      (mapatoms (lambda (a)
                                  (if (functionp a)
                                      (push (symbol-name a) commands))))
                      (sort commands 'string-lessp))))
    (type . function)
    (requires-pattern . 2))
  "Source for completing Emacs functions.")

(defun eproject-file-list ()
  (let ((files '()))
	(mapcar 
	 (lambda (elem)
	   (add-to-list 'files (concat prj-directory (car elem)) t))
	 prj-files)
	files)
  )

(setq helm-c-source-eproject-files
	  `((name . "eproject files")
	  	(init . (lambda () (require 'eproject)))
	  	(candidates . (lambda () (eproject-file-list)))
	  	(kpeymap . ,helm-generic-files-map)
	  	(help-message . helm-generic-file-help-message)
	  	(mode-line . helm-generic-file-mode-line-string)
		(candidate-number-limit . 20)
	  	;; (candidate-transformer helm-c-highlight-files)
	  	(type . file)
	  	(requires-pattern . 0)
	  	))
	  ;; `((name . "eproject files")
	  ;; 	(candidates . (lambda ()
	  ;; 					(with-helm-current-buffer
	  ;; 					  (directory-files (helm-c-current-directory) t))))
	  ;; 	(keymap . ,helm-generic-files-map)
	  ;; 	(help-message . helm-generic-file-help-message)
	  ;; 	(mode-line . helm-generic-file-mode-line-string)
	  ;; 	(candidate-transformer helm-c-highlight-files)
	  ;; 	(type . file)))

(defun my-helm-c-source-eproject-files ()
  (interactive)
  (helm-other-buffer '(helm-c-source-eproject-files) "*helm for eproject*"))

(defun my-helm-c-ctags ()
  (interactive)
  (helm-other-buffer '(helm-c-source-ctags) "*helm for ctags*"))

;; (setq helm-for-files-prefered-list
;;   '(helm-c-source-ffap-line
;;     helm-c-source-ffap-guesser
;;     helm-c-source-buffers-list
;;     helm-c-source-recentf
;;     helm-c-source-bookmarks
;;     helm-c-source-file-cache
;;     helm-c-source-files-in-current-dir
;;     helm-c-source-locate))
(add-to-list 'helm-for-files-prefered-list 'helm-c-source-eproject-files t)


;; variable first and function last
(defun my-helm-for-help-variable ()
  (interactive)
  (helm
   :sources '(helm-c-source-emacs-variables helm-c-source-emacs-functions)
   :input (let (
				(my-hint (thing-at-point 'symbol))
				(my-input "")
				)
			(setq my-input (concat
							;;"\b"
							my-hint
							;; "\b"
							(if (featurep 'helm-match-plugin)
								(if my-hint
									" "
								  "")
							  ""
							  )
							))
			my-input)
   :buffer "*Helm Help(func/var)*"
   )
  )

;; function first and variable last
(defun my-helm-for-help-function ()
  (interactive)
  (helm
   :sources '(helm-c-source-emacs-functions helm-c-source-emacs-variables)
   :input (let (
				(my-hint (thing-at-point 'symbol))
				(my-input "")
				)
			(setq my-input (concat
							;;"\b"
							my-hint
							;; "\b"
							(if (featurep 'helm-match-plugin)
								(if my-hint
									" "
								  "")
							  ""
							  )
							))
			my-input)
   :buffer "*Helm Help(func/var)*"
   )
  )

(progn
  (define-key helm-command-map (kbd "<RET>") 'helm-mini)
  ;; (define-key helm-command-map (kbd "C-l") 'helm-filelist)
  (define-key helm-command-map (kbd "h v") 'my-helm-for-help-variable)
  (define-key helm-command-map (kbd "h f") 'my-helm-for-help-function)
  (define-key helm-command-map (kbd "j") 'my-helm-c-source-eproject-files)
  (global-set-key (kbd "C-c a") helm-command-map)
  )

(provide 'my-helm)
