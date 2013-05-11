;; -*- coding:utf-8-auto -*-

(add-to-list 'load-path (concat my-dotfiles-dir "alien/el-get-package/el-get"))

;; (setq-default package-user-dir (concat my-dotfiles-dir "alien/elpa-package"))
(setq-default el-get-dir (concat my-dotfiles-dir "alien/el-get-package"))
;; (eval-after-load "el-get"
;;   `(progn
;;      (add-to-list 'el-get-recipe-path (concat my-dotfiles-dir "el-get-recipes"))))

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
	   ;; "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
       "https://raw.github.com/joonhwan/el-get/master/el-get-install.el"
	   )
    (let ((el-get-master-branch t)
	  (el-get-git-install-url "git@github.com:joonhwan/el-get.git"))
      (end-of-buffer)
      (eval-print-last-sexp))))

(unless (functionp 'el-get-package-name)
  (defun el-get-package-name (package-symbol)
    "Returns a string package"
    (if (symbolp package-symbol)
	(cadr (split-string (format "%s" package-symbol) ":"))
      package-symbol))
  )

(eval-after-load "package"
  '(progn
	 (add-to-list 'package-archives
				  '("elpa" . "http://tromey.com/elpa/"))
	 ;; Add the user-contributed repository
	 (add-to-list 'package-archives
				  '("marmalade" . "http://marmalade-repo.org/packages/"))
	 ))

;;
;; hint from https://github.com/DarwinAwardWinner/dotemacs
;;
(defun el-get-package-name-from-url (url)
  (let ((basename (file-name-nondirectory url)))
    (if (string-match-p "\\.el$" basename)
        (file-name-sans-extension basename)
      basename)))

(defun el-get-package-name-from-git (url)
  (let ((basename (file-name-nondirectory url)))
    (if (string-match "^\\(.*?\\)\\(\\.el\\)?\\(\\.git\\)?$" basename)
        (match-string 1 basename)
      url)))


;; local sources
(setq el-get-sources
      '(
		(:name auto-complete
			   :type github
			   :pkgname "auto-complete/auto-complete"
			   )
		(:name cdb-gud
			   :type emacswiki
			   :pkgname "cdb-gud"
			   )
		(:name cmake-project
			   :type github
			   :pkgname "joonhwan/emacs-cmake-project"
			   )
		(:name fuzzy
			   :type github
			   :pkgname "auto-complete/fuzzy-el"
			   )
		(:name emacs-git-gutter
			   :type github
			   :pkgname "syohex/emacs-git-gutter"
			   )
		(:name emacs-loc-changes
			   :type github
			   :pkgname "rocky/emacs-loc-changes"
			   )
		(:name emacs-load-relative
			   :type github
			   :pkgname "rocky/emacs-load-relative"
			   )
		(:name emacs-test-unit
			   :type github
			   :pkgname "rocky/emacs-test-unit"
			   )
		(:name emacs-dbgr
			   :type github
			   :pkgname "rocky/emacs-dbgr"
			   )
		(:name evil
			   :type git
			   :url "git://gitorious.org/evil/evil.git"
			   )
		(:name emacs-clang-complete-async
			   :type github
			   :pkgname "joonhwan/emacs-clang-complete-async"
			   )
		;; (:name auto-yasnippet
		;; 	   :description "Quickly create disposable yasnippets"
		;; 	   :type emacswiki
		;; 	   :features auto-yasnippet
		;; 	   )
		(:name font-utils
			   :website "http://www.emacswiki.org/emacs-en/FontUtils"
			   :description "Utility functions for working with fonts."
			   :type github
			   :pkgname "rolandwalker/font-utils"
			   ;; :post-ini (progn
			   ;; 	       (require 'font-utils)
			   ;; 	       )
			   )
		(:name iedit
			   :website "https://github.com/victorhge/iedit"
			   :description "Edit multiple regions in the same way simultaneously"
			   :type github
			   :pkgname "victorhge/iedit"
			   :features iedit
			   )
		;; (:name pastebin
		;;        :description "Emacs pastebin"
		;;        :type github
		;;        :pkgname "emacs-pastebin"
		;;        )
		(:name pcache
			   :type github
			   :pkgname "sigma/pcache"
			   )
		(:name logito
			   :type github
			   :pkgname "sigma/logito"
			   )
		(:name gh-gist
			   :type github
			   :pkgname "sigma/gh.el"
			   :depends (pcache logito)
			   )
		(:name gist
			   :type github
			   :pkgname "defunkt/gist.el"
			   :depends gh-gist
			   )
		(:name miniedit
			   :website "https://github.com/emacsmirror/miniedit"
			   :description "Enhanced editing for minibuffer fields"
			   :type github
			   :pkgname "emacsmirror/miniedit"
			   :post-ini (progn
						   (require 'miniedit)
						   (miniedit-install)
						   )
			   )
		(:name multiple-cursors
			   :website "https://github.com/magnars/multiple-cursors.el"
			   :description "Multiple cursors for Emacs"
			   :type git
			   :url "git://github.com/magnars/multiple-cursors.el.git"
			   )
		(:name iflipb
			   :description "iflipb is ALT-TAB like buffer switching without full cycling."
			   :type hg
			   :url "http://hg.rosdahl.net/iflipb"
			   )
		(:name qml-mode
			   :type git
			   :url "git://github.com/joonhwan/qml-mode.git"
			   )
		;; (:name log4j-mode
		;; 	   :type elpa
		;; 	   )
		(:name flymake-cursor
			   :description "displays flymake error msg in minibuffer after delay"
			   :type emacswiki
			   :features flymake-cursor
			   )
		(:name everything
			   :description "find files with everything"
			   :type emacswiki
			   :features everything
			   )
		(:name magit
		       :website "https://github.com/magit/magit#readme"
		       :description "It's Magit! An Emacs mode for Git."
		       :type github
		       :pkgname "magit/magit"
		       ;; :info "."
		       ;; ;; that used to be how to build it :build ("./autogen.sh" "./configure" "make")
		       ;; :build ("make all")
		       ;; :build/darwin `(,(concat "PATH=" (shell-quote-argument invocation-directory) ":$PATH make all"))
		       )
		;; elisp에서 문자열구연 레퍼런스 삼을 만한 것
		(:name s_dot_el
			   :description "The long lost Emacs string manipulation library."
			   :type github
			   :pkgname "magnars/s.el"
			   )
		(:name dash
			   :description "A modern list api for Emacs. No 'cl required."
			   :type github
			   :pkgname "magnars/dash.el"
			   )
		(:name projectile
			   :description "Projectile is a project interaction library for Emacs"
			   :type git
			   :prepare (progn
						  (setq-default projectile-keymap-prefix (kbd "C-c j"))
						  )
			   ;;:url "git@github.com:joonhwan/projectile.git"
			   :url "git://github.com/bbatsov/projectile.git"
			   :depends s_dot_el dash
			   ;; do-not (require 'projectile ) yet
			   ;; :features projectile
			   )
		;; (:name smartparens
		;; 	   :description "Modern minor mode for Emacs that deals with parens pairs and tries to be smart about it."
		;; 	   :type github
		;; 	   :pkgname "Fuco1/smartparens"
		;; 	   )
		;; (:name replace+
		;; 	   :description "Extensions to `replace.el'."
		;; 	   :type emacswiki
		;; 	   :features replace+
		;; 	   :depends thingatpt+
		;; 	   )
		(:name thingatpt+
			   :description "Extensions to `thingatpt.el'."
			   :type emacswiki
			   :features thingatpt+
			   )
		(:name xcscope
			   :description "cscope interface for (X)Emacs"
			   :type git
			   :url "git://github.com/emacsattic/xcscope.git"
			   :features xcscope
			   )
		(:name ido-ubiquitous
			   :description "ido everywhere."
			   :type git
			   :url "git://github.com/technomancy/ido-ubiquitous.git")
		(:name warp
			   :description "Realtime HTML Preview for Emacs"
			   :type git
			   :url "git://github.com/yukihr/Warp.git")
		(:name wgrep
			   :description "Writable grep buffer and apply the changes to files"
			   :type git
			   :url "git://github.com/mhayashi1120/Emacs-wgrep.git")
		)
	  )

