;; -*- coding:utf-8 -*-

(helm-mode 1)

(setq helm-c-top-command "top -ncols %s -n 1")

(setq helm-c-locate-command 
	  (case system-type
		('gnu/linux "locate -i -r %s")
		('berkeley-unix "locate -i %s")
		('windows-nt "es -s -p -r %s")
		('darwin "mdfind -name %s")
		(t "locate %s"))
	  )

(defvar helm-c-source-emacs-variables
  '((name . "Emacs Variables")
    (candidates . (lambda ()
                    (sort (all-completions "" obarray 'boundp) 'string-lessp)))
    (type . variable)
    (requires-pattern . 2))
  "Source for completing Emacs variables.")

(defvar helm-c-source-emacs-functions
  '((name . "Emacs Functions")
    (candidates . (lambda ()
                    (let (commands)
                      (mapatoms (lambda (a)
                                  (if (functionp a)
                                      (push (symbol-name a) commands))))
                      (sort commands 'string-lessp))))
    (type . function)
    (requires-pattern . 2))
  "Source for completing Emacs functions.")


;; variable first and function last
(defun my-helm-for-help-variable ()
  (interactive)
  (helm
   :sources '(helm-c-source-emacs-variables helm-c-source-emacs-functions)
   :input (let (
				(my-hint (thing-at-point 'symbol))
				(my-input "")
				)
			(setq my-input (concat
							;;"\b"
							my-hint
							;; "\b"
							(if (featurep 'helm-match-plugin)
								(if my-hint
									" "
								  "")
							  ""
							  )
							))
			my-input)
   :buffer "*Helm Help(func/var)*"
   )
  )

;; function first and variable last
(defun my-helm-for-help-function ()
  (interactive)
  (helm
   :sources '(helm-c-source-emacs-functions helm-c-source-emacs-variables)
   :input (let (
				(my-hint (thing-at-point 'symbol))
				(my-input "")
				)
			(setq my-input (concat
							;;"\b"
							my-hint
							;; "\b"
							(if (featurep 'helm-match-plugin)
								(if my-hint
									" "
								  "")
							  ""
							  )
							))
			my-input)
   :buffer "*Helm Help(func/var)*"
   )
  )

(progn
  (define-key helm-command-map (kbd "<RET>") 'helm-mini)
  ;; (define-key helm-command-map (kbd "C-l") 'helm-filelist)
  (define-key helm-command-map (kbd "h v") 'my-helm-for-help-variable)
  (define-key helm-command-map (kbd "h f") 'my-helm-for-help-function)
  (global-set-key (kbd "C-c a") helm-command-map)
  )

(provide 'my-helm)
