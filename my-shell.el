;;
;; shell mode (currently no special things.. here...)
;;
(if win32p
	(progn
	  (setq my-find-program-name (file-name-sans-extension (file-name-nondirectory find-program)))
	  (setq w32shell-emacs-gnuwin32-bindir "c:/dev/gnuwin32/bin")
	  (setq-default w32shell-wanted-progs `("grep" ,my-find-program-name "xargs" "cmp" "diff" "diff3" "cmp" "patch" "locate"))
	  (require 'w32shell)
	  ;; (w32shell-set-shell "cmd")
	  ))

(defun my-mac-shell()
  (interactive)
  ;; (ansi-term "/bin/bash" "shell")
  (shell)
  )


(cond
 (win32p
  (global-set-key "\C-z" 'cmd-shell)
  ;; (setq w32-quote-process-args ?\")
  )
 (macp
  (global-set-key "\C-z" 'my-mac-shell)
  ))
;; (if nil ;; win32p
;;     (progn
;;       (require 'emacsw32)
;;       (require 'w32-integ)
;;       (require 'w32shell)
;;       (require 'w32-print)
;;       (setq pr-gs-command "C:\\Program Files\\gs\\gs8.53\\bin\\gswin32.exe")
;;       (setq pr-gv-command "C:\\Program Files\\Ghostgum\\gsview\\gsview32.exe")
;;       (setq w32-print-menu-show-print nil)
;;       (setq w32-print-menu-show-ps-print nil)
;;       (setq htmlize-view-print-visible t)
;;       (setq emacsw32-style-frame-title nil)
;;       (setq emacsw32-mode nil)			; Keep Emacs bindings
;;       (setq w32-allow-system-shell t)
;;       (w32shell-set-shell "cmd");; (w32shell-set-shell "cygwin");;(setq w32shell-shell 'cygwin)
;;       ;; (w32shell-add-emacs t)			;(w32shell-set-shell "cmd")
;;       ;; (setq explicit-bash-args '("--noediting" "-i"))
;;       ;;(setq shell-prompt-pattern "^[A-Za-z]:.*>")
;;       ;; (setenv "CPATH" "/usr/include:/usr/X11R6/include" nil)
;;       ;; (setenv "LIBRARY_PATH" "/usr/lib:/usr/X11R6/lib" nil)
;;       (setq comint-completion-addsuffix '("\\" . " "))
;;       (global-set-key "\C-z" 'shell)))

(defun my-shell-setup()
  (dirtrack-mode t)
  (ansi-color-for-comint-mode-on)
  (setq comint-prompt-read-only t)
)

(add-hook 'shell-mode-hook 'my-shell-setup)

(provide 'my-shell)