(cond
 (macp
  (setq my-platform-packages
		'(
		  emacs-w3m
		  )
		)
  (setq el-get-sources
		(append el-get-sources
				'(
				  (:name emacs-xcode-document-viewer
						 :description "emacs xcode doc viewer"
						 :type github
						 :pkgname "joonhwan/emacs-xcode-document-viewer"
						 )
				  (:name dash-at-point
						 :description "a emacs lisp for searching the word at point with Dash"
						 :type github
						 :pkgname "Kapeli/dash-at-point"
						 )
				  )
				))
  )
 (win32p
  (setq my-platform-packages
		nil
		)
  (setq el-get-sources
		(append el-get-sources
				nil)
				  
		))
 )

(setq my-packages
      (append
       '(
		 ace-jump-mode
		 auto-install
		 ;; auto-complete-clang
		 csharp-mode
		 deferred
		 diminish
		 dired-details
		 ;; dbgr
		 el-get
		 expand-region
		 full-ack
		 js2-mode
		 goto-last-change
		 graphviz-dot-mode
		 gtranslate
		 helm
		 htmlize
		 keywiz
		 lua-mode
		 magit
		 markdown-mode
		 ;; mark-multiple
		 ;; org-mode
		 package
		 popwin
		 popup
		 rainbow-delimiters
		 rainbow-mode
		 smex
		 ;; switch-window
		 undo-tree
		 yasnippet
		 yaml-mode
		 )
	   my-platform-packages
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(package-initialize)

(provide 'my-el-get)
