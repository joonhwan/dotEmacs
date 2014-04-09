;; -*- coding:utf-8 -*-
(helm-mode 1)

(cond
 (macp
  ;; 문제가 있다.
  (setq helm-top-command "-ncols %s -F -R -u")
  ;; hint from
  ;; https://github.com/emacs-helm/helm/commit/e6d0634c41eeeb2219d15baf0dfd4758ef16b221
  (add-to-list 'helm-completing-read-handlers-alist '(tmm-menubar . nil) t)
  )
 (win32p
  (setq helm-grep-default-command "perl.exe c:/dev/utility/ack.pl -Hn --no-group --no-color %e %p %f"
		helm-grep-default-recurse-command "perl.exe c:/dev/utility/ack.pl -H --no-group --no-color %e %p %f")
  ;; override original
  (defun* helm-grep-use-ack-p (&key where)
	(case where
	  (default (string= (helm-grep-command) "perl.exe"))
	  (recursive (string= (helm-grep-command t) "perl.exe"))
	  (strict (and (string= (helm-grep-command t) "perl.exe")
				   (string= (helm-grep-command) "perl.exe")))
	  (t (and (not (string= (helm-grep-command) "git-grep"))
			  (or (string= (helm-grep-command) "perl.exe")
				  (string= (helm-grep-command t) "perl.exe"))))))
  )
 )

