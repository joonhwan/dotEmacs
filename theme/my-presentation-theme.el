(deftheme my-presentation
  "Created 2014-04-10.")

(custom-theme-set-variables
 'my-presentation
 '(my-default-font-size 200))

(custom-theme-set-faces
 'my-presentation
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:slant italic :weight bold))))
 '(fixed-pitch ((t (:family "Monospace"))))
 '(italic ((((supports :slant italic)) (:slant italic)) (((supports :underline t)) (:underline (:color foreground-color :style line))) (t (:slant italic))))
 '(underline ((t (:underline (:color foreground-color :style line)))))
 '(variable-pitch ((t (:family "Sans Serif"))))
 '(fringe ((t (:foreground "#232333" :background "#f0f0f0"))))
 '(header-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#0f2050" :background "#d4d4d4" :inherit (mode-line)))))
 '(highlight ((t (:background "#c7c7c7"))))
 '(hover-highlight ((t nil)))
 '(match ((t (:weight bold :foreground "#205070" :background "#d4d4d4"))))
 '(menu ((t (:inverse-video t :foreground "#232333" :background "#c0c0c0"))))
 '(mouse ((t nil)))
 '(paren ((t nil)))
 '(trailing-whitespace ((t (:background "#336c6c"))))
 '(buffer-menu-buffer ((t (:weight bold))))
 '(border ((t nil)))
 '(button ((t (:underline (:color foreground-color :style line) :inherit (link)))))
 '(cursor ((t (:foreground "#232333" :background "black"))))
 '(escape-glyph-face ((t nil)))
 '(link ((t (:weight bold :underline (:color foreground-color :style line) :foreground "#0f2050"))))
 '(minibuffer-prompt ((t (:foreground "#0f2050"))))
 '(mode-line ((t (:box (:line-width -1 :color nil :style released-button) :foreground "#704d70" :background "#d4d4d4"))))
 '(mode-line-inactive ((t (:weight light :box (:line-width -1 :color nil :style released-button) :foreground "#a080a0" :background "#c7c7c7" :inherit (mode-line)))))
 '(mode-line-buffer-id ((t (:weight bold :foreground "#0f2050"))))
 '(mode-line-emphasis ((t (:weight bold))))
 '(mode-line-highlight ((((class color) (min-colors 88)) (:box (:line-width 2 :color "grey40" :style released-button))) (t (:inherit (highlight)))))
 '(region ((t (:background "#d4d4d4"))))
 '(scroll-bar ((t nil)))
 '(secondary-selection ((t (:background "#a0a0a0"))))
 '(tool-bar ((t (:box (:line-width 1 :color nil :style released-button) :foreground "black" :background "grey75"))))
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
 '(compilation-info ((t (:underline (:color foreground-color :style line) :foreground "#401440" :inherit (success)))))
 '(compilation-warning ((t (:inherit (warning)))))
 '(cscope-line-face ((((class color) (background dark)) (:foreground "green")) (((class color) (background light)) (:foreground "black")) (t (:bold nil))))
 '(cua-rectangle ((t (:foreground "white" :background "maroon" :inherit (region)))))
 '(custom-button ((t (:box (:line-width 2 :color nil :style released-button) :foreground "black" :background "lightgrey"))))
 '(custom-button-pressed ((t (:box (:line-width 2 :color nil :style pressed-button) :foreground "black" :background "lightgrey"))))
 '(custom-changed ((((min-colors 88) (class color)) (:background "blue1" :foreground "white")) (((class color)) (:background "blue" :foreground "white")) (t (:slant italic))))
 '(custom-comment ((((type tty)) (:foreground "black" :background "yellow3")) (((class grayscale color) (background light)) (:background "gray85")) (((class grayscale color) (background dark)) (:background "dim gray")) (t (:slant italic))))
 '(custom-comment-tag ((((class color) (background dark)) (:foreground "gray80")) (((class color) (background light)) (:foreground "blue4")) (((class grayscale) (background light)) (:slant italic :weight bold :foreground "DimGray")) (((class grayscale) (background dark)) (:slant italic :weight bold :foreground "LightGray")) (t (:weight bold))))
 '(custom-documentation ((t nil)))
 '(custom-group-tag ((t (:height 1.2 :weight bold :foreground "light blue" :inherit (variable-pitch)))))
 '(custom-group-tag-1 ((t (:height 1.2 :weight bold :foreground "pink" :inherit (variable-pitch)))))
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
 '(diff-added-face ((t (:background "#335533" :inherit (diff-changed)))))
 '(diff-context-face ((t (:inherit (shadow)))))
 '(diff-file-header-face ((t (:weight bold :background "grey60"))))
 '(diff-header-face ((t (:background "grey45"))))
 '(diff-hunk-header-face ((t (:inherit (diff-header)))))
 '(diff-index-face ((t (:inherit (diff-file-header)))))
 '(diff-refine-added ((t (:weight bold :background "#22aa22" :inherit (diff-added)))))
 '(diff-refine-change-face ((t nil)))
 '(diff-removed-face ((t (:background "#553333" :inherit (diff-changed)))))
 '(diredp-compressed-file-suffix ((t (:foreground "#205070"))))
 '(diredp-date-time ((t (:foreground "#23733c"))))
 '(diredp-default ((t nil)))
 '(diredp-deletion ((t (:foreground "#0f2050"))))
 '(diredp-deletion-file-name ((t (:foreground "#336c6c"))))
 '(diredp-dir-heading ((t (:foreground "#732f2c" :background "#d4d4d4"))))
 '(diredp-dir-priv ((t (:foreground "#6c1f1c"))))
 '(diredp-display-msg ((t (:foreground "#732f2c"))))
 '(diredp-exec-priv ((t (:foreground "#336c6c"))))
 '(diredp-executable-tag ((t (:foreground "#704d70"))))
 '(diredp-file-name ((t (:foreground "#732f2c"))))
 '(diredp-file-suffix ((t (:foreground "#806080"))))
 '(diredp-flag-mark ((t (:foreground "#0f2050"))))
 '(diredp-flag-mark-line ((t (:foreground "#205070"))))
 '(diredp-ignored-file-name ((t (:foreground "#336c6c"))))
 '(diredp-link-priv ((t (:foreground "#0f2050"))))
 '(diredp-no-priv ((t (:foreground "#232333"))))
 '(diredp-number ((t (:foreground "#704d70"))))
 '(diredp-other-priv ((t (:foreground "#1f3060"))))
 '(diredp-rare-priv ((t (:foreground "#437c7c"))))
 '(diredp-read-priv ((t (:foreground "#a080a0"))))
 '(diredp-symlink ((t (:foreground "#0f2050"))))
 '(diredp-write-priv ((t (:foreground "#23733c"))))
 '(ediff-current-diff-A ((t (:background "#555753"))))
 '(ediff-current-diff-B ((t (:background "#555753"))))
 '(ediff-current-diff-C ((t nil)))
 '(ediff-old-diff-A ((t nil)))
 '(ediff-old-diff-B ((t nil)))
 '(ediff-old-diff-C ((t nil)))
 '(emms-pbi-current ((t nil)))
 '(emms-pbi-mark-marked ((t nil)))
 '(emms-pbi-song ((t nil)))
 '(erc-action-face ((t (:weight bold :inherit (erc-default-face)))))
 '(erc-bold-face ((t (:weight bold))))
 '(erc-current-nick-face ((t (:weight bold :foreground "#732f2c"))))
 '(erc-dangerous-host-face ((t (:foreground "red" :inherit (font-lock-warning)))))
 '(erc-default-face ((t (:foreground "#232333"))))
 '(erc-direct-msg-face ((t (:foreground "IndianRed" :inherit (erc-default)))))
 '(erc-error-face ((t (:foreground "red" :inherit (font-lock-warning)))))
 '(erc-fool-face ((t (:foreground "dim gray" :inherit (erc-default)))))
 '(erc-highlight-face ((t (:inherit (hover-highlight)))))
 '(erc-input-face ((t (:foreground "#0f2050"))))
 '(erc-keyword-face ((t (:weight bold :foreground "#732f2c"))))
 '(erc-my-nick-face ((t (:weight bold :foreground "#336c6c"))))
 '(erc-nick-default-face ((t (:weight bold :foreground "#0f2050"))))
 '(erc-nick-msg-face ((t (:weight bold :foreground "IndianRed" :inherit (erc-default)))))
 '(erc-notice-face ((t (:weight bold :foreground "#806080"))))
 '(erc-pal-face ((t (:weight bold :foreground "#205070"))))
 '(erc-prompt-face ((t (:weight bold :foreground "#205070" :background "#c0c0c0"))))
 '(erc-timestamp-face ((t (:foreground "#704d70"))))
 '(erc-underline-face ((t (:underline (:color foreground-color :style line)))))
 '(eshell-ls-archive ((t (:weight bold :foreground "#437c7c"))))
 '(eshell-ls-backup ((t (:inherit (font-lock-comment)))))
 '(eshell-ls-clutter ((t (:inherit (font-lock-comment)))))
 '(eshell-ls-directory ((t (:weight bold :foreground "#6b400c"))))
 '(eshell-ls-executable ((t (:weight bold :foreground "#235c5c"))))
 '(eshell-ls-missing ((t (:inherit (font-lock-warning)))))
 '(eshell-ls-product ((t (:inherit (font-lock-doc)))))
 '(eshell-ls-special ((t (:weight bold :foreground "#0f2050"))))
 '(eshell-ls-symlink ((t (:weight bold :foreground "#6c1f1c"))))
 '(eshell-ls-unreadable ((t (:foreground "#232333"))))
 '(eshell-prompt ((t (:weight bold :foreground "#0f2050"))))
 '(fancy-widget-button ((t nil)))
 '(fancy-widget-button-highlight ((t nil)))
 '(fancy-widget-button-pressed ((t nil)))
 '(fancy-widget-button-pressed-highlight ((t nil)))
 '(fancy-widget-documentation ((t nil)))
 '(fancy-widget-field ((t nil)))
 '(fancy-widget-inactive ((t nil)))
 '(fancy-widget-single-line-field ((t nil)))
 '(flyspell-duplicate ((t (:weight bold :underline (:color foreground-color :style line) :foreground "#205070"))))
 '(flyspell-incorrect ((t (:weight bold :underline (:color foreground-color :style line) :foreground "#437c7c"))))
 '(font-latex-bold ((t (:inherit (bold)))))
 '(font-latex-sedate ((t (:weight bold :foreground "#0f2050"))))
 '(font-latex-title-4 ((t (:weight bold :inherit (variable-pitch)))))
 '(font-latex-warning ((t (:inherit (font-lock-warning)))))
 '(font-lock-builtin-face ((t (:foreground "#6c1f1c"))))
 '(font-lock-comment-delimiter-face ((t (:foreground "#806080" :inherit (font-lock-comment-face)))))
 '(font-lock-comment-face ((t (:foreground "#806080"))))
 '(font-lock-constant-face ((t (:foreground "#401440"))))
 '(font-lock-doc-face ((t (:foreground "#704d70" :inherit (font-lock-string-face)))))
 '(font-lock-doc-string-face ((t (:foreground "#935f5c"))))
 '(font-lock-function-name-face ((t (:foreground "#732f2c"))))
 '(font-lock-keyword-face ((t (:weight bold :foreground "#0f2050"))))
 '(font-lock-negation-char-face ((t (:foreground "#232333"))))
 '(font-lock-operator-face ((t nil)))
 '(font-lock-preprocessor-face ((t (:foreground "#6b400c" :inherit (font-lock-builtin-face)))))
 '(font-lock-pseudo-keyword-face ((t nil)))
 '(font-lock-string-face ((t (:foreground "#336c6c"))))
 '(font-lock-type-face ((t (:foreground "#834744"))))
 '(font-lock-variable-name-face ((t (:foreground "#205070"))))
 '(font-lock-warning-face ((t (:weight bold :foreground "#2f4070" :inherit (error)))))
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
 '(helm-ff-directory ((t (:foreground "#23733c" :background "LightGray"))))
 '(helm-ff-executable ((t (:foreground "green"))))
 '(helm-ff-file ((t (:inherit (font-lock-builtin-face)))))
 '(helm-grep-file ((t (:underline (:color foreground-color :style line) :foreground "BlueViolet"))))
 '(helm-grep-match ((t (:inherit (match)))))
 '(helm-header ((t (:underline nil :box nil :foreground "#806080" :background "#c0c0c0" :inherit (header-line)))))
 '(helm-match ((t (:inherit (match)))))
 '(helm-selection ((t (:underline nil :foreground "black" :background "#b0b0b0"))))
 '(helm-selection-line ((t (:underline (:color foreground-color :style line) :background "#b0b0b0"))))
 '(helm-source-header ((t (:family "Sans Serif" :height 1.3 :weight bold :underline nil :box (:line-width -1 :color nil :style released-button) :foreground "#0f2050" :background "#d4d4d4"))))
 '(helm-visible-mark ((t (:foreground "#c0c0c0" :background "#2f4070"))))
 '(help-argument-name ((t (:inherit (italic)))))
 '(hi-blue ((((background dark)) (:foreground "black" :background "light blue")) (t (:background "light blue"))))
 '(hi-green ((((min-colors 88) (background dark)) (:foreground "black" :background "green1")) (((background dark)) (:foreground "black" :background "green")) (((min-colors 88)) (:background "green1")) (t (:background "green"))))
 '(hi-pink ((((background dark)) (:foreground "black" :background "pink")) (t (:background "pink"))))
 '(hi-yellow ((((min-colors 88) (background dark)) (:foreground "black" :background "yellow1")) (((background dark)) (:foreground "black" :background "yellow")) (((min-colors 88)) (:background "yellow1")) (t (:background "yellow"))))
 '(highlight-current-line ((t nil)))
 '(hl-line ((t (:background "#f4f4f4" :inherit (highlight)))))
 '(holiday ((((class color) (background light)) (:background "pink")) (((class color) (background dark)) (:background "chocolate4")) (t (:inverse-video t))))
 '(ibuffer-deletion ((t nil)))
 '(ibuffer-help-buffer ((t nil)))
 '(ibuffer-marked ((t nil)))
 '(ibuffer-special-buffer ((t nil)))
 '(icompletep-choices ((t nil)))
 '(icompletep-determined ((t nil)))
 '(icompletep-keys ((t nil)))
 '(icompletep-nb-candidates ((t nil)))
 '(ido-first-match ((t (:weight bold :foreground "#0f2050"))))
 '(ido-only-match ((t (:weight bold :foreground "#205070"))))
 '(ido-subdir ((t (:foreground "#0f2050"))))
 '(imaxima-latex-error ((t nil)))
 '(info-header-node ((t (:inherit (info-node)))))
 '(info-header-xref ((t (:inherit (info-xref)))))
 '(info-menu-header ((t (:weight bold :inherit (variable-pitch)))))
 '(info-menu-star ((t nil)))
 '(info-node ((t (:weight bold :slant italic :foreground "white"))))
 '(info-title-4 ((t (:weight bold :inherit (variable-pitch)))))
 '(info-xref ((t (:inherit (link)))))
 '(info-xref-visited ((t (:inherit (link-visited info-xref)))))
 '(isearch ((t (:weight bold :foreground "#2f4070" :background "#d4d4d4"))))
 '(isearch-fail ((t (:foreground "#232333" :background "#73acac"))))
 '(jabber-chat-prompt-foreign ((t (:foreground "#235c5c"))))
 '(jabber-chat-prompt-local ((t (:foreground "#834744"))))
 '(jabber-rare-time-face ((t (:foreground "#704d70"))))
 '(jabber-roster-user-away ((t (:foreground "#603a60"))))
 '(jabber-roster-user-chatty ((t nil)))
 '(jabber-roster-user-dnd ((t (:foreground "#235c5c"))))
 '(jabber-roster-user-error ((t nil)))
 '(jabber-roster-user-offline ((t nil)))
 '(jabber-roster-user-online ((t (:foreground "#834744"))))
 '(jabber-roster-user-xa ((t nil)))
 '(jabber-title-large ((t (:height 1.3 :weight bold))))
 '(jabber-title-medium ((t (:height 1.2 :weight bold))))
 '(jabber-title-small ((t (:height 1.1 :weight bold))))
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
 '(lazy-highlight ((t (:weight bold :foreground "#2f4070" :background "#c7c7c7"))))
 '(magit-branch ((t (:weight bold :foreground "#205070" :inherit (magit-header)))))
 '(magit-item-highlight ((t (:background "#b0b0b0" :inherit (highlight)))))
 '(magit-section-title ((t (:weight bold :foreground "#0f2050" :inherit (magit-header)))))
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
 '(org-agenda-date-today ((t (:weight bold :slant italic :foreground "black"))))
 '(org-agenda-date-weekend ((t nil)))
 '(org-agenda-structure ((t (:foreground "Blue1" :inherit (font-lock-comment-face)))))
 '(org-archived ((t (:weight bold :foreground "#232333" :inherit (shadow)))))
 '(org-checkbox ((t (:box (:line-width 1 :color nil :style released-button) :foreground "black" :background "#a0a0a0" :inherit (bold)))))
 '(org-date ((t (:underline (:color foreground-color :style line) :foreground "#732f2c"))))
 '(org-deadline-announce ((t (:foreground "#437c7c"))))
 '(org-document-title ((((class color) (background light)) (:weight bold :foreground "midnight blue")) (((class color) (background dark)) (:weight bold :foreground "pale turquoise")) (t (:weight bold))))
 '(org-done ((t (:weight bold :foreground "#502750"))))
 '(org-formula ((t (:foreground "#2f4070"))))
 '(org-headline-done ((t (:foreground "#502750"))))
 '(org-hide ((t (:foreground "#d4d4d4"))))
 '(org-level-1 ((t (:foreground "#205070" :inherit (outline-1)))))
 '(org-level-2 ((t (:foreground "#401440" :inherit (outline-2)))))
 '(org-level-3 ((t (:foreground "#834744" :inherit (outline-3)))))
 '(org-level-4 ((t (:foreground "#2f4070" :inherit (outline-4)))))
 '(org-level-5 ((t (:foreground "#6c1f1c" :inherit (outline-5)))))
 '(org-level-6 ((t (:foreground "#603a60" :inherit (outline-6)))))
 '(org-level-7 ((t (:foreground "#73acac" :inherit (outline-7)))))
 '(org-level-8 ((t (:foreground "#b38f8c" :inherit (outline-8)))))
 '(org-link ((t (:underline (:color foreground-color :style line) :foreground "#2f4070" :inherit (link)))))
 '(org-scheduled ((t (:foreground "#401440"))))
 '(org-scheduled-previously ((t (:foreground "#73acac"))))
 '(org-scheduled-today ((t (:foreground "#6b400c"))))
 '(org-special-keyword ((t (:weight normal :foreground "#9a9aaa" :inherit (font-lock-keyword-face)))))
 '(org-table ((t (:foreground "#603a60"))))
 '(org-tag ((t (:bold t))))
 '(org-time-grid ((t (:foreground "#205070"))))
 '(org-todo ((t (:weight bold :foreground "#336c6c"))))
 '(org-upcoming-deadline ((t (:foreground "Firebrick" :inherit (font-lock-keyword-face)))))
 '(org-warning ((t (:weight bold :underline nil :foreground "#336c6c" :inherit (font-lock-warning-face)))))
 '(outline-1 ((t (:foreground "#205070" :inherit (font-lock-function-name-face)))))
 '(outline-2 ((t (:foreground "#401440" :inherit (font-lock-variable-name-face)))))
 '(outline-3 ((t (:foreground "#834744" :inherit (font-lock-keyword-face)))))
 '(outline-4 ((t (:foreground "#2f4070" :inherit (font-lock-comment-face)))))
 '(outline-5 ((t (:foreground "#6c1f1c" :inherit (font-lock-type-face)))))
 '(outline-6 ((t (:foreground "#603a60" :inherit (font-lock-constant-face)))))
 '(outline-7 ((t (:foreground "#73acac" :inherit (font-lock-builtin-face)))))
 '(outline-8 ((t (:foreground "#b38f8c" :inherit (font-lock-string-face)))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "#232333"))))
 '(rainbow-delimiters-depth-10-face ((t (:foreground "#205070"))))
 '(rainbow-delimiters-depth-11-face ((t (:foreground "#806080"))))
 '(rainbow-delimiters-depth-12-face ((t (:foreground "#c99f9f"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#603a60"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#2f4070"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#6c1f1c"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#a080a0"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#6b400c"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#1f3060"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#704d70"))))
 '(rainbow-delimiters-depth-9-face ((t (:foreground "#935f5c"))))
 '(rcirc-bright-nick ((t (:foreground "#6b400c"))))
 '(rcirc-dim-nick ((t (:foreground "#935f5c" :inherit (default)))))
 '(rcirc-mode-line-nick ((t nil)))
 '(rcirc-my-nick ((t (:foreground "#732f2c"))))
 '(rcirc-nick-in-message ((t (:foreground "#0f2050"))))
 '(rcirc-other-nick ((t (:foreground "#205070"))))
 '(rcirc-prompt ((t (:weight bold :foreground "#0f2050"))))
 '(rcirc-server ((t (:foreground "#806080"))))
 '(rcirc-server-prefix ((t (:foreground "#704d70" :inherit (rcirc-server)))))
 '(rcirc-timestamp ((t (:foreground "#603a60" :inherit (default)))))
 '(rst-level-1-face ((t (:foreground "#205070"))))
 '(rst-level-2-face ((t (:foreground "#704d70"))))
 '(rst-level-3-face ((t (:foreground "#834744"))))
 '(rst-level-4-face ((t (:foreground "#2f4070"))))
 '(setnu-line-number ((t nil)))
 '(show-paren-match ((t (:weight bold :foreground "#834744" :background "#c0c0c0"))))
 '(show-paren-mismatch ((t (:weight bold :foreground "#639c9c" :background "#c0c0c0"))))
 '(speedbar-button-face ((t (:foreground "green3"))))
 '(speedbar-directory-face ((t (:foreground "light blue"))))
 '(speedbar-file-face ((t (:foreground "cyan"))))
 '(speedbar-highlight-face ((t (:background "sea green"))))
 '(speedbar-tag-face ((t (:foreground "yellow"))))
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
 '(which-func ((t (:foreground "#401440"))))
 '(wl-highlight-folder-few-face ((t (:foreground "#538c8c"))))
 '(wl-highlight-folder-many-face ((t (:foreground "#437c7c"))))
 '(wl-highlight-folder-path-face ((t (:foreground "#205070"))))
 '(wl-highlight-folder-unknown-face ((t (:foreground "#732f2c"))))
 '(wl-highlight-folder-unread-face ((t (:foreground "#732f2c"))))
 '(wl-highlight-folder-zero-face ((t (:foreground "#232333"))))
 '(wl-highlight-message-citation-header ((t (:foreground "#437c7c"))))
 '(wl-highlight-message-cited-text-1 ((t (:foreground "#336c6c"))))
 '(wl-highlight-message-cited-text-2 ((t (:foreground "#603a60"))))
 '(wl-highlight-message-cited-text-3 ((t (:foreground "#732f2c"))))
 '(wl-highlight-message-cited-text-4 ((t (:foreground "#6b400c"))))
 '(wl-highlight-message-header-contents ((t (:foreground "#704d70"))))
 '(wl-highlight-message-header-contents-face ((t (:foreground "#806080"))))
 '(wl-highlight-message-headers-face ((t (:foreground "#235c5c"))))
 '(wl-highlight-message-important-header-contents ((t (:foreground "#603a60"))))
 '(wl-highlight-message-important-header-contents2 ((t (:foreground "#603a60"))))
 '(wl-highlight-message-signature ((t (:foreground "#806080"))))
 '(wl-highlight-message-unimportant-header-contents ((t (:foreground "#232333"))))
 '(wl-highlight-summary-answered-face ((t (:foreground "#732f2c"))))
 '(wl-highlight-summary-displaying-face ((t (:weight bold :underline (:color foreground-color :style line)))))
 '(wl-highlight-summary-disposed-face ((t (:slant italic :foreground "#232333"))))
 '(wl-highlight-summary-new-face ((t (:foreground "#732f2c"))))
 '(wl-highlight-summary-normal-face ((t (:foreground "#232333"))))
 '(wl-highlight-summary-refiled-face ((t (:foreground "#232333"))))
 '(wl-highlight-summary-thread-top-face ((t (:foreground "#0f2050"))))
 '(wl-highlight-thread-indent-face ((t (:foreground "#23733c"))))
 '(default ((t (:inherit nil :stipple nil :background "#ffffff" :foreground "#000000" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :width normal)))))

(provide-theme 'my-presentation)
