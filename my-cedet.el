;; -*- coding:utf-8 -*-
;; from "A gentle introduction to CEDET"
;; http://alexott.net/en/writings/emacs-devenv/EmacsCedet.html
(setq my-cedet-dir (concat my-dotfiles-dir
						   "alien/manual-package/cedet-bzr"))
(add-to-list 'load-path my-cedet-dir)
(require 'cedet-devel-load)
(require 'semantic/ia)
(require 'semantic/bovine/c)

(setq semantic-default-submodes
	  '(
		;; enables global support for Semanticdb;
		global-semanticdb-minor-mode

		;; enables automatic bookmarking of tags that you edited, so
		;; you can return to them later with the
		;; semantic-mrub-switch-tags command;
		global-semantic-mru-bookmark-mode

		;; ;; activates CEDET's context menu that is bound to right mouse
		;; ;; button;
		;; global-cedet-m3-minor-mode

		;; activates highlighting of first line for current tag
		;; (function, class, etc.);
		global-semantic-highlight-func-mode

		;; activates mode when name of current tag will be shown in
		;; top line of buffer;
		global-semantic-stickyfunc-mode

		;; ;; activates use of separate styles for tags decoration
		;; ;; (depending on tag's class). These styles are defined in the
		;; ;; semantic-decoration-styles list;
		;; global-semantic-decoration-mode

		;; activates highlighting of local names that are the same as
		;; name of tag under cursor;
		global-semantic-idle-local-symbol-highlight-mode

		;; activates automatic parsing of source code in the idle
		;; time;
		global-semantic-idle-scheduler-mode

		;; activates displaying of possible name completions in the
		;; idle time. Requires that
		;; global-semantic-idle-scheduler-mode was enabled;
		global-semantic-idle-completions-mode

		;; activates displaying of information about current tag in
		;; the idle time. Requires that
		;; global-semantic-idle-scheduler-mode was enabled.
		global-semantic-idle-summary-mode

		;; 원래는 개발자용 옵션인데...
		global-semantic-show-unmatched-syntax-mode
		;; shows which elements weren't processed by current parser's rules;
		global-semantic-show-parser-state-mode
		;; shows current parser state in the modeline;
		global-semantic-highlight-edits-mode
		;; shows changes in the text that weren't processed by incremental parser yet.

		;; 원래의 설정은 다음의 2개
		;; global-semanticdb-minor-mode
		;; global-semantic-idle-scheduler-mode
		;; 
		))
(semantic-mode 1)

(setq mac-qt4-header-dirs
	  '("/Library/Frameworks/Qt3Support.framework/Versions/4/Headers"
		"/Library/Frameworks/QtCore.framework/Versions/4/Headers"
		"/Library/Frameworks/QtDBus.framework/Versions/4/Headers"
		"/Library/Frameworks/QtDeclarative.framework/Versions/4/Headers"
		"/Library/Frameworks/QtDesigner.framework/Versions/4/Headers"
		"/Library/Frameworks/QtGui.framework/Versions/4/Headers"
		"/Library/Frameworks/QtHelp.framework/Versions/4/Headers"
		"/Library/Frameworks/QtMultimedia.framework/Versions/4/Headers"
		"/Library/Frameworks/QtNetwork.framework/Versions/4/Headers"
		"/Library/Frameworks/QtOpenGL.framework/Versions/4/Headers"
		"/Library/Frameworks/QtScript.framework/Versions/4/Headers"
		"/Library/Frameworks/QtScriptTools.framework/Versions/4/Headers"
		"/Library/Frameworks/QtSql.framework/Versions/4/Headers"
		"/Library/Frameworks/QtSvg.framework/Versions/4/Headers"
		"/Library/Frameworks/QtTest.framework/Versions/4/Headers"
		"/Library/Frameworks/QtWebKit.framework/Versions/4/Headers"
		"/Library/Frameworks/QtXml.framework/Versions/4/Headers"
		"/Library/Frameworks/QtXmlPatterns.framework/Versions/4/Headers"))

(setq qt4-core-header-dir
	  (cond
	   (macp "/Library/Frameworks/QtCore.framework/Versions/4/Headers")
	   (win32p "c:/Qt/qt4-x64/include/Qt")
	   (t "")
	   ))

(setq my-system-header `(,@mac-qt4-header-dirs "another"))

(dolist (header-dir my-system-header)
  (message (concat "added " header-dir))
  (semantic-add-system-include header-dir 'c++-mode)
  (add-to-list 'auto-mode-alist (cons header-dir 'c++-mode))
  )

(semantic-c-add-preprocessor-symbol "signals" "protected")

(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-core-header-dir "/qconfig.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-core-header-dir "/qconfig-dist.h"))
(add-to-list 'semantic-lex-c-preprocessor-symbol-file (concat qt4-core-header-dir "/qglobal.h"))

(defun my-c-mode-ac-setup()
  (when (boundp 'ac-sources)
	;; (add-to-list 'ac-sources 'ac-source-gtags)
	(add-to-list 'ac-sources 'ac-source-semantic)
	)
  (when (functionp 'semantic-complete-self-insert)
	(local-set-key "." 'semantic-complete-self-insert)
	(local-set-key ">" 'semantic-complete-self-insert)
	)
  )

(add-hook 'c-mode-common-hook 'my-c-mode-ac-setup)

(provide 'my-cedet)