(when (my-try-require 'helm-swoop)
  (define-key helm-command-map (kbd ".") 'helm-swoop)
  (define-key helm-swoop-map (kbd "C-.") 'helm-multi-swoop-all-from-helm-swoop)
  ;; (define-key helm-command-map (kbd ".") 'helm-multi-swoop-all)
  (define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
  (define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
  )
  
(when macp
  (setq helm-locate-command "mdfind -name %s %s")
  )

(setq
 helm-grep-default-command "perl.exe -Hn --no-group --no-color %e %p %f"
 helm-grep-default-recurse-command "perl.exe -H --no-group --no-color %e %p %f"
 )

;; Source for completing Emacs variables.
(setq helm-source-emacs-variables
  '((name . "Emacs Variables")
    (candidates . (lambda ()
                    (sort (all-completions "" obarray 'boundp) 'string-lessp)))
    (type . variable)
    (requires-pattern . 2)))

;; 원본의 helm-for-files-preferred-list 설정
(when (featurep 'projectile)
  (setq my-helm-source-projectile-files-list
	`((name . "Projectile Files")
	  (init . (lambda ()
				(let ((projectile-require-project-root nil))
				  (helm-projectile-init-buffer-with-files (projectile-project-root)
														  (projectile-current-project-files))
				  )
				)
			)
	  (coerce . helm-projectile-coerce-file)
	  (candidates-in-buffer)
	  (keymap . ,helm-generic-files-map)
	  (help-message . helm-find-file-help-message)
	  (mode-line . helm-ff-mode-line-string)
	  (type . file)))
  (setq helm-for-files-preferred-list 
		'(
		  ;; helm-source-ffap-guesser ;; 이거 있으면 좋을 텐데 동작이 원하는대로 안됨
		  ;; helm-source-ffap-line ;; 이거또 없앴네... 헐
		  helm-source-recentf
		  helm-source-files-in-current-dir
		  my-helm-source-projectile-files-list
		  helm-source-files-in-all-dired
		  ;; helm-source-buffers-list
		  helm-source-bookmarks
		  helm-source-file-cache
		  ;; helm-source-locate
		  ))
  )

;; Source for completing Emacs functions.
(setq helm-source-emacs-functions
  '((name . "Emacs Functions")
    (candidates . (lambda ()
                    (let (commands)
                      (mapatoms (lambda (a)
                                  (if (functionp a)
                                      (push (symbol-name a) commands))))
                      (sort commands 'string-lessp))))
    (type . variable)
    (requires-pattern . 2)))

(defun eproject-file-list ()
  (let ((files '()))
	(mapcar 
	 (lambda (elem)
	   (add-to-list 'files (concat prj-directory (car elem)) t))
	 prj-files)
	files)
  )


;; 이거 아직 좀 느리다.
;; (when (and (featurep 'projectile)
;; 		   (my-try-require 'helm-projectile))
;;   ;; helm-projectile 이 있으면, 
;;   (add-to-list 'helm-for-files-preferred-list 'helm-source-projectile-files-list t)
;;   )

(when (featurep 'eproject)
  (setq helm-source-eproject-files
		`((name . "eproject files")
		  (init . (lambda () (require 'eproject)))
		  (candidates . (lambda () (eproject-file-list)))
		  (kpeymap . ,helm-generic-files-map)
		  (help-message . helm-generic-file-help-message)
		  (mode-line . helm-generic-file-mode-line-string)
		  (candidate-number-limit . 20)
		  ;; (candidate-transformer helm-highlight-files)
		  (type . file)
		  (requires-pattern . 0)
		  ))
  ;; `((name . "eproject files")
  ;; 	(candidates . (lambda ()
  ;; 					(with-helm-current-buffer
  ;; 					  (directory-files (helm-current-directory) t))))
  ;; 	(keymap . ,helm-generic-files-map)
  ;; 	(help-message . helm-generic-file-help-message)
  ;; 	(mode-line . helm-generic-file-mode-line-string)
  ;; 	(candidate-transformer helm-highlight-files)
  ;; 	(type . file)))

  (defun my-helm-source-eproject-files ()
	(interactive)
	(helm-other-buffer '(helm-source-eproject-files) "*helm for eproject*"))

  (defun my-helm-ctags ()
	(interactive)
	(helm-other-buffer '(helm-source-ctags) "*helm for ctags*"))

  (add-to-list 'helm-for-files-preferred-list 'helm-source-eproject-files t)
  )

(when (featurep 'projectile)
  (require 'helm-projectile))

;; variable first and function last
(defun my-helm-help-variable-or-function ()
  "Preconfigured helm to describe commands, functions, variables and faces."
  (interactive)
  (let ((default (thing-at-point 'symbol)))
    (helm :sources
          (mapcar (lambda (func)
                    (funcall func default))
                  '(helm-source-emacs-variables
					helm-source-emacs-commands
                    helm-source-emacs-functions
                    ))
          :buffer "*helm help elisp*"
          :preselect default)))
;; function first and variable last
(defun my-helm-help-function-or-variable ()
  "Preconfigured helm to describe commands, functions, variables and faces."
  (interactive)
  (let ((default (thing-at-point 'symbol)))
    (helm :sources
          (mapcar (lambda (func)
                    (funcall func default))
                  '(helm-source-emacs-commands
                    helm-source-emacs-functions
					helm-source-emacs-variables
                    ))
          :buffer "*helm help elisp*"
          :preselect default)))

;; replace original occur with helm-occur
;; - display initial pattern using thing-at-pt
;; - initial pattern should be marked region
(defun my-helm-occur ()
  (interactive)
  (let ((helm-compile-source-functions
         ;; rule out helm-match-plugin because the input is one regexp.
         (delq 'helm-compile-source--match-plugin
               (copy-sequence helm-compile-source-functions)))
		(initial-hint (thing-at-point 'symbol))
		)
	(helm :sources 'helm-source-occur
		  :input initial-hint
		  :buffer "*helm occur+*"
		  :history 'helm-grep-history
		  :preselect initial-hint
		  )
	))

(progn
  (define-key helm-command-map (kbd "<RET>") 'helm-mini)
  ;; (define-key helm-command-map (kbd "C-l") 'helm-filelist)
  (define-key helm-command-map (kbd "h v") 'my-helm-help-variable-or-function)
  (define-key helm-command-map (kbd "h f") 'my-helm-help-function-or-variable)
  (define-key helm-command-map (kbd "o h") 'helm-org-headlines)
  (define-key helm-command-map (kbd "o k") 'helm-org-keywords)
  (when (featurep 'eproject)
	(define-key helm-command-map (kbd "j") 'my-helm-source-eproject-files)
	)
  (when (featurep 'projectile)
  	(define-key helm-command-map (kbd "j") 'helm-projectile))
  (define-key helm-command-map (kbd "M-s o") 'my-helm-occur)
  (global-set-key (kbd "C-c a") helm-command-map)
  )

(provide 'my-helm)
