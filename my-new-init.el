(require 'my-common)
(require 'my-theme)

;; * run server for emacsclient
(unless (daemonp)
  (progn
    (require 'server)
    (setq server-port 15678)
    (setq server-use-tcp t)
    (if macp
	(setq ns-pop-up-frames nil)
      (require 'server)
      (when (and (>= emacs-major-version 23)
		 (equal window-system 'w32))
	(defun server-ensure-safe-dir (dir) "Noop" t)) ; Suppress error "directory
					; ~/.emacs.d/server is unsafe"
					; on windows.
      (server-start)
      )))

;; ---------------------------
(require 'my-el-get)
(require 'my-editing)
(require 'my-programming)
(require 'my-dired)
