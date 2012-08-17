;; -*- coding:utf-8 -*-

;; you can invalidate cache manually using
;; `projectile-invalidate-cache'
(setq projectile-enable-caching t)

(setq projectile-ignored-file-extensions
	  (append projectile-ignored-file-extensions
			  '(;; visual studio
				"bak" "exp" "ncb" "ilk" "obj" "manifest"
				;; elisp
				"elc"
				;; python
				"pyc"
				;; general documentations
				;; "txt"
				"rst" "doc"
				)))

;; (defun my-projectile-ignored-directory-p (file)
;;   "Check if FILE should be ignored."
;;   (loop for ignored in projectile-ignored-directories
;;         when (string= file (concat ignored "/"))
;;         do (return t)
;;         finally (return nil)))
;; (defun projectile-ignored-directory-p (file)
;;   "Check if FILE should be ignored."
;;   (if (my-projectile-ignored-directory-p file)
;; 	  (progn
;; 		(message (concat "file " file " should be ignored"))
;; 		t)
;; 	(progn
;; 	  (message (concat "file " file " should be NOT ignored"))
;; 	  nil))
;;   )

(setq projectile-ignored-files
	  (append projectile-ignored-files '(".git" ".svn" ".hg")))

(setq projectile-ignored-directories
	  (append projectile-ignored-directories '(".git" ".svn" ".hg" "build" "build-64" "build-32")))

(projectile-global-mode 1)

;; eproject style

(defun my-projectile-update-filelist-file (prefix)
  (interactive "P")
  (let* ((prj-dir (if prefix
					  (expand-file-name (read-directory-name "Project Dir:" default-directory))
					default-directory))
		 (filelist-file (concat prj-dir ".filelist")))
	(with-temp-buffer
	  (dolist (prj-file (projectile-get-project-files default-directory))
		(insert (concat prj-file "\n"))
		)
	  (write-region (point-min) (point-max) filelist-file))
	))

(defun my-projectile-grep (command-args)
  "Run the grep command on all the project files."
  (interactive
   (progn
	 (require 'grep)
	 (grep-compute-defaults)
	 (let ((default (grep-default-command)))
	   (list (read-from-minibuffer
			  "Run grep on project files: "
			  (if current-prefix-arg default grep-command)
			  nil
			  nil
			  'grep-history
			  (if current-prefix-arg nil default)
			  )))))
  (let ((b (current-buffer))
		(old-dir default-directory)
		(prj-dir (projectile-get-project-root))
		(prj-files '())
		)
	(if prj-dir
		(progn
		  (setq prj-files (projectile-get-project-files (projectile-get-project-root))))
	  (progn
		(setq prj-dir default-directory)
		(setq prj-files '("*.*")))
	  )
	(dolist (f prj-files)
	  (setq command-args (concat command-args " " f))
	  )
	(when prj-dir (cd prj-dir))
	(grep command-args)
	(with-current-buffer b (cd old-dir))
	))

(provide 'my-projectile)
