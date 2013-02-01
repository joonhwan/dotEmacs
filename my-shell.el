;; hint from http://whattheemacsd.com/setup-shell.el-01.html
(defun comint-delchar-or-eof-or-kill-buffer (arg)
  (interactive "p")
  (if (null (get-buffer-process (current-buffer)))
      (kill-buffer)
    (comint-delchar-or-maybe-eof arg)))

(add-hook 'shell-mode-hook
          (lambda ()
            ))

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
		 (spbuf (and sp (process-buffer sp)))
		 (dir (if buffer-file-name (file-name-directory buffer-file-name) default-directory)))
	(if (and arg sp spbuf dir)
		(progn 
		  (comint-simple-send sp (concat "cd /d " dir))
		  (display-buffer spbuf)
		  (save-excursion
			(set-buffer spbuf)
			(cd dir)
			)
		  )
	  (progn
		(shell)
		(comint-simple-send sp "setlocal enableextensions")
		)
	  )
	)
  )
		 
(global-set-key "\C-z" 'my-shell-with-current-directory)

(defun my-shell-setup()
  (dirtrack-mode t)
  (ansi-color-for-comint-mode-on)
  (setq
   ;; comint-prompt-read-only t
   comint-process-echoes t
   )
  (if win32p
	  (setq shell-cd-regexp "\\(cd\\)\\|\\(cd /d\\)"))
  ;; hint from http://whattheemacsd.com/setup-shell.el-01.html
  (define-key shell-mode-map (kbd "C-d") 'comint-delchar-or-eof-or-kill-buffer)
)

(add-hook 'shell-mode-hook 'my-shell-setup)

(provide 'my-shell)
