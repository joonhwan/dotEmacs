; -*- mode: Lisp; eval: (rainbow-mode t); -*-
;;; zenburn-theme.el --- Dark and clean theme

;; Copyright (C) 2011 Free Software Foundation, Inc.

;; Author: Dirk-Jan C. Binnema <djcb@djcbsoftware.nl>
;; Created: 2011-05-02

;; This file is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; <http://www.gnu.org/licenses/>.

;; zenburn theme, a nice low-contrast theme
(deftheme my-dark
  "The 'my dark' theme - from zenburn theme as template.")

(let (
	  (my-dark-fg  "#dcdccc")
	  (my-dark-bg-1"#1a0a0a")
	  (my-dark-bg"#1c1c1c")
	  (my-dark-bg+1 "#303030")
	  (my-dark-bg+2  "#5f5f5f")
	  (my-dark-red+1 "#Ff4500")
	  (my-dark-red  "#Ff7f24")
	  (my-dark-red-1 "#Cd6600")
	  (my-dark-red-2 "#Cd6600")
	  (my-dark-red-3 "#Cd8500")
	  (my-dark-red-4 "#8b4500")
	  (my-dark-orange "#dfaf8f")
	  (my-dark-orange-1 "#8b5a00")
	  (my-dark-yellow "#Ffb90f")
	  (my-dark-yellow-1 "#Cd950c")
	  (my-dark-yellow-2 "#8b6508")

	  (my-dark-green-2  "#698b69")
	  (my-dark-green-1 "#9bcd9b")
	  (my-dark-green "#6e8b3d")
	  (my-dark-green+1 "#2e8b57")
	  (my-dark-green+2 "#43cd80")
	  (my-dark-green+3 "#4eee94")
	  (my-dark-green+4 "#54ff9f")
	  (my-dark-cyan  "#93e0e3")
	  (my-dark-blue+1 "#00f5ff")
	  (my-dark-blue  "#8cd0d3")
	  (my-dark-blue-1 "#7cb8bb")
	  (my-dark-blue-2 "#6ca0a3")
	  (my-dark-blue-3 "#5c888b")
	  (my-dark-blue-4 "#4c7073")
	  (my-dark-blue-5 "#366060")
	  (my-dark-magenta "#8b008b")

	  (my-dark-jhlee-mode-line-bg "#Daa520")
	  (my-dark-jhlee-mode-line-bg-1 "#8b6508")
	  (my-dark-jhlee-mode-line-fg "#000000")
	  (my-dark-jhlee-mode-line-fg+1 "#303030")
	  )

  (custom-theme-set-faces
   'my-dark

   ;; setup for inheritance
   `(my-dark-foreground ((t (:foreground ,my-dark-fg))))
   `(my-dark-background ((t (:background ,my-dark-bg))))
   `(my-dark-background-1 ((t (:background ,my-dark-bg+1))))
   `(my-dark-background-2 ((t (:background ,my-dark-bg+2))))
   `(my-dark-primary-1 ((t (:foreground ,my-dark-yellow-1))))
   `(my-dark-primary-2 ((t (:foreground ,my-dark-red-1))))
   `(my-dark-primary-3 ((t (:foreground ,my-dark-red-2))))
   `(my-dark-primary-4 ((t (:foreground ,my-dark-red-3))))
   `(my-dark-primary-5 ((t (:foreground ,my-dark-red-4))))
   `(my-dark-highlight-damp ((t (:background ,my-dark-yellow-2))))
   `(my-dark-highlight-alerting ((t (:background ,my-dark-red-4))))
   `(my-dark-highlight-subtle ((t (:background ,my-dark-bg+2))))
   `(my-dark-lowlight-1 ((t (:foreground "#606060"))))
   `(my-dark-lowlight-2 ((t (:foreground "#708070"))))
   `(my-dark-yellow ((t (:foreground ,my-dark-yellow))))
   `(my-dark-yellow-1 ((t (:foreground ,my-dark-yellow-1))))
   `(my-dark-yellow-2 ((t (:foreground ,my-dark-yellow-2))))
   `(my-dark-orange ((t (:foreground ,my-dark-orange))))
   `(my-dark-red ((t (:foreground ,my-dark-red))))
   `(my-dark-red-1 ((t (:foreground ,my-dark-red-1))))
   `(my-dark-red-2 ((t (:foreground ,my-dark-red-2))))
   `(my-dark-red-3 ((t (:foreground ,my-dark-red-3))))
   `(my-dark-red-4 ((t (:foreground ,my-dark-red-4))))
   `(my-dark-green-1 ((t (:foreground ,my-dark-green-1))))
   `(my-dark-green ((t (:foreground ,my-dark-green))))
   `(my-dark-green+1 ((t (:foreground ,my-dark-green+1))))
   `(my-dark-green+2 ((t (:foreground ,my-dark-green+2))))
   `(my-dark-green+3 ((t (:foreground ,my-dark-green+3))))
   `(my-dark-green+4 ((t (:foreground ,my-dark-green+4))))
   `(my-dark-blue+1 ((t (:foreground ,my-dark-blue+1))))
   `(my-dark-blue ((t (:foreground ,my-dark-blue))))
   `(my-dark-blue-1 ((t (:foreground ,my-dark-blue-1))))
   `(my-dark-blue-2 ((t (:foreground ,my-dark-blue-2))))
   `(my-dark-blue-3 ((t (:foreground ,my-dark-blue-3))))
   `(my-dark-blue-4 ((t (:foreground ,my-dark-blue-4))))
   `(my-dark-title ((t (:inherit variable-pitch :weight bold :inherit default))))

   ;; basics
   `(Bold ((t (:weight bold))))
   `(bold-italic ((t (:slant italic :weight bold))))
   `(default ((t (:background ,my-dark-bg :foreground ,my-dark-fg))))
   `(fixed-pitch ((t (:weight bold))))
   `(italic ((t (:slant italic))))
   `(underline ((t (:underline t))))
   `(variable-pitch ((t (:weight bold :family "나눔고딕" :inherit default))))
   `(fringe ((t (:inherit default :background ,my-dark-bg+1))))
   `(header-line ((t (:inherit my-dark-highlight-damp :box (:color "#2e3330" :line-width 2)))))
   `(highlight ((t (:underline nil :background ,my-dark-blue-3))))
   `(hover-highlight ((t (:underline t :foreground ,my-dark-yellow))))
   `(match ((t (:inherit my-dark-highlight-alerting :underline nil))))
   `(menu ((t (:background "#1e2320"))))
   `(mouse ((t (:inherit my-dark-foreground))))
   `(paren ((t (:inherit my-dark-red)))) ;;'my-dark-lowlight-1))))
   `(trailing-whitespace ((t (:inherit font-lock-warning-face))))
   `(Buffer-menu-buffer ((t (:inherit my-dark-primary-1))))
   `(border ((t (:background ,my-dark-bg))))
   `(button ((t (:foreground ,my-dark-yellow-2 :underline t))))
   `(cursor ((t (:background "#aaaaaa" :foreground nil))))
   `(escape-glyph-face ((t (:foreground ,my-dark-red))))
   `(minibuffer-prompt ((t (:foreground ,my-dark-yellow))))
   `(mode-line ((t (:inverse-video nil :background ,my-dark-jhlee-mode-line-bg :foreground ,my-dark-jhlee-mode-line-fg :height 1.0))))
   `(mode-line-inactive ((t (:background ,my-dark-jhlee-mode-line-bg-1  :foreground ,my-dark-jhlee-mode-line-fg+1 :inherit mode-line))))
   `(mode-line-buffer-id ((t (:slant italic :weight bold))))
   `(mode-line-emphasis ((t (:weight bold :weight bold :inherit mode-line))))
   `(mode-line-highlight ((t :inherit mode-line-emphasis)))
   `(region ((t (:foreground nil :background ,my-dark-bg+1))))
   `(scroll-bar ((t (:background ,my-dark-bg+2))))
   `(secondary-selection ((t (:foreground nil :background ,my-dark-bg+2))))
   `(tool-bar ((t (:background ,my-dark-bg+2))))

   ;; font-locking
   `(font-lock-builtin-face ((t (:inherit my-dark-blue))))
   `(font-lock-comment-face ((t (:foreground ,my-dark-green :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-constant-face ((t (:inherit my-dark-primary-1))))
   `(font-lock-doc-face ((t (:inherit my-dark-green+1))))
   `(font-lock-doc-string-face ((t (:foreground ,my-dark-blue+1))))
   `(font-lock-function-name-face ((t (:foreground ,my-dark-blue))))
   `(font-lock-keyword-face ((t (:slant italic :inherit my-dark-blue+1))))
   `(font-lock-negation-char-face ((t (:inherit my-dark-primary-1))))
   `(font-lock-preprocessor-face ((t (:inherit my-dark-red-1))))
   `(font-lock-string-face ((t (:inherit my-dark-blue-3))))
   `(font-lock-type-face ((t (:inherit my-dark-green+2))))
   `(font-lock-variable-name-face ((t (:foreground ,my-dark-yellow-1))))
   `(font-lock-warning-face ((t (:inherit my-dark-highlight-alerting))))
   `(font-lock-pseudo-keyword-face ((t (:inherit my-dark-primary-4))))
   `(font-lock-operator-face ((t (:inherit my-dark-primary-3))))


   ;; apt-utils
   `(apt-utils-normal-package ((t (:inherit my-dark-primary-1))))
   `(apt-utils-virtual-package ((t (:inherit my-dark-primary-2))))
   `(apt-utils-field-keyword ((t (:inherit font-lock-doc-face))))
   `(apt-utils-field-contents ((t (:inherit font-lock-comment-face))))
   `(apt-utils-summary ((t (:inherit bold))))
   `(apt-utils-description ((t (:inherit default))))
   `(apt-utils-version ((t (:inherit my-dark-blue))))
   `(apt-utils-broken ((t (:inherit font-lock-warning-face))))

   ;; breakpoint
   `(breakpoint-enabled-bitmap ((t (:inherit my-dark-primary-1))))
   `(breakpoint-disabled-bitmap ((t (:inherit font-lock-comment-face))))

   ;; calendar
   `(calendar-today ((t (:underline nil :inherit my-dark-primary-2))))

   ;; change-log
   `(change-log-date ((t (:inherit my-dark-blue))))

   ;; circe
   `(circe-highlight-nick-face ((t (:inherit my-dark-primary-1))))
   `(circe-my-message-face ((t (:inherit my-dark-yellow))))
   `(circe-originator-face ((t (:inherit bold))))
   `(circe-prompt-face ((t (:inherit my-dark-primary-1))))
   `(circe-server-face ((t (:inherit font-lock-comment-face))))

   ;; comint
   `(comint-highlight-input ((t (:inherit my-dark-green))))
   `(comint-highlight-prompt ((t (:inherit my-dark-green+1))))

   ;; compilation
   `(compilation-info ((t (:inherit my-dark-primary-1))))
   `(compilation-warning ((t (:inherit font-lock-warning-face))))

   ;; cua
   `(cua-rectangle ((t (:inherit region))))

   ;; custom
   `(fancy-widget-button ((t (:background "#4f4f4f" :box ( :line-width 2 :style released-button )))))
   `(fancy-widget-button-pressed ((t (:background "#4f4f4f" :box ( :line-width 2 :style pressed-button )))))
   `(fancy-widget-button-highlight ((t (:background "#4f4f4f" :box ( :line-width 2 :style released-button )))))
   `(fancy-widget-button-pressed-highlight ((t (:background "#4f4f4f" :box ( :line-width 2 :style pressed-button )))))
   `(fancy-widget-documentation ((t (:inherit font-lock-doc-face))))
   `(fancy-widget-field  ((t (:background "#5f5f5f"))))
   `(fancy-widget-inactive  ((t (:strike-through t))))
   `(fancy-widget-single-line-field  ((t (:background "#5f5f5f"))))
   `(custom-button ((t (:inherit fancy-widget-button))))
   `(custom-button-pressed ((t (:inherit fancy-widget-button-pressed))))
   `(custom-changed ((t (:inherit my-dark-blue))))
   `(custom-comment ((t (:inherit font-lock-doc-face))))
   `(custom-comment-tag ((t (:inherit font-lock-doc-face))))
   `(custom-documentation ((t (:inherit font-lock-doc-face))))
   `(custom-link ((t (:inherit my-dark-yellow :underline t))))
   `(custom-tag ((t (:inherit my-dark-primary-2))))
   `(custom-group-tag ((t (:inherit my-dark-primary-1))))
   `(custom-group-tag-1 ((t (:inherit my-dark-primary-4))))
   `(custom-invalid ((t (:inherit font-lock-warning-face))))
   `(custom-modified ((t (:inherit my-dark-primary-3))))
   `(custom-rogue ((t (:inherit font-lock-warning-face))))
   `(custom-saved ((t (:underline t))))
   `(custom-set ((t (:inverse-video t :inherit my-dark-blue))))
   `(custom-state ((t (:inherit font-lock-comment-face))))
   `(custom-variable-button ((t (:weight bold :underline t))))
   `(custom-variable-tag ((t (:inherit my-dark-primary-2))))

   ;; diary
   `(diary ((t (:underline nil :inherit my-dark-primary-1))))

   ;; dictionary
   `(dictionary-button ((t (:inherit fancy-widget-button))))
   `(dictionary-reference ((t (:inherit my-dark-primary-1))))
   `(dictionary-word-entry ((t (:inherit font-lock-keyword-face))))

   ;; diff
   `(diff-header-face ((t (:inherit my-dark-highlight-subtle))))
   `(diff-index-face ((t (:inherit bold))))
   `(diff-file-header-face ((t (:inherit bold))))
   `(diff-hunk-header-face ((t (:inherit my-dark-highlight-subtle))))
   `(diff-added-face ((t (:inherit my-dark-primary-3))))
   `(diff-removed-face ((t (:inherit my-dark-blue))))
   `(diff-context-face ((t (:inherit font-lock-comment-face))))
   `(diff-refine-change-face ((t (:inherit my-dark-background-2))))

   ;; emms
   `(emms-pbi-song ((t (:foreground ,my-dark-yellow))))
   `(emms-pbi-current ((t (:inherit my-dark-primary-1))))
   `(emms-pbi-mark-marked ((t (:inherit my-dark-primary-2))))

   ;; erc
   `(erc-action-face ((t (:inherit erc-default-face))))
   `(erc-bold-face ((t (:weight bold))))
   `(erc-current-nick-face ((t (:inherit my-dark-primary-1))))
   `(erc-dangerous-host-face ((t (:inherit font-lock-warning-face))))
   `(erc-direct-msg-face ((t (:inherit erc-default-face))))
   `(erc-error-face ((t (:inherit font-lock-warning-face))))
   `(erc-fool-face ((t (:inherit my-dark-lowlight-1))))
   `(erc-highlight-face ((t (:inherit hover-highlight))))
   `(erc-keyword-face ((t (:inherit my-dark-primary-1))))
   `(erc-my-nick-face ((t (:inherit my-dark-red))))
   `(erc-nick-default-face ((t (:inherit bold))))
   `(erc-nick-msg-face ((t (:inherit erc-default-face))))
   `(erc-notice-face ((t (:inherit my-dark-green))))
   `(erc-pal-face ((t (:inherit my-dark-primary-3))))
   `(erc-prompt-face ((t (:inherit my-dark-primary-2))))
   `(erc-timestamp-face ((t (:inherit my-dark-green+1))))
   `(erc-underline-face ((t (:inherit underline))))
   `(erc-default-face ((t (:foreground ,my-dark-fg))))
   `(erc-input-face ((t (:foreground ,my-dark-yellow))))


   ;; eshell
   `(eshell-prompt ((t (:inherit my-dark-primary-1))))
   `(eshell-ls-archive ((t (:foreground ,my-dark-red-1 :weight bold))))
   `(eshell-ls-backup ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-clutter ((t (:inherit font-lock-comment-face))))
   `(eshell-ls-directory ((t (:foreground ,my-dark-blue+1 :weight bold))))
   `(eshell-ls-executable ((t (:foreground ,my-dark-red+1 :weight bold))))
   `(eshell-ls-unreadable ((t (:inherit my-dark-lowlight-1))))
   `(eshell-ls-missing ((t (:inherit font-lock-warning-face))))
   `(eshell-ls-product ((t (:inherit font-lock-doc-face))))
   `(eshell-ls-special ((t (:inherit my-dark-primary-1))))
   `(eshell-ls-symlink ((t (:foreground ,my-dark-cyan :weight bold))))

   ;; flyspell
   `(flyspell-duplicate ((t (:foreground ,my-dark-yellow :weight bold))))
   `(flyspell-incorrect ((t (:foreground ,my-dark-red :weight bold))))

   ;; font-latex
   `(font-latex-bold ((t (:inherit bold))))
   `(font-latex-warning ((t (:inherit font-lock-warning-face))))
   `(font-latex-sedate ((t (:inherit my-dark-primary-1))))
   `(font-latex-title-4 ((t (:inherit my-dark-title))))

   ;; gnus
   `(gnus-group-mail-1-face ((t (:weight bold :inherit gnus-group-mail-1-empty-face))))
   `(gnus-group-mail-1-empty-face ((t (:inherit gnus-group-news-1-empty-face))))
   `(gnus-group-mail-2-face ((t (:weight bold :inherit gnus-group-mail-2-empty-face))))
   `(gnus-group-mail-2-empty-face ((t (:inherit gnus-group-news-2-empty-face))))
   `(gnus-group-mail-3-face ((t (:weight bold :inherit gnus-group-mail-3-empty-face))))
   `(gnus-group-mail-3-empty-face ((t (:inherit gnus-group-news-3-empty-face))))
   `(gnus-group-mail-4-face ((t (:weight bold :inherit gnus-group-mail-4-empty-face))))
   `(gnus-group-mail-4-empty-face ((t (:inherit gnus-group-news-4-empty-face))))
   `(gnus-group-mail-5-face ((t (:weight bold :inherit gnus-group-mail-5-empty-face))))
   `(gnus-group-mail-5-empty-face ((t (:inherit gnus-group-news-5-empty-face))))
   `(gnus-group-mail-6-face ((t (:weight bold :inherit gnus-group-mail-6-empty-face))))
   `(gnus-group-mail-6-empty-face ((t (:inherit gnus-group-news-6-empty-face))))
   `(gnus-group-mail-low-face ((t (:weight bold :inherit gnus-group-mail-low-empty-face))))
   `(gnus-group-mail-low-empty-face ((t (:inherit gnus-group-news-low-empty-face))))
   `(gnus-group-news-1-face ((t (:weight bold :inherit gnus-group-news-1-empty-face))))
   `(gnus-group-news-2-face ((t (:weight bold :inherit gnus-group-news-2-empty-face))))
   `(gnus-group-news-3-face ((t (:weight bold :inherit gnus-group-news-3-empty-face))))
   `(gnus-group-news-4-face ((t (:weight bold :inherit gnus-group-news-4-empty-face))))
   `(gnus-group-news-5-face ((t (:weight bold :inherit gnus-group-news-5-empty-face))))
   `(gnus-group-news-6-face ((t (:weight bold :inherit gnus-group-news-6-empty-face))))
   `(gnus-group-news-low-face ((t (:weight bold :inherit gnus-group-news-low-empty-face))))
   `(gnus-header-content-face ((t (:inherit message-header-other-face))))
   `(gnus-header-from-face ((t (:inherit message-header-from-face))))
   `(gnus-header-name-face ((t (:inherit message-header-name-face))))
   `(gnus-header-newsgroups-face ((t (:inherit message-header-other-face))))
   `(gnus-header-subject-face ((t (:inherit message-header-subject-face))))
   `(gnus-summary-cancelled-face ((t (:inherit my-dark-highlight-alerting))))
   `(gnus-summary-high-ancient-face ((t (:inherit my-dark-blue))))
   `(gnus-summary-high-read-face ((t (:inherit my-dark-green :weight bold))))
   `(gnus-summary-high-ticked-face ((t (:inherit my-dark-primary-2))))
   `(gnus-summary-high-unread-face ((t (:inherit my-dark-foreground :weight bold))))
   `(gnus-summary-low-ancient-face ((t (:inherit my-dark-blue :weight normal))))
   `(gnus-summary-low-read-face ((t (:inherit my-dark-green :weight normal))))
   `(gnus-summary-low-ticked-face ((t (:inherit my-dark-primary-2))))
   `(gnus-summary-low-unread-face ((t (:inherit my-dark-foreground :weight normal))))
   `(gnus-summary-normal-ancient-face ((t (:inherit my-dark-blue :weight normal))))
   `(gnus-summary-normal-read-face ((t (:inherit my-dark-green :weight normal))))
   `(gnus-summary-normal-ticked-face ((t (:inherit my-dark-primary-2))))
   `(gnus-summary-normal-unread-face ((t (:inherit my-dark-foreground :weight normal))))
   `(gnus-summary-selected-face ((t (:inherit my-dark-primary-1))))
   `(gnus-cite-1-face ((t (:foreground ,my-dark-blue))))
   `(gnus-cite-10-face ((t (:foreground ,my-dark-yellow-1))))
   `(gnus-cite-11-face ((t (:foreground ,my-dark-yellow))))
   `(gnus-cite-2-face ((t (:foreground ,my-dark-blue-1))))
   `(gnus-cite-3-face ((t (:foreground ,my-dark-blue-2))))
   `(gnus-cite-4-face ((t (:foreground ,my-dark-green+2))))
   `(gnus-cite-5-face ((t (:foreground ,my-dark-green+1))))
   `(gnus-cite-6-face ((t (:foreground ,my-dark-green))))
   `(gnus-cite-7-face ((t (:foreground ,my-dark-red))))
   `(gnus-cite-8-face ((t (:foreground ,my-dark-red-1))))
   `(gnus-cite-9-face ((t (:foreground ,my-dark-red-2))))
   `(gnus-group-news-1-empty-face ((t (:foreground ,my-dark-yellow))))
   `(gnus-group-news-2-empty-face ((t (:foreground ,my-dark-green+3))))
   `(gnus-group-news-3-empty-face ((t (:foreground ,my-dark-green+1))))
   `(gnus-group-news-4-empty-face ((t (:foreground ,my-dark-blue-2))))
   `(gnus-group-news-5-empty-face ((t (:foreground ,my-dark-blue-3))))
   `(gnus-group-news-6-empty-face ((t (:inherit my-dark-lowlight-1))))
   `(gnus-group-news-low-empty-face ((t (:inherit my-dark-lowlight-1))))
   `(gnus-signature-face ((t (:foreground ,my-dark-yellow))))
   `(gnus-x-face ((t (:background ,my-dark-fg :foreground ,my-dark-bg))))

   ;; help-argument
   `(help-argument-name ((t (:weight bold))))

   ;; hi-lock-mode
   `(hi-yellow  ((t (:foreground ,my-dark-yellow))))
   `(hi-pink  ((t (:foreground ,my-dark-red-4))))
   `(hi-green  ((t (:foreground ,my-dark-green-1))))
   `(hi-blue  ((t (:foreground ,my-dark-blue-5))))


   ;; highlight
   `(highlight-current-line ((t (:inherit my-dark-highlight-subtle))))

   ;; hightlight the current line
   `(hl-line ((t (:inherit nil :background ,my-dark-bg-1))))

   ;; holiday
   `(holiday ((t (:underline t :inherit my-dark-primary-4))))

   ;; ibuffer
   `(ibuffer-deletion ((t (:inherit my-dark-primary-2))))
   `(ibuffer-marked ((t (:inherit my-dark-primary-1))))
   `(ibuffer-special-buffer ((t (:inherit font-lock-doc-face))))
   `(ibuffer-help-buffer ((t (:inherit font-lock-comment-face))))

   ;; icomplete
   `(icompletep-choices ((t (:foreground ,my-dark-fg))))
   `(icompletep-determined ((t (:foreground ,my-dark-green+1))))
   `(icompletep-nb-candidates ((t (:foreground ,my-dark-green+3))))
   `(icompletep-keys ((t (:foreground ,my-dark-red))))

   ;; ido
   `(ido-first-match ((t (:inherit my-dark-primary-1))))
   `(ido-only-match ((t (:inherit my-dark-primary-2))))
   `(ido-subdir ((t (:foreground ,my-dark-yellow))))

   ;; imaxima
   `(imaxima-latex-error ((t (:inherit font-lock-warning-face))))

   ;; info
   `(info-xref ((t (:foreground ,my-dark-blue))))
   `(info-xref-visited ((t (:inherit info-xref :weight normal))))
   `(info-header-xref ((t (:inherit info-xref))))
   `(info-menu-star ((t (:foreground ,my-dark-orange :weight bold))))
   `(info-menu-5 ((t (:inherit info-menu-star))))
   `(info-node ((t (:weight bold))))
   `(info-header-node ((t (:weight normal))))
   `(info-title-4 ((t (:inherit variable-pitch :foreground ,my-dark-yellow))))
   ;; `(info-title-3 ((t (:inherit info-title-4 :foreground ,my-dark-yellow-1 :))))
   ;; `(info-title-2 ((t (:inherit info-title-3 :foreground ,my-dark-yellow))))
   `(info-menu-header ((t (:inherit variable-pitch :foreground ,my-dark-yellow-1))))

   ;; isearch
   `(isearch ((t (:foreground ,my-dark-bg-1 :background ,my-dark-yellow))))
   `(isearch-fail ((t (:foreground ,my-dark-fg :background ,my-dark-red-4))))
   `(lazy-highlight ((t (:foreground ,my-dark-yellow :background ,my-dark-bg+2))))

   ;; jabber-mode
   `(jabber-roster-user-chatty ((t (:inherit my-dark-primary-1))))
   `(jabber-roster-user-online ((t (:inherit my-dark-primary-2))))
   `(jabber-roster-user-away ((t (:inherit font-lock-doc-face))))
   `(jabber-roster-user-xa ((t (:inherit font-lock-comment-face))))
   `(jabber-roster-user-offline ((t (:inherit my-dark-lowlight-1))))
   `(jabber-roster-user-dnd ((t (:inherit my-dark-primary-5))))
   `(jabber-roster-user-error ((t (:inherit font-lock-warning-face))))
   `(jabber-title-small ((t (:inherit my-dark-title :height 1.2))))
   `(jabber-title-medium ((t (:inherit jabber-title-small :height 1.2))))
   `(jabber-title-large ((t (:inherit jabber-title-medium :height 1.2))))
   `(jabber-chat-prompt-local ((t (:inherit my-dark-primary-1))))
   `(jabber-chat-prompt-foreign ((t (:inherit my-dark-primary-2))))
   `(jabber-rare-time-face ((t (:inherit my-dark-green+1))))

   ;; jde
   `(jde-java-font-lock-modifier-face ((t (:inherit my-dark-primary-2))))
   `(jde-java-font-lock-doc-tag-face ((t (:inherit my-dark-primary-1))))
   `(jde-java-font-lock-constant-face ((t (:inherit font-lock-constant))))
   `(jde-java-font-lock-package-face ((t (:inherit my-dark-primary-3))))
   `(jde-java-font-lock-number-face ((t (:inherit font-lock-constant))))
   `(jde-java-font-lock-operator-face ((t (:inherit font-lock-keyword-face))))
   `(jde-java-font-lock-link-face ((t (:inherit my-dark-primary-5 :underline t))))

   ;; keywiz
   `(keywiz-right-face ((t (:inherit my-dark-primary-1))))
   `(keywiz-wrong-face ((t (:inherit font-lock-warning-face))))
   `(keywiz-command-face ((t (:inherit my-dark-primary-2))))

   ;; magit
   `(magit-section-title ((t (:inherit my-dark-red))))
   `(magit-item-highlight ((t (:inherit my-dark-blue))))
   `(magit-branch ((t (:inherit my-dark-blue))))

   ;; makefile
   `(makefile-space ((t (:inherit font-lock-warning-face))))
   `(makefile-shell ((t (nil))))

   ;; message
   `(message-cited-text-face ((t (:inherit font-lock-comment-face))))
   `(message-header-name-face ((t (:inherit my-dark-green+1))))
   `(message-header-other-face ((t (:inherit my-dark-green))))
   `(message-header-to-face ((t (:inherit my-dark-primary-1))))
   `(message-header-from-face ((t (:inherit my-dark-primary-1))))
   `(message-header-cc-face ((t (:inherit my-dark-primary-1))))
   `(message-header-newsgroups-face ((t (:inherit my-dark-primary-1))))
   `(message-header-subject-face ((t (:inherit my-dark-primary-2))))
   `(message-header-xheader-face ((t (:inherit my-dark-green))))
   `(message-mml-face ((t (:inherit my-dark-primary-1))))
   `(message-separator-face ((t (:inherit font-lock-comment-face))))

   ;; minimap
   `(minimap-active-region-background ((t (:foreground nil :background "#233323"))))

   ;; org-mode
   `(org-document-title ((t (:weight bold :height 1.4 :foreground ,my-dark-blue+1))))
   `(org-agenda-clocking
	 ((t (:background ,my-dark-green-2 :weight bold))) t)
   `(org-agenda-date-today
	 ((t (:foreground ,my-dark-cyan :slant italic :weight bold))) t)
   `(org-agenda-date
	 ((t (:foreground ,my-dark-blue))) t)
   `(org-agenda-date-weekend
	 ((t (:foreground ,my-dark-blue+1))) t)

   `(org-agenda-structure
	 ((t (:inherit font-lock-comment-face))))
   `(org-archived ((t (:foreground ,my-dark-fg :weight bold))))
   `(org-checkbox ((t (:background ,my-dark-bg+2 :foreground "white"
								   :box (:line-width 1 :style released-button)))))
   `(org-date ((t (:foreground ,my-dark-blue :underline t))))
   `(org-deadline-announce ((t (:foreground ,my-dark-red-1))))
   `(org-done ((t (:weight bold :foreground ,my-dark-green+3))))
   `(org-formula ((t (:foreground ,my-dark-yellow-2))))
   `(org-headline-done ((t (:foreground ,my-dark-green+3))))
   `(org-hide ((t (:foreground ,my-dark-bg+2))))
   `(org-level-1 ((t (:height 1.03 :foreground ,my-dark-yellow :inherit org-level-2))))
   `(org-level-2 ((t (:height 1.02 :foreground ,my-dark-yellow-1 :inherit org-level-3))))
   `(org-level-3 ((t (:height 1.02 :foreground ,my-dark-yellow-2 :inherit org-level-4))))
   `(org-level-4 ((t (:height 1.01 :foreground ,my-dark-cyan :inherit org-level-5))))
   `(org-level-5 ((t (:foreground ,my-dark-blue-1 :inherit org-level-6))))
   `(org-level-6 ((t (:foreground ,my-dark-blue-2 :inherit org-level-7))))
   `(org-level-7 ((t (:foreground ,my-dark-blue-3 :inherit org-level-8))))
   `(org-level-8 ((t (:weight bold :foreground ,my-dark-blue-4))))
   `(org-link ((t (:foreground ,my-dark-yellow-2 :underline t))))
   `(org-scheduled ((t (:foreground ,my-dark-green+4))))
   `(org-scheduled-previously ((t (:foreground ,my-dark-red-4))))
   `(org-scheduled-today ((t (:foreground ,my-dark-blue+1))))
   `(org-special-keyword ((t (:foreground ,my-dark-yellow-1))))
   `(org-table ((t (:foreground ,my-dark-green+2))))
   `(org-tag ((t (:weight bold))))
   `(org-time-grid ((t (:foreground ,my-dark-orange))))
   `(org-todo ((t (:foreground ,my-dark-red :weight bold))))
   `(org-upcoming-deadline ((t (:inherit font-lock-keyword-face-face))))
   `(org-warning ((t (:foreground ,my-dark-red :weight bold))))

   ;; outline
   `(outline-8 ((t (:inherit default))))
   `(outline-7 ((t (:inherit outline-8 :height 1.0))))
   `(outline-6 ((t (:inherit outline-7 :height 1.0))))
   `(outline-5 ((t (:inherit outline-6 :height 1.0))))
   `(outline-4 ((t (:inherit outline-5 :height 1.0))))
   `(outline-3 ((t (:inherit outline-4 :height 1.0))))
   `(outline-2 ((t (:inherit outline-3 :height 1.0))))
   `(outline-1 ((t (:inherit outline-2  :height 1.0))))

   ;; rainbow-delimiters
   `(rainbow-delimiters-depth-1-face ((t (:foreground ,my-dark-cyan))))
   `(rainbow-delimiters-depth-2-face ((t (:foreground ,my-dark-yellow))))
   `(rainbow-delimiters-depth-3-face ((t (:foreground ,my-dark-blue+1))))
   `(rainbow-delimiters-depth-4-face ((t (:foreground ,my-dark-red+1))))
   `(rainbow-delimiters-depth-5-face ((t (:foreground ,my-dark-green+1))))
   `(rainbow-delimiters-depth-6-face ((t (:foreground ,my-dark-blue-1))))
   `(rainbow-delimiters-depth-7-face ((t (:foreground ,my-dark-orange))))
   `(rainbow-delimiters-depth-8-face ((t (:foreground ,my-dark-magenta))))
   `(rainbow-delimiters-depth-9-face ((t (:foreground ,my-dark-yellow-2))))
   `(rainbow-delimiters-depth-10-face ((t (:foreground ,my-dark-green+2))))
   `(rainbow-delimiters-depth-11-face ((t (:foreground ,my-dark-blue+1))))
   `(rainbow-delimiters-depth-12-face ((t (:foreground ,my-dark-red-4))))


   ;; rcirc
   `(rcirc-my-nick ((t (:inherit my-dark-primary-1))))
   `(rcirc-other-nick ((t (:inherit bold))))
   `(rcirc-bright-nick ((t (:foreground "white" :inherit rcirc-other-nick))))
   `(rcirc-dim-nick ((t (:inherit font-lock-comment-face))))
   `(rcirc-nick-in-message ((t (:inherit bold))))
   `(rcirc-server ((t (:inherit font-lock-comment-face))))
   `(rcirc-server-prefix ((t (:inherit font-lock-comment-face-delimiter))))
   `(rcirc-timestamp ((t (:inherit font-lock-comment-face))))
   `(rcirc-prompt ((t (:inherit my-dark-primary-1))))
   `(rcirc-mode-line-nick ((t (:inherit my-dark-primary-1))))

   ;; show-paren
   `(show-paren-mismatch ((t (:inherit font-lock-warning-face :weight bold))))
   `(show-paren-match ((t (:foreground ,my-dark-orange :background ,my-dark-bg+2 :weight bold :underline nil))))

   ;; setnu
   `(setnu-line-number ((t (:inherit my-dark-lowlight-2))))

   ;; speedbar
   `(speedbar-button-face ((t (:inherit my-dark-primary-1))))
   `(speedbar-file-face ((t (:inherit my-dark-primary-2))))
   `(speedbar-directory-face ((t (:inherit my-dark-primary-5))))
   `(speedbar-tag-face ((t (:inherit font-lock-function-name))))
   `(speedbar-highlight-face ((t (:underline t))))

   ;; strokes
   `(strokes-char-face ((t (:inherit font-lock-keyword-face))))

   ;; todoo
   `(todoo-item-header-face ((t (:inherit my-dark-primary-1))))
   `(todoo-item-assigned-header-face ((t (:inherit my-dark-primary-2))))
   `(todoo-sub-item-header-face ((t (:foreground ,my-dark-yellow))))


   ;; tuareg
   `(tuareg-font-lock-governing-face ((t (:inherit my-dark-primary-2))))
   `(tuareg-font-lock-interactive-error-face ((t (:inherit font-lock-warning-face))))
   `(tuareg-font-lock-interactive-output-face ((t (:inherit my-dark-primary-3))))
   `(tuareg-font-lock-operator-face ((t (:inherit font-lock-operator))))

   ;; twittering-mode
   `(twittering-username-face ((t (:inherit my-dark-red-2))))
   `(twittering-uri-face ((t (:inherit my-dark-blue :underline t))))

   ;; w3m
   `(w3m-form-button-face ((t (:inherit widget-button))))
   `(w3m-form-button-pressed-face ((t (:inherit widget-button-pressed))))
   `(w3m-form-button-mouse-face ((t (:inherit widget-button-pressed))))
   `(w3m-tab-unselected-face ((t (:box (:line-width 1 :style released-button)))))
   `(w3m-tab-selected-face ((t (:box (:line-width 1 :style pressed-button)))))
   `(w3m-tab-unselected-retrieving-face
	 ((t (:inherit w3m-tab-unselected widget-inactive))))
   `(w3m-tab-selected-retrieving-face
	 ((t (:inherit w3m-tab-selected widget-inactive))))
   `(w3m-tab-background-face ((t (:inherit my-dark-highlight-subtle))))
   `(w3m-anchor-face ((t (:inherit my-dark-primary-1))))
   `(w3m-arrived-anchor-face ((t (:inherit my-dark-primary-2))))
   `(w3m-image-face ((t (:inherit my-dark-primary-3))))
   `(w3m-form-face ((t (:inherit widget-field))))

   ;; rst
   `(rst-level-1-face ((t (:foreground ,my-dark-green+4 :background nil))))
   `(rst-level-2-face ((t (:foreground ,my-dark-green+2 :background nil))))
   `(rst-level-3-face ((t (:foreground ,my-dark-green+1 :background nil))))
   `(rst-level-4-face ((t (:foreground ,my-dark-green :background nil))))

   ;; which
   `(which-func ((t (:inherit mode-line))))

   ;; anything
   `(anything-header ((t (:foreground ,my-dark-yellow))))
   `(anything-isearch-match ((t (:inherit isearch))))
   `(anything-dir-priv ((t (:inherit my-dark-highlight-subtle))))
   `(anything-file-name ((t (:foreground ,my-dark-yellow-1))))
   `(anything-ff-file ((t (:inherit italic))))
   `(anything-ff-executable ((t (:foreground ,my-dark-green+4 :inherit italic))))
   `(anything-ff-directory ((t (:inherit italic))))
   `(anything-grep-file ((t (:foreground ,my-dark-yellow-1))))
   `(anything-grep-match ((t (:inherit my-dark-red))))
   `(anything-overlay-line-face ((t (:inherit region))))
   `(anything-dir-heading ((t (:inherit region))))
   `(anything-match ((t (:foreground ,my-dark-orange :inherit italic))))

   ;; wl (wanderlust)
   ;; some faces end with -face, while other don't; confusing
   `(wl-highlight-folder-few-face ((t (:inherit my-dark-red-2))))
   `(wl-highlight-folder-many-face ((t (:inherit my-dark-red-1))))
   `(wl-highlight-folder-path-face ((t (:inherit my-dark-orange))))
   `(wl-highlight-folder-unread-face ((t (:inherit my-dark-blue))))
   `(wl-highlight-folder-zero-face ((t (:inherit my-dark-fg))))
   `(wl-highlight-folder-unknown-face ((t (:inherit my-dark-blue))))
   `(wl-highlight-message-citation-header ((t (:inherit my-dark-red-1))))
   `(wl-highlight-message-cited-text-1 ((t (:inherit my-dark-red))))
   `(wl-highlight-message-cited-text-2 ((t (:inherit my-dark-green+2))))
   `(wl-highlight-message-cited-text-3 ((t (:inherit my-dark-blue))))
   `(wl-highlight-message-cited-text-4 ((t (:inherit my-dark-blue+))))
   `(wl-highlight-message-header-contents-face ((t (:inherit my-dark-green))))
   `(wl-highlight-message-headers-face ((t (:inherit my-dark-red+1))))
   `(wl-highlight-message-important-header-contents ((t (:inherit my-dark-green+2))))
   `(wl-highlight-message-header-contents ((t (:inherit my-dark-green+1))))
   `(wl-highlight-message-important-header-contents2 ((t (:inherit my-dark-green+2))))
   `(wl-highlight-message-signature ((t (:inherit my-dark-green))))
   `(wl-highlight-message-unimportant-header-contents ((t (:inherit my-dark-lowlight-2))))
   `(wl-highlight-summary-answered-face ((t (:inherit my-dark-blue))))
   `(wl-highlight-summary-disposed-face ((t (:inherit my-dark-lowlight-2
													  :slant italic))))
   `(wl-highlight-summary-new-face ((t (:inherit my-dark-blue))))
   `(wl-highlight-summary-normal-face ((t (:inherit my-dark-fg))))
   `(wl-highlight-summary-thread-top-face ((t (:foreground ,my-dark-yellow))))
   `(wl-highlight-thread-indent-face ((t (:foreground ,my-dark-magenta))))
   `(wl-highlight-summary-refiled-face ((t (:inherit my-dark-lowlight-2))))
   `(wl-highlight-summary-displaying-face ((t (:underline t :weight bold))))

   `(wg-mode-line-face ((t (:weight bold :foreground "#400000" :background nil))))
   `(wg-brace-face ((t ( :inherit wg-mode-line-face))))
   `(wg-command-face ((t (:inherit wg-mode-line-face))))
   `(wg-current-workgroup-face ((t (:foreground ,my-dark-red-4 :inherit wg-mode-line-face))))
   `(wg-divider-face ((t (:foreground "#400000" :inherit wg-mode-line-face))))
   `(wg-filename-face ((t (:inherit wg-mode-line-face))))
   `(wg-frame-face ((t (:inherit wg-mode-line-face))))
   `(wg-message-face ((t (:inherit wg-mode-line-face))))
   `(wg-other-workgroup-face ((t (:inherit wg-mode-line-face))))
   `(wg-previous-workgroup-face ((t (:inherit wg-mode-line-face))))
   ))

(provide-theme 'my-dark)
