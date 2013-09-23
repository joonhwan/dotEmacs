(require 'filecache)
(require 'ido)

(setq
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
