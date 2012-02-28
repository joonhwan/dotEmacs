;;
;; my theme
;;
(require 'custom)
(setq custom-theme-directory (concat my-dotfiles-dir "theme"))
(add-to-list 'load-path custom-theme-directory)
(setq custom-safe-themes t) ;; theme should be unsafe(?) though...
;; (load-theme 'zenburn-jhlee)
(load-theme 'my-dark)
;; (load-theme 'solarized-jhlee-dark)

(progn
  (setq initial-frame-alist '((menu-bar-lines . 0) (tool-bar-lines . 0)))
  (setq frame-title-format (concat "[Emacs " emacs-version "] [%*] %f" ))
  (setq fringe-mode (quote (0 . 0))
		indicate-buffer-boundaries (quote left)
		indicate-empty-lines t
		default-frame-alist
		(cond
		 ((or win32p unixp)
		  '((top . 0)
			(left . 0)
			(width . 220)
			(height . 66)
			;; (fullscreen . fullheight)
			;; (border-width . 0)
			;; (background-color . "#0a0e1a")
			;; (foreground-color . "#c0c0ba")
			;; (user-size . t)
			;; (background-mode . dark)
			;; (cursor-type  . bar)
			;; (cursor-color . "chartreuse1")
			;;(title . nil) ;; set as nil to utilize 'frame-title-format'
			(menu-bar-lines . 0) ;; (menu-bar-mode nil)
			(tool-bar-lines . 0) ;; (setq tool-bar-mode nil)
			(scroll-bar . 14)
			;; (line-spacing . 2) ;;; *additional* line space...
			;; (font . "Monaco-10")
			;; (font . "Consolas-11:normal:antialias=natural")
			;; (font . "Inconsolata-11:normal:antialias=natural")
			;; (font . "Bitstream Vera Sans Mono-10:normal:antialias=natural")
			(font . "Ubuntu Mono-11:normal:antialias=natural")
			;; (font . "Anonymous Pro-11:normal:antialias=natural")
			;; (font . "Andale Mono-10.0:bold:spacing=110:antialias=natural")
			;; (font . "³ª´®°íµñÄÚµù-11:normal:antialias=natural")
			))
		 (macp
		  '(
			(top . 10)
			(left . 10)
			(width . 150)
			(height . 46)
			;; (fullscreen . fullboth)
			(tool-bar-lines . 0)
			;; (font . "Monaco-12:normal:antialias=natural")
			(font . "Ubuntu_Mono-14:normal:antialias=natural")
			;; (font . "Menlo-13:normal:antialias=natural")
			))))
  (setq initial-frame-alist default-frame-alist)
  (modify-all-frames-parameters default-frame-alist)
  )

(provide 'my-theme)

