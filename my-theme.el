;; -*- coding:utf-8-auto; -*-

;;
;; my theme
;;
(require 'custom)
(setq custom-theme-directory (concat my-dotfiles-dir "theme"))
(add-to-list 'load-path custom-theme-directory)
(setq custom-safe-themes t) ;; theme should be unsafe(?) though...

;; 폰트설정
;; 한글 폰트를 위한 설정. 아래 default-frame-alist에서 설정한 것을
;; 제외한 모든 다른 인코딩의 폰트는 fontset-default에 지정된 것이
;; 사용되는 것 같다.
;; hint from
;; http://seorenn.blogspot.com/2011/04/emacs_24.html?showComment=1331616187916#c1562553045122508565
;; http://www.emacswiki.org/emacs/SetFonts (cinsk가 작성한 Emacs for Mac OSX부분을 확인)
(progn
  (cond
   (macp
	;; 기본적인 2가지 폰트의 설정(폰트크기는 짝수로 해야 한/영간
	;; 크기가 맞는다
	(set-face-font 'default "Ubuntu Mono-14;bold")
	(set-face-font 'variable-pitch "Ubuntu 14")

	;; 문자셋별로 원하는 폰트 설정(나눔고딕코딩이 그래도 쓸만함)
	(set-fontset-font "fontset-default" '(#x1100 . #xffdc)
					  '("NanumGothicCoding" . "iso10646-1"))
	(set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
					  '("NanumGothicCoding" . "iso10646-1"))
	(set-fontset-font "fontset-default" 'kana
					  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
	(set-fontset-font "fontset-default" 'han
					  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
	(set-fontset-font "fontset-default" 'japanese-jisx0208
					  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
	(set-fontset-font "fontset-default" 'katakana-jisx0201
					  '("Hiragino Kaku Gothic Pro" . "iso10646-1"))
	(setq face-font-rescale-alist
		  '((".*hiragino.*" . 1.2)
			(".*nanum.*" . 1.0)))
	)
   (win32p
	;; 기본적인 2가지 폰트의 설정(폰트크기는 짝수로 해야 한/영간
	;; 크기가 맞는다
	(set-face-font 'default "Ubuntu Mono-12")
	(set-face-font 'variable-pitch "Ubuntu 12")
	(set-fontset-font t 'hangul (font-spec :name "나눔고딕코딩"))
	;; (setq face-font-rescale-alist '((".*나눔고딕코딩.*" . 1.0)))
	)
   ))

;; 초기 테마
(defvar my-current-theme-is-dark t)
(defvar my-default-dark-theme 'my-default-dark)
(defvar my-default-light-theme 'my-default-light)
(defun my-opposite-theme (curr-theme-name)
  (let ((curr-theme-split nil)
		(opposite-theme-split nil)
		)
	(if curr-theme-name
		(setq curr-theme-split (split-string curr-theme-name "-")))
	(if (> (length curr-theme-split) 2)
		(setq opposite-theme-split
			  (mapcar 
			   (lambda (e) 
				 (cond 
				  ((string= e "dark")
				   "light")
				  ((string= e "light")
				   "dark")
				  (t
				   e)))
			   curr-theme-split)))
	(c-concat-separated opposite-theme-split "-")
	)
  )
(defun my-toggle-theme ()
  (interactive)
  (let* ((current-theme (symbol-name (car custom-enabled-themes)))
		 (opposite-theme (my-opposite-theme current-theme)))
	(if (and (stringp opposite-theme)
			 (> (length opposite-theme) 0))
		(progn 
		  (mapcar 'disable-theme custom-enabled-themes)
		  (load-theme (intern opposite-theme) nil nil)
		  (message (format "loaded [%s] theme(opposite of [%s])" opposite-theme current-theme))
		  )
	  (call-interactively 'my-select-theme)
	  )
  )
)
(global-set-key (kbd "C-c t t") 'my-toggle-theme)

(defun my-select-theme (theme)
  (interactive
   (list (ido-completing-read "Select my theme: " (remove-if (lambda (s) (not (string-match "my-" s))) (mapcar 'symbol-name (custom-available-themes))))))
  (mapcar 'disable-theme custom-enabled-themes)
  (load-theme (intern theme) nil nil)
  )
(global-set-key (kbd "C-c s t") 'my-select-theme)


(my-select-theme "my-default-dark")

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
  (setq initial-frame-alist '())
  (setq frame-title-format (concat "Emacs " emacs-version " [%*] %f" ))
  (setq fringe-mode (quote (0 . 0))
		indicate-buffer-boundaries (quote left)
		indicate-empty-lines t
		)
  (setq
   default-frame-alist
   (cond
	((or win32p unixp)
	 `((menu-bar-lines . 0)
	   (tool-bar-lines . 0)
	   (alpha . (100 100))
	   (line-spacing . 0)
	   ;; (font . ,(format "%s-%g" my-default-font-name (* 0.1 my-default-font-size)))
	   ;; (top . 0)
	   ;; (left . -1)
	   ;; (width . 115)
	   ;; (height . 71)
	   ))
	(macp
	 `((menu-bar-lines . 0)
	   (tool-bar-lines . 0)
	   ))))
  (setq initial-frame-alist default-frame-alist)
  (modify-all-frames-parameters default-frame-alist)
  )

;; 프레임 투명상태는 만들기
(defvar my-transparent-state-is-on t
  ""
  )
(defun my-toggle-transparent-state (&optional arg)
  (interactive "P")
  (setq my-transparent-state-is-on 
		(if (null arg)
			(not my-transparent-state-is-on)
		  (> (prefix-numeric-value arg) 0))
		  )
  (setq default-frame-alist
		(if my-transparent-state-is-on
		   '((alpha . (80 80)))
		  '((alpha . (100 100)))))
  (setq initial-frame-alist default-frame-alist)
  (modify-all-frames-parameters default-frame-alist)
  )

;; emacs 비활성화 상태에서만 투명하게 하기.
(add-hook 'focus-in-hook '(lambda () (my-toggle-transparent-state -1)))
(add-hook 'focus-out-hook '(lambda () (my-toggle-transparent-state 1)))

;; (global-set-key (kbd "C-c t") 'my-toggle-transparent-state)

;; 커스템 테마를 만든다음 실행할 함수.
(setq my-faces 
	  '(default bold bold-italic fixed-pitch italic underline variable-pitch fringe header-line highlight hover-highlight match menu mouse paren trailing-whitespace buffer-menu-buffer border button cursor escape-glyph-face link minibuffer-prompt mode-line mode-line-inactive mode-line-buffer-id mode-line-emphasis mode-line-highlight region scroll-bar secondary-selection tool-bar 
		 apt-utils-broken apt-utils-description apt-utils-field-contents apt-utils-field-keyword apt-utils-normal-package apt-utils-summary apt-utils-version apt-utils-virtual-package breakpoint-disabled-bitmap breakpoint-enabled-bitmap calendar-today change-log-date circe-highlight-nick-face circe-my-message-face circe-originator-face circe-prompt-face circe-server-face comint-highlight-input comint-highlight-prompt compilation-info compilation-warning cscope-line-face cua-rectangle custom-button custom-button-pressed custom-changed custom-comment custom-comment-tag custom-documentation custom-group-tag custom-group-tag-1 custom-invalid custom-link custom-modified custom-rogue custom-saved custom-set custom-state custom-tag custom-variable-button custom-variable-tag diary dictionary-button dictionary-reference dictionary-word-entry diff-added-face diff-context-face diff-file-header-face diff-header-face diff-hunk-header-face diff-index-face diff-refine-added diff-refine-change-face diff-removed-face diredp-compressed-file-suffix diredp-date-time diredp-default diredp-deletion diredp-deletion-file-name diredp-dir-heading diredp-dir-priv diredp-display-msg diredp-exec-priv diredp-executable-tag diredp-file-name diredp-file-suffix diredp-flag-mark diredp-flag-mark-line diredp-ignored-file-name diredp-link-priv diredp-no-priv diredp-number diredp-other-priv diredp-rare-priv diredp-read-priv diredp-symlink diredp-write-priv ediff-current-diff-A ediff-current-diff-B ediff-current-diff-C ediff-old-diff-A ediff-old-diff-B ediff-old-diff-C emms-pbi-current emms-pbi-mark-marked emms-pbi-song erc-action-face erc-bold-face erc-current-nick-face erc-dangerous-host-face erc-default-face erc-direct-msg-face erc-error-face erc-fool-face erc-highlight-face erc-input-face erc-keyword-face erc-my-nick-face erc-nick-default-face erc-nick-msg-face erc-notice-face erc-pal-face erc-prompt-face erc-timestamp-face erc-underline-face eshell-ls-archive eshell-ls-backup eshell-ls-clutter eshell-ls-directory eshell-ls-executable eshell-ls-missing eshell-ls-product eshell-ls-special eshell-ls-symlink eshell-ls-unreadable eshell-prompt fancy-widget-button fancy-widget-button-highlight fancy-widget-button-pressed fancy-widget-button-pressed-highlight fancy-widget-documentation fancy-widget-field fancy-widget-inactive fancy-widget-single-line-field flyspell-duplicate flyspell-incorrect font-latex-bold font-latex-sedate font-latex-title-4 font-latex-warning font-lock-builtin-face font-lock-comment-delimiter-face font-lock-comment-face font-lock-constant-face font-lock-doc-face font-lock-doc-string-face font-lock-function-name-face font-lock-keyword-face font-lock-negation-char-face font-lock-operator-face font-lock-preprocessor-face font-lock-pseudo-keyword-face font-lock-string-face font-lock-type-face font-lock-variable-name-face font-lock-warning-face gnus-cite-1-face gnus-cite-10-face gnus-cite-11-face gnus-cite-2-face gnus-cite-3-face gnus-cite-4-face gnus-cite-5-face gnus-cite-6-face gnus-cite-7-face gnus-cite-8-face gnus-cite-9-face gnus-group-mail-1-empty-face gnus-group-mail-1-face gnus-group-mail-2-empty-face gnus-group-mail-2-face gnus-group-mail-3-empty-face gnus-group-mail-3-face gnus-group-mail-4-empty-face gnus-group-mail-4-face gnus-group-mail-5-empty-face gnus-group-mail-5-face gnus-group-mail-6-empty-face gnus-group-mail-6-face gnus-group-mail-low-empty-face gnus-group-mail-low-face gnus-group-news-1-empty-face gnus-group-news-1-face gnus-group-news-2-empty-face gnus-group-news-2-face gnus-group-news-3-empty-face gnus-group-news-3-face gnus-group-news-4-empty-face gnus-group-news-4-face gnus-group-news-5-empty-face gnus-group-news-5-face gnus-group-news-6-empty-face gnus-group-news-6-face gnus-group-news-low-empty-face gnus-group-news-low-face gnus-header-content-face gnus-header-from-face gnus-header-name-face gnus-header-newsgroups-face gnus-header-subject-face gnus-signature-face gnus-summary-cancelled-face gnus-summary-high-ancient-face gnus-summary-high-read-face gnus-summary-high-ticked-face gnus-summary-high-unread-face gnus-summary-low-ancient-face gnus-summary-low-read-face gnus-summary-low-ticked-face gnus-summary-low-unread-face gnus-summary-normal-ancient-face gnus-summary-normal-read-face gnus-summary-normal-ticked-face gnus-summary-normal-unread-face gnus-summary-selected-face gnus-x-face helm-ff-directory helm-ff-executable helm-ff-file helm-grep-file helm-grep-match helm-header helm-match helm-selection helm-selection-line helm-source-header helm-visible-mark help-argument-name hi-blue hi-green hi-pink hi-yellow highlight-current-line hl-line holiday ibuffer-deletion ibuffer-help-buffer ibuffer-marked ibuffer-special-buffer icompletep-choices icompletep-determined icompletep-keys icompletep-nb-candidates ido-first-match ido-only-match ido-subdir imaxima-latex-error info-header-node info-header-xref info-menu-5 info-menu-header info-menu-star info-node info-title-4 info-xref info-xref-visited isearch isearch-fail jabber-chat-prompt-foreign jabber-chat-prompt-local jabber-rare-time-face jabber-roster-user-away jabber-roster-user-chatty jabber-roster-user-dnd jabber-roster-user-error jabber-roster-user-offline jabber-roster-user-online jabber-roster-user-xa jabber-title-large jabber-title-medium jabber-title-small jde-java-font-lock-constant-face jde-java-font-lock-doc-tag-face jde-java-font-lock-link-face jde-java-font-lock-modifier-face jde-java-font-lock-number-face jde-java-font-lock-operator-face jde-java-font-lock-package-face keywiz-command-face keywiz-right-face keywiz-wrong-face lazy-highlight magit-branch magit-item-highlight magit-section-title makefile-shell makefile-space message-cited-text-face message-header-cc-face message-header-from-face message-header-name-face message-header-newsgroups-face message-header-other-face message-header-subject-face message-header-to-face message-header-xheader-face message-mml-face message-separator-face minimap-active-region-background mm/master-face mm/mirror-face org-agenda-clocking org-agenda-date org-agenda-date-today org-agenda-date-weekend org-agenda-structure org-archived org-checkbox org-date org-deadline-announce org-document-title org-done org-formula org-headline-done org-hide org-level-1 org-level-2 org-level-3 org-level-4 org-level-5 org-level-6 org-level-7 org-level-8 org-link org-scheduled org-scheduled-previously org-scheduled-today org-special-keyword org-table org-tag org-time-grid org-todo org-upcoming-deadline org-warning outline-1 outline-2 outline-3 outline-4 outline-5 outline-6 outline-7 outline-8 rainbow-delimiters-depth-1-face rainbow-delimiters-depth-10-face rainbow-delimiters-depth-11-face rainbow-delimiters-depth-12-face rainbow-delimiters-depth-2-face rainbow-delimiters-depth-3-face rainbow-delimiters-depth-4-face rainbow-delimiters-depth-5-face rainbow-delimiters-depth-6-face rainbow-delimiters-depth-7-face rainbow-delimiters-depth-8-face rainbow-delimiters-depth-9-face rcirc-bright-nick rcirc-dim-nick rcirc-mode-line-nick rcirc-my-nick rcirc-nick-in-message rcirc-other-nick rcirc-prompt rcirc-server rcirc-server-prefix rcirc-timestamp rst-level-1-face rst-level-2-face rst-level-3-face rst-level-4-face setnu-line-number show-paren-match show-paren-mismatch speedbar-button-face speedbar-directory-face speedbar-file-face speedbar-highlight-face speedbar-tag-face strokes-char-face todoo-item-assigned-header-face todoo-item-header-face todoo-sub-item-header-face tuareg-font-lock-governing-face tuareg-font-lock-interactive-error-face tuareg-font-lock-interactive-output-face tuareg-font-lock-operator-face twittering-uri-face twittering-username-face w3m-anchor-face w3m-arrived-anchor-face w3m-form-button-face w3m-form-button-mouse-face w3m-form-button-pressed-face w3m-form-face w3m-image-face w3m-tab-background-face w3m-tab-selected-face w3m-tab-selected-retrieving-face w3m-tab-unselected-face w3m-tab-unselected-retrieving-face wg-brace-face wg-command-face wg-current-workgroup-face wg-divider-face wg-filename-face wg-frame-face wg-message-face wg-mode-line-face wg-other-workgroup-face wg-previous-workgroup-face wgrep-delete-face wgrep-face which-func wl-highlight-folder-few-face wl-highlight-folder-many-face wl-highlight-folder-path-face wl-highlight-folder-unknown-face wl-highlight-folder-unread-face wl-highlight-folder-zero-face wl-highlight-message-citation-header wl-highlight-message-cited-text-1 wl-highlight-message-cited-text-2 wl-highlight-message-cited-text-3 wl-highlight-message-cited-text-4 wl-highlight-message-header-contents wl-highlight-message-header-contents-face wl-highlight-message-headers-face wl-highlight-message-important-header-contents wl-highlight-message-important-header-contents2 wl-highlight-message-signature wl-highlight-message-unimportant-header-contents wl-highlight-summary-answered-face wl-highlight-summary-displaying-face wl-highlight-summary-disposed-face wl-highlight-summary-new-face wl-highlight-summary-normal-face wl-highlight-summary-refiled-face wl-highlight-summary-thread-top-face wl-highlight-thread-indent-face))

(defun my-add-theme-faces ()
  (interactive)
  (let ((mf my-faces))
	(while mf
	  (let ((elem (car mf)))
		(custom-theme-add-face elem)
		(setq mf (cdr mf)))))
  )

(provide 'my-theme)
