(defun my-get-existing-shell-buffer ()
  (let (proc proc-buffer)
	(catch 'break
	  (dolist (proc (process-list))
		(if (string= (process-name proc) "shell")
			(throw 'break (setq proc-buffer (process-buffer proc))))))
	))

(defun my-shell-with-current-directory (&optional arg)
  (interactive "P")
  (let* ((sp (get-process "shell"))
		 (dir (if buffer-file-name (file-name-directory buffer-file-name) default-directory)))
	(if (and arg sp dir)
		(progn 
		  (comint-simple-send sp (concat "cd " dir))
		  (display-buffer (process-buffer sp)))
	  (shell))))
		 
(global-set-key "\C-z" 'my-shell-with-current-directory)

(defun my-shell-setup()
  (dirtrack-mode t)
  (ansi-color-for-comint-mode-on)
  (setq
   ;; comint-prompt-read-only t
   comint-process-echoes t
   )
)

(add-hook 'shell-mode-hook 'my-shell-setup)

(provide 'my-shell)
