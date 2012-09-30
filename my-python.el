;;
;; python
;;

(defun my-python-help-clean-up-buffer ()
  (with-current-buffer "*Help*"
	(toggle-read-only -1)
	(replace-string "" "" nil (point-min) (point-max))
	(toggle-read-only)
	))

(defadvice python-describe-symbol (after fix-python-describe-symble activate)
  (my-python-help-clean-up-buffer))

(eval-after-load "python"
  '(progn
	 ;; hint from http://www.saltycrane.com/blog/2010/05/my-emacs-python-environment/
	 (require 'pymacs)
	 (pymacs-load "ropemacs" "rope-")
	 (setq ropemacs-enable-autoimport t)
	 (add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.2")
	 (require 'auto-complete-config)
	 (add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete-1.2/dict")
	 (ac-config-default)
	 (add-hook 'find-file-hook 'flymake-find-file-hook)
	 ;; Pyflakes for python
	 ;; (load-library "flymake-fringe-icons")
	 (when (load "flymake" t)
	   (defun flymake-pychecker-init ()
		 (let* ((temp-file (flymake-init-create-temp-buffer-copy
							'flymake-create-temp-inplace))
				(local-file (file-relative-name
							 temp-file
							 (file-name-directory buffer-file-name))))
		   (list "pycheck" (list local-file))))
	   (add-to-list 'flymake-allowed-file-name-masks
					'("\\.py\\'" flymake-pychecker-init)))
	 ;; (when (load "flymake" t)
	 ;;   (defun flymake-pyflakes-init ()
	 ;; 	 (let* ((temp-file (flymake-init-create-temp-buffer-copy
	 ;; 						'flymake-create-temp-inplace))
	 ;; 			(local-file (file-relative-name
	 ;; 						 temp-file
	 ;; 						 (file-name-directory buffer-file-name))))
	 ;; 	   (list "pycheckers"  (list local-file))))
	 ;;   (add-to-list 'flymake-allowed-file-name-masks
	 ;; 				'("\\.py\\'" flymake-pyflakes-init)))
	 (global-set-key (kbd "C-c C-p") 'flymake-goto-prev-error)
	 (global-set-key (kbd "C-c C-n") 'flymake-goto-next-error)
	 (defun my-electric-pair ()
	   "Insert character pair without sournding spaces"
	   (interactive)
	   (let (parens-require-spaces)
		 (insert-pair)))
	 (defun my-python-display-shell ()
	   (interactive)
	   (if (featurep 'popwin)
		   (popwin:display-buffer "*Python*")
		 (display-buffer "*Python*")))
	 (defun my-python-send-buffer ()
	   (interactive)
	   (python-send-buffer)
	   (when (featurep 'popwin)
		 (popwin:display-buffer "*Python*")))
	 (define-key python-mode-map (kbd "\C-c\C-c") 'my-python-send-buffer)
	 (define-key python-mode-map (kbd "\C-c!") 'my-python-display-shell)
	 (defun my-python-mode-hook ()
	   ;; (define-key python-mode-map "\"" 'my-electric-pair)
	   ;; (define-key python-mode-map "\'" 'my-electric-pair)
	   ;; (define-key python-mode-map "(" 'my-electric-pair)
	   ;; (define-key python-mode-map "[" 'my-electric-pair)
	   ;; (define-key python-mode-map "{" 'my-electric-pair)
	   (setq
		indent-tabs-mode nil
		tab-width 4
		python-remove-cwd-from-path nil
		)
	   (flymake-mode 1)
	   (eldoc-mode 1)
	   )
	 (add-hook 'python-mode-hook 'my-python-mode-hook)
	 ;; (when macp
	 ;;   (defun my-inferior-python-mode-comint-filter-for-mac (s)
	 ;; 	 (replace-regexp-in-string "" "" s)
	 ;; 	 )
	 ;;   (add-hook 'inferior-python-mode-hook 'my-inferior-python-mode-comint-filter-for-mac)
	 ;;   )
	 )
  )

;; (defun my-py-execute-buffer (&optional shell dedicated switch)
;;   (interactive)
;;   (sit-for 1.)
;;   (py-execute-buffer shell dedicated switch)
;;   (popwin:display-buffer "*Python*")
;;   )
;; (defun my-py-shell (&optional argprompt dedicated pyshellname switch sepchar)
;;   (interactive "P")
;;   (let ((py-shell-process (py-shell argprompt dedicated pyshellname switch sepchar)))
;; 	(when (functionp 'popwin:display-buffer)
;; 	  (popwin:display-buffer (process-buffer py-shell-process)))
;; 	))
;; (define-key python-mode-map (kbd "\C-c\C-c") 'my-py-execute-buffer)
;; (define-key python-mode-map (kbd "\C-c!") 'my-py-shell)
;; (define-key python-mode-map (kbd "\C-c\C-z") 'my-py-shell)
;; (eval-after-load "python-mode"
;;   '(progn
;; 	 (setq
;; 	  ;; disable python-mode to pop up buffer
;; 	  py-split-windows-on-execute-p nil
;; 	  py-shell-switch-buffers-on-execute-p nil
;; 	  )
;; 	 (cond
;; 	  (macp
;; 	   (setq python-python-command "python")
;; 	   )
;; 	  (t
;; 	   (setq python-python-command "c:/dev/python26/python.exe")
;; 	   )
;; 	  )
;; 	 (defun my-python-mode-hook ()
;; 	   (setq
;; 		py-shell-name "python"
;; 		py-shell-toggle-1 "python3"
;; 		py-shell-toggle-2 "python"
;; 		)
;; 	   (call-interactively 'py-switch-shell)
;; 	   )
;; 	 (add-hook 'python-mode-hook 'my-python-mode-hook)
;; ))

(provide 'my-python)
