(require 'filecache)
(require 'ido)
(when (my-try-require 'flx-ido)
  (flx-ido-mode 1)
  (setq
   ;; as in flx's docstring(to see flx-ido-face
   ido-use-faces nil
   flx-ido-use-faces t
   )
  )
(when (my-try-require 'ido-vertical-mode)
  (ido-vertical-mode)
  )
  
(setq
 ido-auto-merge-work-directories-length -1 ;; magnar's config
 ido-enable-flex-matching t
 ido-everywhere t
 ido-auto-merge-delay-time 1.2 ;; little more time for me to input new file path
 )
(ido-mode 1)

;; (when (my-try-require 'ido-ubiquitous)
;;   (ido-ubiquitous-mode 1))

(defun my-ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
	(let ((enable-recursive-minibuffers t))
	  (visit-tags-table-buffer))
	(find-file
	 (expand-file-name
	  (ido-completing-read
	   "Project file: " (tags-table-files) nil t)))))

(when (my-try-require 'smex)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))
  
(provide 'my-ido)
