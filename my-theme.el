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

;; 
;;  from 'frame.c'
;;  
;; static const struct frame_parm_table frame_parms[] =
;; {
;;   {"auto-raise",		&Qauto_raise},
;;   {"auto-lower",		&Qauto_lower},
;;   {"background-color",		0},
;;   {"border-color",		&Qborder_color},
;;   {"border-width",		&Qborder_width},
;;   {"cursor-color",		&Qcursor_color},
;;   {"cursor-type",		&Qcursor_type},
;;   {"font",			0},
;;   {"foreground-color",		0},
;;   {"icon-name",			&Qicon_name},
;;   {"icon-type",			&Qicon_type},
;;   {"internal-border-width",	&Qinternal_border_width},
;;   {"menu-bar-lines",		&Qmenu_bar_lines},
;;   {"mouse-color",		&Qmouse_color},
;;   {"name",			&Qname},
;;   {"scroll-bar-width",		&Qscroll_bar_width},
;;   {"title",			&Qtitle},
;;   {"unsplittable",		&Qunsplittable},
;;   {"vertical-scroll-bars",	&Qvertical_scroll_bars},
;;   {"visibility",		&Qvisibility},
;;   {"tool-bar-lines",		&Qtool_bar_lines},
;;   {"scroll-bar-foreground",	&Qscroll_bar_foreground},
;;   {"scroll-bar-background",	&Qscroll_bar_background},
;;   {"screen-gamma",		&Qscreen_gamma},
;;   {"line-spacing",		&Qline_spacing},
;;   {"left-fringe",		&Qleft_fringe},
;;   {"right-fringe",		&Qright_fringe},
;;   {"wait-for-wm",		&Qwait_for_wm},
;;   {"fullscreen",                &Qfullscreen},
;;   {"font-backend",		&Qfont_backend},
;;   {"alpha",			&Qalpha},
;;   {"sticky",			&Qsticky},
;;   {"tool-bar-position",		&Qtool_bar_position},
;; };

(progn
  (setq initial-frame-alist '((menu-bar-lines . 0) (tool-bar-lines . 0)))
  (setq frame-title-format (concat "Emacs " emacs-version " [%*] %f" ))
  (setq fringe-mode (quote (0 . 0))
		indicate-buffer-boundaries (quote left)
		indicate-empty-lines t
		)
  (setq
   default-frame-alist
   (cond
	((or win32p unixp)
	 '(;; (menu-bar-lines . 0) ;; (menu-bar-mode nil)
	   (tool-bar-lines . 0) ;; (setq tool-bar-mode nil)
	   ;; (scroll-bar . 14)
	   (font . "Ubuntu Mono-11:normal:antialias=natural")
	   ;; 'alpha' : transparency
	   ;; 1st number : foreground value,
	   ;; 2nd number : background value
	   ;; (alpha . (98 96))
	   ;; ;; gamma correction
	   ;; ;; 'nil' ==> default gamma
	   ;; ;; 2.1 ==> maybe center? (check `frame.c' code)
	   ;; (screen-gamma . nil)
	   (line-spacing . 0)
	   ;; (font . "Anonymous Pro-11:normal:antialias=natural")
	   ;; (font . "Andale Mono-10.0:bold:spacing=110:antialias=natural")
	   ;; (font . "³ª´®°íµñÄÚµù-11:normal:antialias=natural")
	   ))
	(macp
	 '(
	   (tool-bar-lines . 0)
	   ;; (font . "Monaco-12:normal:antialias=natural")
	   (font . "Ubuntu_Mono-14:normal:antialias=natural")
	   ;; (font . "Menlo-13:normal:antialias=natural")
	   ))))
  (setq initial-frame-alist default-frame-alist)
  (modify-all-frames-parameters default-frame-alist)
  )

(provide 'my-theme)

