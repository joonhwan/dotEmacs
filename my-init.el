;; -*- coding:utf-8; -*-

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

;; * Path
;; 이상하게도, mac에서는 PATH가 종종 내가 설정해 놓은 게 아닌 걸로 실행된다.
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

(require 'my-editing)
(require 'my-programming) ;; for all except c/c++
;; (require 'my-python)
(require 'my-cc-mode) ;; for c/c++ mode only
(require 'my-dired)
(require 'my-shell)
;; ;; (require 'my-svn)
;; ;; (require 'my-web)
(require 'my-grep)
(require 'my-isearch)
(require 'my-ido)
(require 'my-tags)
;; (require 'my-org)
;; (require 'my-org-page)
;; (unless (daemonp)
;;   (require 'my-font))

;; final big brother that can handle many configuration
;;
;; NOTE: this package should be followed at last
(require 'my-helm)

;; make cleaner modeline even with multiple minor modes
;; hint from http://whattheemacsd.com/init.el-04.html
(when (my-try-require 'diminish)
  ;; (diminish 'wrap-region-mode)
  ;; (diminish 'yas-minor-mode)
  (diminish 'projectile-mode)
  ;; (diminish 'undo-tree-mode)
  (diminish 'abbrev-mode)
  (diminish 'helm-mode)
  ;; (diminish 'auto-complete-mode)
  (diminish 'eldoc-mode)
  )

;;
;; IMPORTANT! we relocated emacs *Customization* file
;; so, we need to RELOAD IT HERE...
;;
(load custom-file)

;; (my-setup-font-for-mbcs)

;; (progn
;;   (message "modifying frame...")
;;   (let ((new-config
;; 		 (cond
;; 		  ((or win32p unixp)
;; 		   '((top . 0) (left . 0) (width . 180) (height . 62)))
;; 		  (macp
;; 		   '((top . 10) (left . 10) (width . 150) (height . 46)))
;; 		  )))
;; 	(my-modify-alist-with-alist 'default-frame-alist new-config)
;; 	)
;;   (setq initial-frame-alist default-frame-alist)
;;   (modify-all-frames-parameters default-frame-alist)
;;   )
