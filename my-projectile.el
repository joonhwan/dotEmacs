;; -*- coding:utf-8 -*-

;; override default
(define-key projectile-mode-map (kbd "C-c j j") 'projectile-jump-to-project-file)
(define-key projectile-mode-map (kbd "C-c j f") 'projectile-grep-in-project)
(define-key projectile-mode-map (kbd "C-c j b") 'projectile-switch-to-buffer)
(define-key projectile-mode-map (kbd "C-c j o") 'projectile-multi-occur)
(define-key projectile-mode-map (kbd "C-c j r") 'projectile-replace-in-project)
(define-key projectile-mode-map (kbd "C-c j i") 'projectile-invalidate-project-cache)
(define-key projectile-mode-map (kbd "C-c j t") 'projectile-regenerate-tags)
;; (global-set-key (kbd "C-c j") projectile-mode-map)

;; how re-build cache? until knowing it, disable it.
;; (setq projectile-enable-caching t)
(setq projectile-ignored-file-extensions
	  (append projectile-ignored-file-extensions
			  '(;; visual studio
				"bak" "exp" "ncb" "ilk" "obj" "manifest"
				;; elisp
				"elc"
				;; python
				"pyc"
				;; general documentations
				"txt" "rst" "doc"
				)))

(setq projectile-ignored-files
	  (append projectile-ignored-files '(".git" ".svn" ".hg")))

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
(define-key projectile-mode-map (kbd "C-c j f") 'my-projectile-grep)

(provide 'my-projectile)
