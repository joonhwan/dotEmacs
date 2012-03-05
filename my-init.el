;; -*- coding:utf-8; -*-
(require 'cl)

;; the very first package of mine
(require 'my-lisp)

;;
;; Load path etc.
;;
(setq my-dotfiles-dir (file-name-directory (or (buffer-file-name) load-file-name))
	  my-autoinstall-dir (concat my-dotfiles-dir "auto-install")
	  ;; my-ccmode-dir (concat my-dotfiles-dir "cc-mode")
	  my-dropbox-dir (cond
					  (macp "~/DropBox")
					  (t "~/DropBox"))
	  my-etc-dir (concat my-dotfiles-dir "etc")
	  )
(make-variable-buffer-local 'my-project-root)

(add-to-list 'load-path my-dotfiles-dir)
(add-to-list 'load-path my-autoinstall-dir)
(add-to-list 'load-path "alien/manual-installed")

;; (add-to-list 'load-path my-ccmode-dir)
(add-to-list 'load-path my-etc-dir)	;; misc elisp packages...

;; run server for emacsclient
(unless (daemonp)
  (progn
	(require 'server)
	(setq server-port 15678)
	(setq server-use-tcp t)
	(server-mode t)
	))

;; language
(progn
  (set-language-environment "Korean")
  (setq default-input-method "korean-hangul390")
  (unless macp
	(setq process-coding-system-alist '(("locate" . "euc-kr-dos"))))
  ;; use 3 beolsik
  ;; (setq default-korean-keyboard "3f") ;;--> 3beolsik final.
  (setq default-korean-keyboard "390")) ;;--> 3beolsik 390
(define-coding-system-alias 'ks_c_5601-1987 'korean-iso-8bit)
(add-to-list 'file-coding-system-alist '("\\.el\\'" . utf-8))

;;
;; i'm not using normal path of emacs customization!
;;
(setq custom-file "~/elisp/my-customization.el") ;; needed for theme'ing..

;; sometimes system becomes slow. here's workaround
;; hint from
;; http://stackoverflow.com/questions/2007329/emacs-23-1-50-1-hangs-ramdomly-for-6-8-seconds-on-windows-xp
(setq w32-get-true-file-attributes nil)

(setq x-select-enable-clipboard t)

(if macp
	(require 'my-mac))

;; first-one
(require 'my-el-get)
;; (require 'my-elpa)

;; configure look-and-feel
(require 'my-theme)

(require 'my-editing)
;; (require 'my-cedet)
(require 'my-programming) ;; for all except c/c++
(require 'my-cc-mode) ;; for c/c++ mode only
(require 'my-dired)
;; ;; (require 'my-muse)
(require 'my-shell)
;; ;; (require 'my-svn)
;; ;; (require 'my-web)
(require 'my-grep)
(require 'my-isearch)
(require 'my-ido)
;; ;; (require 'my-ecb)
;; (require 'my-tags)
(require 'my-org)
;; (require 'bookmark)
;; (require 'ediff)
;; (require 'erc)
;; (require 'find-dired)
;; (require 'locate)

(if (and macp (not (daemonp)))
	(require 'my-font))

;; final big brother that can handle many configuration
;;
;; NOTE: this package should be followed at last
(require 'my-anything)

;; (require 'my-icicles)

;; file association(special file ext for my work)
;; (hint: see the doc for `set-auto-mode' function and its code)
;; (hint: see also the doc for `magic-fallback-mode-alist'.)
(add-to-list 'auto-mode-alist `(,(concat
								  ".*"
								  (my-regexp-concat
								   '(
									 "motion.*\.cfg"
									 "\.rcp"
									 ))
								  "$") . conf-mode) nil)
(add-to-list 'magic-mode-alist '("<\\?xml " . nxml-mode))
(add-to-list 'auto-coding-alist '(".*\\.cache$" . utf-8))
(add-to-list 'auto-mode-alist '("\\.qrc$" . xml-mode) nil)
;; (defun my-is-stl-header()
;;   (messsage "hey...")
;;   (message buffer-file-name)
;;   t)
;; (add-to-list 'magic-mode-alist '(my-is-stl-header . c++-mode))

;; ---------------
;; show possible path problem
;; ---------------
;; (list-load-path-shadows)

;;
;; IMPORTANT! we relocated emacs *Customization* file
;; so, we need to RELOAD IT HERE...
;;
(load custom-file)

(toggle-debug-on-error -1)

(progn
  (message "modifying frame...")
  (let ((new-config
		 (cond
		  ((or win32p unixp)
		   '((top . 0) (left . 0) (width . 220) (height . 66)))
		  (macp
		   '((top . 10) (left . 10) (width . 150) (height . 46)))
		  )))
	(my-modify-alist-with-alist 'default-frame-alist new-config)
	)
  (setq initial-frame-alist default-frame-alist)
  (modify-all-frames-parameters default-frame-alist)
  )

;; disable trackback....
(toggle-debug-on-error nil)
