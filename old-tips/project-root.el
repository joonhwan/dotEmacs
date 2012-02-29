;; from textmate-mode.el
(defun my-root-match(root names)
	(member
	 (car names)
	 (directory-files root)))
(defun my-root-matches(root names)
  (if (my-root-match root names)
	  (my-root-match root names)
	(if (eq (length (cdr names)) 0)
		'nil
	  (my-root-matches root (cdr names))
	  )))
(defun my-find-project-root (&optional files-list-only-at-root certain-directory-under-root)
  "Determines the current project root by recursively searching for an indicator."
  (when
	  (null certain-directory-under-root)
	(setq certain-directory-under-root default-directory))
  (cond
   ((my-root-matches certain-directory-under-root files-list-only-at-root)
	(expand-file-name certain-directory-under-root))
   ((equal (expand-file-name certain-directory-under-root) "\\([a-zA-Z]\\:\\)?/")
	nil)
   (t
	(my-find-project-root
	 files-list-only-at-root
	 (concat (file-name-as-directory certain-directory-under-root) "..")))))
