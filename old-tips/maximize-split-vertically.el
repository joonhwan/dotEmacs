;;
;; maximize and split vertically
;;
(if win32p
	(progn
	  (defun my-init-window-config ()
		(interactive)
		(w32-send-sys-command #xf030)
		(call-interactively 'split-window-horizontally)
		;; (ecb-redraw-layout)
		;; (calendar)
		)
  ;; (add-hook 'after-init-hook 'my-init-window-config)
  ;; above would not work.
  ;; saw hint in http://www.emacswiki.org/emacs/FullScreen
  ;; (setq term-setup-hook 'my-init-window-config)
  (setq window-setup-hook 'my-init-window-config)
  ))
