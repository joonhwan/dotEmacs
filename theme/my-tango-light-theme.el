(deftheme my-tango-light
  "my tango light")

(custom-theme-set-faces
 'my-tango-light
 '(default ((t (:family "Menlo" :foundry "apple" :width normal :height 120 :weight normal :slant normal :underline nil :overline nil :strike-through nil :box nil :inverse-video nil :foreground "#2e3436" :background "#eeeeec" :stipple nil :inherit nil))))
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:slant italic :weight bold))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(italic ((((supports :slant italic)) (:slant italic)) (((supports :underline t)) (:underline (:color foreground-color :style line))) (t (:slant italic))))
 '(underline ((((supports :underline t)) (:underline (:color foreground-color :style line))) (((supports :weight bold)) (:weight bold)) (t (:underline (:color foreground-color :style line)))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(fringe ((t (:background "#d3d7cf"))))
 '(header-line ((default (:inherit (mode-line))) (((type tty)) (:underline (:color foreground-color :style line) :inverse-video nil)) (((class color grayscale) (background light)) (:box nil :foreground "grey20" :background "grey90")) (((class color grayscale) (background dark)) (:box nil :foreground "grey90" :background "grey20")) (((class mono) (background light)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "black" :background "white")) (((class mono) (background dark)) (:underline (:color foreground-color :style line) :box nil :inverse-video nil :foreground "white" :background "black"))))
 '(highlight ((t (:background "#babdb6"))))
 '(hover-highlight ((t nil)))
 '(match ((((class color) (min-colors 88) (background light)) (:background "yellow1")) (((class color) (min-colors 88) (background dark)) (:background "RoyalBlue3")) (((class color) (min-colors 8) (background light)) (:foreground "black" :background "yellow")) (((class color) (min-colors 8) (background dark)) (:foreground "white" :background "blue")) (((type tty) (class mono)) (:inverse-video t)) (t (:background "gray"))))
 '(menu ((((type tty)) (:inverse-video t)) (((type x-toolkit)) nil) (t (:inverse-video t))))
 '(mouse ((t nil)))
 '(paren ((t nil)))
 '(trailing-whitespace ((t (:background "#ef2929"))))
 '(buffer-menu-buffer ((t (:weight bold))))
 '(border ((t nil)))
 '(button ((t (:inherit (link)))))
 '(cursor ((t (:background "#204a87"))))
 '(escape-glyph-face ((t nil)))
 '(link ((t (:underline (:color foreground-color :style line) :foreground "#204a87"))))
 '(minibuffer-prompt ((t (:weight bold :foreground "#204a87"))))
 '(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#2e3436" :background "#d3d7cf"))))
 '(mode-line-inactive ((t (:weight light :box (:line-width -1 :color nil :style released-button) :foreground "#2e3436" :background "#888a85" :inherit (mode-line)))))
 '(mode-line-buffer-id ((t (:weight bold))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(region ((t (:background "#babdb6"))))
 '(scroll-bar ((t nil)))
 '(secondary-selection ((t (:background "#8cc4ff"))))
 '(tool-bar ((default (:foreground "black" :box (:line-width 1 :color nil :style released-button))) (((type x w32 ns) (class color)) (:background "grey75")) (((type x) (class mono)) (:background "grey"))))
 '(apt-utils-broken ((t nil)))
 '(apt-utils-description ((t nil)))
 '(apt-utils-field-contents ((t nil)))
 '(apt-utils-field-keyword ((t nil)))
 '(apt-utils-normal-package ((t nil)))
 '(apt-utils-summary ((t nil)))
 '(apt-utils-version ((t nil)))
 '(apt-utils-virtual-package ((t nil)))
 '(breakpoint-disabled-bitmap ((t nil)))
 '(breakpoint-enabled-bitmap ((t nil)))
 '(calendar-today ((t (:underline (:color foreground-color :style line)))))
 '(change-log-date ((t (:inherit (font-lock-string-face)))))
 '(circe-highlight-nick-face ((t nil)))
 '(circe-my-message-face ((t nil)))
 '(circe-originator-face ((t nil)))
 '(circe-prompt-face ((t nil)))
 '(circe-server-face ((t nil)))
 '(comint-highlight-input ((t (:weight bold))))
 '(comint-highlight-prompt ((t (:inherit (minibuffer-prompt)))))
 '(compilation-info ((t (:inherit (success)))))
 '(compilation-warning ((t (:inherit (warning)))))
 '(cscope-line-face ((((class color) (background dark)) (:foreground "green")) (((class color) (background light)) (:foreground "black")) (t (:bold nil))))
 '(cua-rectangle ((default (:inherit (region))) (((class color)) (:background "maroon" :foreground "white"))))
 '(custom-button ((((type x w32 ns) (class color)) (:foreground "black" :background "lightgrey" :box (:line-width 2 :color nil :style released-button)))))
 '(custom-button-pressed ((((type x w32 ns) (class color)) (:foreground "black" :background "lightgrey" :box (:line-width 2 :color nil :style pressed-button))) (t (:inverse-video t))))
 '(custom-changed ((((min-colors 88) (class color)) (:background "blue1" :foreground "white")) (((class color)) (:background "blue" :foreground "white")) (t (:slant italic))))
 '(custom-comment ((((type tty)) (:foreground "black" :background "yellow3")) (((class grayscale color) (background light)) (:background "gray85")) (((class grayscale color) (background dark)) (:background "dim gray")) (t (:slant italic))))
 '(custom-comment-tag ((((class color) (background dark)) (:foreground "gray80")) (((class color) (background light)) (:foreground "blue4")) (((class grayscale) (background light)) (:slant italic :weight bold :foreground "DimGray")) (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "LightGray")) (t (:weight bold))))
 '(custom-documentation ((t nil)))
 '(custom-group-tag ((default (:inherit (variable-pitch) :height 1.2 :weight bold)) (((class color) (background dark)) (:foreground "light blue")) (((min-colors 88) (class color) (background light)) (:foreground "blue1")) (((class color) (background light)) (:foreground "blue")) (t (:weight bold))))
 '(custom-group-tag-1 ((default (:inherit (variable-pitch) :height 1.2 :weight bold)) (((class color) (background dark)) (:foreground "pink")) (((min-colors 88) (class color) (background light)) (:foreground "red1")) (((class color) (background light)) (:foreground "red"))))
 '(custom-invalid ((((class color)) (:background "red1" :foreground "yellow1")) (t (:underline (:color foreground-color :style line) :slant italic :weight bold))))
 '(custom-link ((t (:inherit (link)))))
 '(custom-modified ((((min-colors 88) (class color)) (:background "blue1" :foreground "white")) (((class color)) (:background "blue" :foreground "white")) (t (:slant italic))))
 '(custom-rogue ((((class color)) (:background "black" :foreground "pink")) (t (:underline (:color foreground-color :style line)))))
 '(custom-saved ((t (:underline (:color foreground-color :style line)))))
 '(custom-set ((((min-colors 88) (class color)) (:background "white" :foreground "blue1")) (((class color)) (:background "white" :foreground "blue")) (t (:slant italic))))
 '(custom-state ((((class color) (background dark)) (:foreground "lime green")) (((class color) (background light)) (:foreground "dark green"))))
 '(custom-tag ((t nil)))
 '(custom-variable-button ((t (:weight bold :underline (:color foreground-color :style line)))))
 '(custom-variable-tag ((((class color) (background dark)) (:weight bold :foreground "light blue")) (((min-colors 88) (class color) (background light)) (:weight bold :foreground "blue1")) (((class color) (background light)) (:weight bold :foreground "blue")) (t (:weight bold))))
 '(diary ((((min-colors 88) (class color) (background light)) (:foreground "red1")) (((class color) (background light)) (:foreground "red")) (((min-colors 88) (class color) (background dark)) (:foreground "yellow1")) (((class color) (background dark)) (:foreground "yellow")) (t (:weight bold))))
 '(dictionary-button ((t nil)))
 '(dictionary-reference ((t nil)))
 '(dictionary-word-entry ((t nil)))
 '(diff-added-face ((t (:background "#ddffdd" :inherit (diff-changed)))))
 '(diff-context-face ((t (:inherit (shadow)))))
 '(diff-file-header-face ((t (:weight bold :background "grey70"))))
 '(diff-header-face ((t (:background "grey80"))))
 '(diff-hunk-header-face ((t (:inherit (diff-header)))))
 '(diff-index-face ((t (:inherit (diff-file-header)))))
 '(diff-refine-added ((default (:inherit (diff-refine-change))) (((class color) (min-colors 88) (background light)) (:background "#aaffaa")) (((class color) (min-colors 88) (background dark)) (:background "#22aa22"))))
 '(diff-refine-change-face ((t nil)))
 '(diff-removed-face ((t (:background "#ffdddd" :inherit (diff-changed)))))
 '(diredp-compressed-file-suffix ((t nil)))
 '(diredp-date-time ((t nil)))
 '(diredp-default ((t nil)))
 '(diredp-deletion ((t nil)))
 '(diredp-deletion-file-name ((t nil)))
 '(diredp-dir-heading ((t nil)))
 '(diredp-dir-priv ((t nil)))
 '(diredp-display-msg ((t nil)))
 '(diredp-exec-priv ((t nil)))
 '(diredp-executable-tag ((t nil)))
 '(diredp-file-name ((t nil)))
 '(diredp-file-suffix ((t nil)))
 '(diredp-flag-mark ((t nil)))
 '(diredp-flag-mark-line ((t nil)))
 '(diredp-ignored-file-name ((t nil)))
 '(diredp-link-priv ((t nil)))
 '(diredp-no-priv ((t nil)))
 '(diredp-number ((t nil)))
 '(diredp-other-priv ((t nil)))
 '(diredp-rare-priv ((t nil)))
 '(diredp-read-priv ((t nil)))
 '(diredp-symlink ((t nil)))
 '(diredp-write-priv ((t nil)))
 '(ediff-current-diff-A ((t (:background "#729fcf"))))
 '(ediff-current-diff-B ((t (:background "#fce94f"))))
 '(ediff-current-diff-C ((t nil)))
 '(ediff-old-diff-A ((t nil)))
 '(ediff-old-diff-B ((t nil)))
 '(ediff-old-diff-C ((t nil)))
 '(emms-pbi-current ((t nil)))
 '(emms-pbi-mark-marked ((t nil)))
 '(emms-pbi-song ((t nil)))
 '(erc-action-face ((t (:weight bold))))
 '(erc-bold-face ((t (:weight bold))))
 '(erc-current-nick-face ((t (:foreground "DarkTurquoise" :weight bold))))
 '(erc-dangerous-host-face ((t (:foreground "red"))))
 '(erc-default-face ((t nil)))
 '(erc-direct-msg-face ((t (:foreground "IndianRed"))))
 '(erc-error-face ((t (:foreground "red"))))
 '(erc-fool-face ((t (:foreground "dim gray"))))
 '(erc-highlight-face ((t nil)))
 '(erc-input-face ((t (:foreground "brown"))))
 '(erc-keyword-face ((t (:foreground "pale green" :weight bold))))
 '(erc-my-nick-face ((t (:foreground "brown" :weight bold))))
 '(erc-nick-default-face ((t (:weight bold))))
 '(erc-nick-msg-face ((t (:foreground "IndianRed" :weight bold))))
 '(erc-notice-face ((default (:weight bold)) (((class color) (min-colors 88)) (:foreground "SlateBlue")) (t (:foreground "blue"))))
 '(erc-pal-face ((t (:foreground "Magenta" :weight bold))))
 '(erc-prompt-face ((t (:background "lightBlue2" :foreground "Black" :weight bold))))
 '(erc-timestamp-face ((t nil)))
 '(erc-underline-face ((t (:underline (:color foreground-color :style line)))))
 '(eshell-ls-archive ((t nil)))
 '(eshell-ls-backup ((t nil)))
 '(eshell-ls-clutter ((t nil)))
 '(eshell-ls-directory ((t nil)))
 '(eshell-ls-executable ((t nil)))
 '(eshell-ls-missing ((t nil)))
 '(eshell-ls-product ((t nil)))
 '(eshell-ls-special ((t nil)))
 '(eshell-ls-symlink ((t nil)))
 '(eshell-ls-unreadable ((t nil)))
 '(eshell-prompt ((t nil)))
 '(fancy-widget-button ((t nil)))
 '(fancy-widget-button-highlight ((t nil)))
 '(fancy-widget-button-pressed ((t nil)))
 '(fancy-widget-button-pressed-highlight ((t nil)))
 '(fancy-widget-documentation ((t nil)))
 '(fancy-widget-field ((t nil)))
 '(fancy-widget-inactive ((t nil)))
 '(fancy-widget-single-line-field ((t nil)))
 '(flyspell-duplicate ((t (:underline (:color "#fcaf3e" :style line)))))
 '(flyspell-incorrect ((t (:underline (:color "#ef2929" :style line)))))
 '(font-latex-bold ((t nil)))
 '(font-latex-sedate ((t nil)))
 '(font-latex-title-4 ((t nil)))
 '(font-latex-warning ((t nil)))
 '(font-lock-builtin-face ((t (:foreground "#75507b"))))
 '(font-lock-comment-delimiter-face ((default (:inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:slant italic :foreground "#5fa15c"))))
 '(font-lock-constant-face ((t (:weight bold :foreground "#204a87"))))
 '(font-lock-doc-face ((t (:inherit (font-lock-string-face)))))
 '(font-lock-doc-string-face ((t nil)))
 '(font-lock-function-name-face ((t (:foreground "#a40000"))))
 '(font-lock-keyword-face ((t (:foreground "#346604"))))
 '(font-lock-negation-char-face ((t nil)))
 '(font-lock-operator-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:inherit (font-lock-builtin-face)))))
 '(font-lock-pseudo-keyword-face ((t nil)))
 '(font-lock-string-face ((t (:foreground "#5c3566"))))
 '(font-lock-type-face ((t (:foreground "#204a87"))))
 '(font-lock-variable-name-face ((t (:foreground "#b35000"))))
 '(font-lock-warning-face ((t (:inherit (error)))))
 '(gnus-cite-1-face ((t nil)))
 '(gnus-cite-10-face ((t nil)))
 '(gnus-cite-11-face ((t nil)))
 '(gnus-cite-2-face ((t nil)))
 '(gnus-cite-3-face ((t nil)))
 '(gnus-cite-4-face ((t nil)))
 '(gnus-cite-5-face ((t nil)))
 '(gnus-cite-6-face ((t nil)))
 '(gnus-cite-7-face ((t nil)))
 '(gnus-cite-8-face ((t nil)))
 '(gnus-cite-9-face ((t nil)))
 '(gnus-group-mail-1-empty-face ((t nil)))
 '(gnus-group-mail-1-face ((t nil)))
 '(gnus-group-mail-2-empty-face ((t nil)))
 '(gnus-group-mail-2-face ((t nil)))
 '(gnus-group-mail-3-empty-face ((t nil)))
 '(gnus-group-mail-3-face ((t nil)))
 '(gnus-group-mail-4-empty-face ((t nil)))
 '(gnus-group-mail-4-face ((t nil)))
 '(gnus-group-mail-5-empty-face ((t nil)))
 '(gnus-group-mail-5-face ((t nil)))
 '(gnus-group-mail-6-empty-face ((t nil)))
 '(gnus-group-mail-6-face ((t nil)))
 '(gnus-group-mail-low-empty-face ((t nil)))
 '(gnus-group-mail-low-face ((t nil)))
 '(gnus-group-news-1-empty-face ((t nil)))
 '(gnus-group-news-1-face ((t nil)))
 '(gnus-group-news-2-empty-face ((t nil)))
 '(gnus-group-news-2-face ((t nil)))
 '(gnus-group-news-3-empty-face ((t nil)))
 '(gnus-group-news-3-face ((t nil)))
 '(gnus-group-news-4-empty-face ((t nil)))
 '(gnus-group-news-4-face ((t nil)))
 '(gnus-group-news-5-empty-face ((t nil)))
 '(gnus-group-news-5-face ((t nil)))
 '(gnus-group-news-6-empty-face ((t nil)))
 '(gnus-group-news-6-face ((t nil)))
 '(gnus-group-news-low-empty-face ((t nil)))
 '(gnus-group-news-low-face ((t nil)))
 '(gnus-header-content-face ((t nil)))
 '(gnus-header-from-face ((t nil)))
 '(gnus-header-name-face ((t nil)))
 '(gnus-header-newsgroups-face ((t nil)))
 '(gnus-header-subject-face ((t nil)))
 '(gnus-signature-face ((t nil)))
 '(gnus-summary-cancelled-face ((t nil)))
 '(gnus-summary-high-ancient-face ((t nil)))
 '(gnus-summary-high-read-face ((t nil)))
 '(gnus-summary-high-ticked-face ((t nil)))
 '(gnus-summary-high-unread-face ((t nil)))
 '(gnus-summary-low-ancient-face ((t nil)))
 '(gnus-summary-low-read-face ((t nil)))
 '(gnus-summary-low-ticked-face ((t nil)))
 '(gnus-summary-low-unread-face ((t nil)))
 '(gnus-summary-normal-ancient-face ((t nil)))
 '(gnus-summary-normal-read-face ((t nil)))
 '(gnus-summary-normal-ticked-face ((t nil)))
 '(gnus-summary-normal-unread-face ((t nil)))
 '(gnus-summary-selected-face ((t nil)))
 '(gnus-x-face ((t nil)))
 '(helm-ff-directory ((t (:background "LightGray" :foreground "DarkRed"))))
 '(helm-ff-executable ((t (:foreground "green"))))
 '(helm-ff-file ((t (:inherit (font-lock-builtin-face)))))
 '(helm-grep-file ((t (:underline (:color foreground-color :style line) :foreground "BlueViolet"))))
 '(helm-grep-match ((t (:inherit (match)))))
 '(helm-header ((t (:inherit (header-line)))))
 '(helm-match ((t (:inherit (match)))))
 '(helm-selection ((((background dark)) (:underline (:color foreground-color :style line) :background "ForestGreen")) (((background light)) (:underline (:color foreground-color :style line) :background "#b5ffd1"))))
 '(helm-selection-line ((t (:underline (:color foreground-color :style line) :background "IndianRed4"))))
 '(helm-source-header ((((background dark)) (:family "Sans Serif" :height 1.3 :weight bold :foreground "white" :background "#22083397778B")) (((background light)) (:family "Sans Serif" :height 1.3 :weight bold :foreground "black" :background "#abd7f0"))))
 '(helm-visible-mark ((((min-colors 88) (background dark)) (:foreground "black" :background "green1")) (((background dark)) (:foreground "black" :background "green")) (((background light)) (:background "#d1f5ea")) (((min-colors 88)) (:background "green1")) (t (:background "green"))))
 '(help-argument-name ((t (:inherit (italic)))))
 '(hi-blue ((((background dark)) (:foreground "black" :background "light blue")) (t (:background "light blue"))))
 '(hi-green ((((min-colors 88) (background dark)) (:foreground "black" :background "green1")) (((background dark)) (:foreground "black" :background "green")) (((min-colors 88)) (:background "green1")) (t (:background "green"))))
 '(hi-pink ((((background dark)) (:foreground "black" :background "pink")) (t (:background "pink"))))
 '(hi-yellow ((((min-colors 88) (background dark)) (:foreground "black" :background "yellow1")) (((background dark)) (:foreground "black" :background "yellow")) (((min-colors 88)) (:background "yellow1")) (t (:background "yellow"))))
 '(highlight-current-line ((t nil)))
 '(hl-line ((t (:inherit (highlight)))))
 '(holiday ((((class color) (background light)) (:background "pink")) (((class color) (background dark)) (:background "chocolate4")) (t (:inverse-video t))))
 '(ibuffer-deletion ((t nil)))
 '(ibuffer-help-buffer ((t nil)))
 '(ibuffer-marked ((t nil)))
 '(ibuffer-special-buffer ((t nil)))
 '(icompletep-choices ((t nil)))
 '(icompletep-determined ((t nil)))
 '(icompletep-keys ((t nil)))
 '(icompletep-nb-candidates ((t nil)))
 '(ido-first-match ((t (:weight bold))))
 '(ido-only-match ((((class color)) (:foreground "ForestGreen")) (t (:slant italic))))
 '(ido-subdir ((((min-colors 88) (class color)) (:foreground "red1")) (((class color)) (:foreground "red")) (t (:underline (:color foreground-color :style line)))))
 '(imaxima-latex-error ((t nil)))
 '(info-header-node ((t (:inherit (info-node)))))
 '(info-header-xref ((t (:inherit (info-xref)))))
 '(info-menu-5 ((t nil)))
 '(info-menu-header ((((type tty pc)) (:weight bold :underline (:color foreground-color :style line))) (t (:weight bold :inherit (variable-pitch)))))
 '(info-menu-star ((t nil)))
 '(info-node ((((class color) (background light)) (:slant italic :weight bold :foreground "brown")) (((class color) (background dark)) (:slant italic :weight bold :foreground "white")) (t (:slant italic :weight bold))))
 '(info-title-4 ((((type tty pc) (class color)) (:weight bold)) (t (:inherit (variable-pitch) :weight bold))))
 '(info-xref ((t (:inherit (link)))))
 '(info-xref-visited ((t (:inherit (link-visited info-xref)))))
 '(isearch ((t (:foreground "#ffffff" :background "#ce5c00"))))
 '(isearch-fail ((((class color) (min-colors 88) (background light)) (:background "RosyBrown1")) (((class color) (min-colors 88) (background dark)) (:background "red4")) (((class color) (min-colors 16)) (:background "red")) (((class color) (min-colors 8)) (:background "red")) (((class color grayscale)) (:foreground "grey")) (t (:inverse-video t))))
 '(jabber-chat-prompt-foreign ((t nil)))
 '(jabber-chat-prompt-local ((t nil)))
 '(jabber-rare-time-face ((t nil)))
 '(jabber-roster-user-away ((t nil)))
 '(jabber-roster-user-chatty ((t nil)))
 '(jabber-roster-user-dnd ((t nil)))
 '(jabber-roster-user-error ((t nil)))
 '(jabber-roster-user-offline ((t nil)))
 '(jabber-roster-user-online ((t nil)))
 '(jabber-roster-user-xa ((t nil)))
 '(jabber-title-large ((t nil)))
 '(jabber-title-medium ((t nil)))
 '(jabber-title-small ((t nil)))
 '(jde-java-font-lock-constant-face ((t nil)))
 '(jde-java-font-lock-doc-tag-face ((t nil)))
 '(jde-java-font-lock-link-face ((t nil)))
 '(jde-java-font-lock-modifier-face ((t nil)))
 '(jde-java-font-lock-number-face ((t nil)))
 '(jde-java-font-lock-operator-face ((t nil)))
 '(jde-java-font-lock-package-face ((t nil)))
 '(keywiz-command-face ((t (:inherit (quote variable-pitch) :height 1.2 :weight bold :foreground "Blue"))))
 '(keywiz-right-face ((t (:foreground "dark green"))))
 '(keywiz-wrong-face ((t (:foreground "Red"))))
 '(lazy-highlight ((t (:background "#e9b96e"))))
 '(magit-branch ((t (:inherit (magit-header)))))
 '(magit-item-highlight ((t (:inherit (highlight)))))
 '(magit-section-title ((t (:inherit (magit-header)))))
 '(makefile-shell ((t nil)))
 '(makefile-space ((t nil)))
 '(message-cited-text-face ((t nil)))
 '(message-header-cc-face ((t nil)))
 '(message-header-from-face ((t nil)))
 '(message-header-name-face ((t nil)))
 '(message-header-newsgroups-face ((t nil)))
 '(message-header-other-face ((t nil)))
 '(message-header-subject-face ((t nil)))
 '(message-header-to-face ((t nil)))
 '(message-header-xheader-face ((t nil)))
 '(message-mml-face ((t nil)))
 '(message-separator-face ((t nil)))
 '(minimap-active-region-background ((t nil)))
 '(mm/master-face ((t nil)))
 '(mm/mirror-face ((t nil)))
 '(org-agenda-clocking ((t nil)))
 '(org-agenda-date ((t nil)))
 '(org-agenda-date-today ((t nil)))
 '(org-agenda-date-weekend ((t nil)))
 '(org-agenda-structure ((((class color) (min-colors 88) (background light)) (:foreground "Blue1")) (((class color) (min-colors 88) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 16) (background light)) (:foreground "Blue")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 8)) (:bold t :foreground "blue")) (t (:bold t))))
 '(org-archived ((t (:inherit (shadow)))))
 '(org-checkbox ((t (:inherit (bold)))))
 '(org-date ((((class color) (background light)) (:underline (:color foreground-color :style line) :foreground "Purple")) (((class color) (background dark)) (:underline (:color foreground-color :style line) :foreground "Cyan")) (t (:underline (:color foreground-color :style line)))))
 '(org-deadline-announce ((t nil)))
 '(org-document-title ((((class color) (background light)) (:weight bold :foreground "midnight blue")) (((class color) (background dark)) (:weight bold :foreground "pale turquoise")) (t (:weight bold))))
 '(org-done ((((class color) (min-colors 16) (background light)) (:bold t :foreground "ForestGreen")) (((class color) (min-colors 16) (background dark)) (:bold t :foreground "PaleGreen")) (((class color) (min-colors 8)) (:foreground "green")) (t (:bold t))))
 '(org-formula ((((class color) (min-colors 88) (background light)) (:foreground "Firebrick")) (((class color) (min-colors 88) (background dark)) (:foreground "chocolate1")) (((class color) (min-colors 8) (background light)) (:foreground "red")) (((class color) (min-colors 8) (background dark)) (:foreground "red")) (t (:italic t :bold t))))
 '(org-headline-done ((((class color) (min-colors 16) (background light)) (:foreground "RosyBrown")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSalmon")) (((class color) (min-colors 8) (background light)) (:bold nil))))
 '(org-hide ((t (:foreground "#202a24"))))
 '(org-level-1 ((t (:inherit (outline-1)))))
 '(org-level-2 ((t (:inherit (outline-2)))))
 '(org-level-3 ((t (:inherit (outline-3)))))
 '(org-level-4 ((t (:inherit (outline-4)))))
 '(org-level-5 ((t (:inherit (outline-5)))))
 '(org-level-6 ((t (:inherit (outline-6)))))
 '(org-level-7 ((t (:inherit (outline-7)))))
 '(org-level-8 ((t (:inherit (outline-8)))))
 '(org-link ((t (:inherit (link)))))
 '(org-scheduled ((((class color) (min-colors 88) (background light)) (:foreground "DarkGreen")) (((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen")) (((class color) (min-colors 8)) (:foreground "green")) (t (:italic t :bold t))))
 '(org-scheduled-previously ((((class color) (min-colors 88) (background light)) (:foreground "Firebrick")) (((class color) (min-colors 88) (background dark)) (:foreground "chocolate1")) (((class color) (min-colors 8) (background light)) (:foreground "red")) (((class color) (min-colors 8) (background dark)) (:bold t :foreground "red")) (t (:bold t))))
 '(org-scheduled-today ((((class color) (min-colors 88) (background light)) (:foreground "DarkGreen")) (((class color) (min-colors 88) (background dark)) (:foreground "PaleGreen")) (((class color) (min-colors 8)) (:foreground "green")) (t (:italic t :bold t))))
 '(org-special-keyword ((t (:inherit (font-lock-keyword-face)))))
 '(org-table ((((class color) (min-colors 88) (background light)) (:foreground "Blue1")) (((class color) (min-colors 88) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 16) (background light)) (:foreground "Blue")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 8) (background light)) (:foreground "blue")) (((class color) (min-colors 8) (background dark)) nil)))
 '(org-tag ((t (:bold t))))
 '(org-time-grid ((((class color) (min-colors 16) (background light)) (:foreground "DarkGoldenrod")) (((class color) (min-colors 16) (background dark)) (:foreground "LightGoldenrod")) (((class color) (min-colors 8)) (:weight light :foreground "yellow"))))
 '(org-todo ((((class color) (min-colors 16) (background light)) (:bold t :foreground "Red1")) (((class color) (min-colors 16) (background dark)) (:bold t :foreground "Pink")) (((class color) (min-colors 8) (background light)) (:bold t :foreground "red")) (((class color) (min-colors 8) (background dark)) (:bold t :foreground "red")) (t (:bold t :inverse-video t))))
 '(org-upcoming-deadline ((((class color) (min-colors 88) (background light)) (:foreground "Firebrick")) (((class color) (min-colors 88) (background dark)) (:foreground "chocolate1")) (((class color) (min-colors 8) (background light)) (:foreground "red")) (((class color) (min-colors 8) (background dark)) (:bold t :foreground "red")) (t (:bold t))))
 '(org-warning ((t (:inherit (font-lock-warning-face)))))
 '(outline-1 ((t (:inherit (font-lock-function-name-face)))))
 '(outline-2 ((t (:inherit (font-lock-variable-name-face)))))
 '(outline-3 ((t (:inherit (font-lock-keyword-face)))))
 '(outline-4 ((t (:inherit (font-lock-comment-face)))))
 '(outline-5 ((t (:inherit (font-lock-type-face)))))
 '(outline-6 ((t (:inherit (font-lock-constant-face)))))
 '(outline-7 ((t (:inherit (font-lock-builtin-face)))))
 '(outline-8 ((t (:inherit (font-lock-string-face)))))
 '(rainbow-delimiters-depth-1-face ((((background light)) (:foreground "#707183")) (((background dark)) (:foreground "grey55"))))
 '(rainbow-delimiters-depth-10-face ((t nil)))
 '(rainbow-delimiters-depth-11-face ((t nil)))
 '(rainbow-delimiters-depth-12-face ((t nil)))
 '(rainbow-delimiters-depth-2-face ((((background light)) (:foreground "#7388d6")) (((background dark)) (:foreground "#93a8c6"))))
 '(rainbow-delimiters-depth-3-face ((((background light)) (:foreground "#909183")) (((background dark)) (:foreground "#b0b1a3"))))
 '(rainbow-delimiters-depth-4-face ((((background light)) (:foreground "#709870")) (((background dark)) (:foreground "#97b098"))))
 '(rainbow-delimiters-depth-5-face ((((background light)) (:foreground "#907373")) (((background dark)) (:foreground "#aebed8"))))
 '(rainbow-delimiters-depth-6-face ((((background light)) (:foreground "#6276ba")) (((background dark)) (:foreground "#b0b0b3"))))
 '(rainbow-delimiters-depth-7-face ((((background light)) (:foreground "#858580")) (((background dark)) (:foreground "#90a890"))))
 '(rainbow-delimiters-depth-8-face ((((background light)) (:foreground "#80a880")) (((background dark)) (:foreground "#a2b6da"))))
 '(rainbow-delimiters-depth-9-face ((((background light)) (:foreground "#887070")) (((background dark)) (:foreground "#9cb6ad"))))
 '(rcirc-bright-nick ((((class grayscale) (background light)) (:underline (:color foreground-color :style line) :weight bold :foreground "LightGray")) (((class grayscale) (background dark)) (:underline (:color foreground-color :style line) :weight bold :foreground "Gray50")) (((class color) (min-colors 88) (background light)) (:foreground "CadetBlue")) (((class color) (min-colors 88) (background dark)) (:foreground "Aquamarine")) (((class color) (min-colors 16) (background light)) (:foreground "CadetBlue")) (((class color) (min-colors 16) (background dark)) (:foreground "Aquamarine")) (((class color) (min-colors 8)) (:foreground "magenta")) (t (:underline (:color foreground-color :style line) :weight bold))))
 '(rcirc-dim-nick ((t (:inherit (default)))))
 '(rcirc-mode-line-nick ((t nil)))
 '(rcirc-my-nick ((((class color) (min-colors 88) (background light)) (:foreground "Blue1")) (((class color) (min-colors 88) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 16) (background light)) (:foreground "Blue")) (((class color) (min-colors 16) (background dark)) (:foreground "LightSkyBlue")) (((class color) (min-colors 8)) (:weight bold :foreground "blue")) (t (:weight bold :inverse-video t))))
 '(rcirc-nick-in-message ((((class grayscale) (background light)) (:weight bold :foreground "LightGray")) (((class grayscale) (background dark)) (:weight bold :foreground "DimGray")) (((class color) (min-colors 88) (background light)) (:foreground "Purple")) (((class color) (min-colors 88) (background dark)) (:foreground "Cyan1")) (((class color) (min-colors 16) (background light)) (:foreground "Purple")) (((class color) (min-colors 16) (background dark)) (:foreground "Cyan")) (((class color) (min-colors 8)) (:weight bold :foreground "cyan")) (t (:weight bold))))
 '(rcirc-other-nick ((((class grayscale) (background light)) (:slant italic :weight bold :foreground "Gray90")) (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "DimGray")) (((class color) (min-colors 88) (background light)) (:foreground "DarkGoldenrod")) (((class color) (min-colors 88) (background dark)) (:foreground "LightGoldenrod")) (((class color) (min-colors 16) (background light)) (:foreground "DarkGoldenrod")) (((class color) (min-colors 16) (background dark)) (:foreground "LightGoldenrod")) (((class color) (min-colors 8)) (:weight light :foreground "yellow")) (t (:slant italic :weight bold))))
 '(rcirc-prompt ((((min-colors 88) (background dark)) (:foreground "cyan1")) (((background dark)) (:foreground "cyan")) (t (:foreground "dark blue"))))
 '(rcirc-server ((((class grayscale) (background light)) (:slant italic :weight bold :foreground "DimGray")) (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "LightGray")) (((class color) (min-colors 88) (background light)) (:foreground "Firebrick")) (((class color) (min-colors 88) (background dark)) (:foreground "chocolate1")) (((class color) (min-colors 16) (background light)) (:foreground "red")) (((class color) (min-colors 16) (background dark)) (:foreground "red1")) (((class color) (min-colors 8) (background light)) nil) (((class color) (min-colors 8) (background dark)) nil) (t (:slant italic :weight bold))))
 '(rcirc-server-prefix ((default (:inherit (rcirc-server))) (((class grayscale)) nil) (((class color) (min-colors 16)) nil) (((class color) (min-colors 8) (background light)) (:foreground "red")) (((class color) (min-colors 8) (background dark)) (:foreground "red1"))))
 '(rcirc-timestamp ((t (:inherit (default)))))
 '(rst-level-1-face ((t nil)))
 '(rst-level-2-face ((t nil)))
 '(rst-level-3-face ((t nil)))
 '(rst-level-4-face ((t nil)))
 '(setnu-line-number ((t nil)))
 '(show-paren-match ((((class color) (background light)) (:background "turquoise")) (((class color) (background dark)) (:background "steelblue3")) (((background dark)) (:background "grey50")) (t (:background "gray"))))
 '(show-paren-mismatch ((((class color)) (:background "purple" :foreground "white")) (t (:inverse-video t))))
 '(speedbar-button-face ((((class color) (background light)) (:foreground "green4")) (((class color) (background dark)) (:foreground "green3"))))
 '(speedbar-directory-face ((((class color) (background light)) (:foreground "blue4")) (((class color) (background dark)) (:foreground "light blue"))))
 '(speedbar-file-face ((((class color) (background light)) (:foreground "cyan4")) (((class color) (background dark)) (:foreground "cyan")) (t (:weight bold))))
 '(speedbar-highlight-face ((((class color) (background light)) (:background "green")) (((class color) (background dark)) (:background "sea green"))))
 '(speedbar-tag-face ((((class color) (background light)) (:foreground "brown")) (((class color) (background dark)) (:foreground "yellow"))))
 '(strokes-char-face ((t nil)))
 '(todoo-item-assigned-header-face ((t nil)))
 '(todoo-item-header-face ((t nil)))
 '(todoo-sub-item-header-face ((t nil)))
 '(tuareg-font-lock-governing-face ((t nil)))
 '(tuareg-font-lock-interactive-error-face ((t nil)))
 '(tuareg-font-lock-interactive-output-face ((t nil)))
 '(tuareg-font-lock-operator-face ((t nil)))
 '(twittering-uri-face ((t nil)))
 '(twittering-username-face ((t nil)))
 '(w3m-anchor-face ((t nil)))
 '(w3m-arrived-anchor-face ((t nil)))
 '(w3m-form-button-face ((t nil)))
 '(w3m-form-button-mouse-face ((t nil)))
 '(w3m-form-button-pressed-face ((t nil)))
 '(w3m-form-face ((t nil)))
 '(w3m-image-face ((t nil)))
 '(w3m-tab-background-face ((t nil)))
 '(w3m-tab-selected-face ((t nil)))
 '(w3m-tab-selected-retrieving-face ((t nil)))
 '(w3m-tab-unselected-face ((t nil)))
 '(w3m-tab-unselected-retrieving-face ((t nil)))
 '(wg-brace-face ((t nil)))
 '(wg-command-face ((t nil)))
 '(wg-current-workgroup-face ((t nil)))
 '(wg-divider-face ((t nil)))
 '(wg-filename-face ((t nil)))
 '(wg-frame-face ((t nil)))
 '(wg-message-face ((t nil)))
 '(wg-mode-line-face ((t nil)))
 '(wg-other-workgroup-face ((t nil)))
 '(wg-previous-workgroup-face ((t nil)))
 '(wgrep-delete-face ((((class color) (background dark)) (:foreground "pink" :background "SlateGray1")) (((class color) (background light)) (:foreground "pink" :background "ForestGreen")) (t nil)))
 '(wgrep-face ((((class color) (background dark)) (:foreground "Black" :background "SlateGray1")) (((class color) (background light)) (:foreground "white" :background "ForestGreen")) (t nil)))
 '(which-func ((((class color) (min-colors 88) (background light)) (:inherit (font-lock-function-name-face))) (((class grayscale mono) (background dark)) (:inherit (font-lock-function-name-face))) (((class color) (background light)) (:inherit (font-lock-function-name-face))) (((class color) (min-colors 88) (background dark)) (:foreground "Blue1")) (((background dark)) (:foreground "Blue1")) (t (:foreground "LightSkyBlue"))))
 '(wl-highlight-folder-few-face ((t nil)))
 '(wl-highlight-folder-many-face ((t nil)))
 '(wl-highlight-folder-path-face ((t nil)))
 '(wl-highlight-folder-unknown-face ((t nil)))
 '(wl-highlight-folder-unread-face ((t nil)))
 '(wl-highlight-folder-zero-face ((t nil)))
 '(wl-highlight-message-citation-header ((t nil)))
 '(wl-highlight-message-cited-text-1 ((t nil)))
 '(wl-highlight-message-cited-text-2 ((t nil)))
 '(wl-highlight-message-cited-text-3 ((t nil)))
 '(wl-highlight-message-cited-text-4 ((t nil)))
 '(wl-highlight-message-header-contents ((t nil)))
 '(wl-highlight-message-header-contents-face ((t nil)))
 '(wl-highlight-message-headers-face ((t nil)))
 '(wl-highlight-message-important-header-contents ((t nil)))
 '(wl-highlight-message-important-header-contents2 ((t nil)))
 '(wl-highlight-message-signature ((t nil)))
 '(wl-highlight-message-unimportant-header-contents ((t nil)))
 '(wl-highlight-summary-answered-face ((t nil)))
 '(wl-highlight-summary-displaying-face ((t nil)))
 '(wl-highlight-summary-disposed-face ((t nil)))
 '(wl-highlight-summary-new-face ((t nil)))
 '(wl-highlight-summary-normal-face ((t nil)))
 '(wl-highlight-summary-refiled-face ((t nil)))
 '(wl-highlight-summary-thread-top-face ((t nil)))
 '(wl-highlight-thread-indent-face ((t nil))))

(provide-theme 'my-tango-light)