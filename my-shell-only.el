;; -*- coding:utf-8; -*-

(add-to-list 'load-path "~/elisp/")
(add-to-list 'load-path "~/elisp/etc")	;; misc elisp packages...

;; the very first package of mine
(require 'my-lisp)
;; language environment
(progn
  (set-language-environment "Korean")
  (setq process-coding-system-alist '(("locate" . "euc-kr-dos")))
  ;; use 3 beolsik
  ;; (setq default-korean-keyboard "3f") ;;--> 3beolsik final.
  (setq default-korean-keyboard "390")) ;;--> 3beolsik 390

;; configure look-and-feel
(require 'my-theme)
(setq custom-file "~/elisp/my-customization.el") ;; needed for theme'ing..

(require 'my-editing)
(require 'my-shell)
(require 'hide-mode-line)

(set-fringe-mode 'none)
(load custom-file)

(call-interactively 'hide-mode-line)
;; (set-default-font "-outline-나눔고딕코딩-bold-normal-normal-mono-13-*-*-*-c-*-ksc5601.1987-0" t)
