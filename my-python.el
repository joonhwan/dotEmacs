;; -*- coding:utf-8 -*-
;; python
;;
;; as is 2013/09/26 bankrup'd old python trials and then started with
;; extremely simple configuration for study

;; (eval-after-load "python"
;;   '(progn
;; 	 (cond
;; 	  (win32p (setq python-shell-interpreter "c:/python27/python.exe")))
;; 	 (defun my-python-shell-send-buffer (prefix)
;; 	   (interactive "P")
;; 	   (let ((source-window (selected-window)))
;; 		 (call-interactively 'run-python)
;; 		 (select-window source-window)
;; 		 ;; (switch-to-buffer source-window)
;; 		 (call-interactively 'python-shell-send-buffer)))
;; 	 (defun my-python-hook ()
;; 	   ;; (define-key python-mode-map "\C-m" 'newline-and-indent)
;; 	   (define-key python-mode-map "\C-c\C-a" 'my-python-shell-send-buffer)
;; 	   )
;; 	 (add-hook 'python-mode-hook 'my-python-hook)
;; 	 )
;;   )

(when (my-try-require 'jedi)
  (add-hook 'python-mode-hook 'jedi:setup)
  (setq jedi:complete-on-dot t)
  )

(provide 'my-python)
