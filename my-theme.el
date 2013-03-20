;; -*- coding:utf-8-auto; -*-

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
  ;; 한글 폰트를 위한 설정. 아래 default-frame-alist에서 설정한 것을
  ;; 제외한 모든 다른 인코딩의 폰트는 fontset-default에 지정된 것이
  ;; 사용되는 것 같다.
  ;;
  ;;현재로서는 글꼴의 크기를 조정해서 폭을 맞추고 있어서, 한글과
  ;;영문간의 글꼴 크기 차이가 난다. font.c 의 코드를 보았지만, 아직은
  ;;spacing 이나 scalable 같은게 어떻게 동작하는지 이해를 못하고 있다.
  (set-fontset-font
   "fontset-default"
   'korean-ksc5601
   (cond
	(macp
	 "NanumGothicCoding-14:weight=normal:spacing=m:scalable=true")
	(t
	 "나눔고딕코딩-12:weight=normal:scalable=true")))
  (setq
   default-frame-alist
   (cond
	((or win32p unixp)
	 '(;; (menu-bar-lines . 0) ;; (menu-bar-mode nil)
	   (tool-bar-lines . 0) ;; (setq tool-bar-mode nil)
	   ;; (scroll-bar . 14)
	   ;; (font . "Ubuntu Mono-11:normal:antialias=natural")
	   ;; 'alpha' : transparency
	   ;; 1st number : foreground value,
	   ;; 2nd number : background value
	   (alpha . (100 100))
	   ;; ;; gamma correction
	   ;; ;; 'nil' ==> default gamma
	   ;; ;; 2.1 ==> maybe center? (check `frame.c' code)
	   ;; (screen-gamma . nil)
	   (line-spacing . 0)
	   (font . "Bitstream Vera Sans Mono-10.5:normal:antialias=natural")
	   ;; (font . "나눔고딕코딩-12:normal:antialias=natural")
	   ;; (font . "Monaco-11:normal:antialias=natural")
	   ;; (font . "Anonymous Pro-11:normal:antialias=natural")
	   ;; (font . "Andale Mono-10.0:bold:spacing=110:antialias=natural")
	   ))
	(macp
	 '(
	   (tool-bar-lines . 0)
	   (font . "Menlo-12:weight=normal:antialias=natural:spacing=m")
	   (width . 115)
	   (height . 71)
	   ;; (font . "Monaco-12:normal:antialias=natural")
	   ;; (font . "Ubuntu_Mono-14:normal:antialias=natural")
	   ;; (font . "Menlo-13.5:normal:antialias=natural")
	   ))))
  (setq initial-frame-alist default-frame-alist)
  (modify-all-frames-parameters default-frame-alist)
  )

(defvar my-transparent-state-is-on t
  ""
  )

;; 잘못 만든 함수. 1) active frame의 2) alpha값만 바꾸어야 하는데. 초기
;; 프레임과 전체 frame parameter가 바뀐다. :(
;; 
(defun my-toggle-transparent-state ()
  (interactive)
  (setq default-frame-alist
		(if my-transparent-state-is-on
		   '((alpha . (85 50)))
		  '((alpha . (100 100)))))
  (setq my-transparent-state-is-on (not my-transparent-state-is-on))
  (setq initial-frame-alist default-frame-alist)
  (modify-all-frames-parameters default-frame-alist)
  )
;; (global-set-key (kbd "C-c t") 'my-toggle-transparent-state)

(provide 'my-theme)
