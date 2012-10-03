;; -*- coding:utf-8 -*-

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
       "https://raw.github.com/Joonhwan/el-get/master/el-get-install.el"
	   )
    (let ((el-get-master-branch t)
	  (el-get-git-install-url "git@github.com:Joonhwan/el-get.git"))
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
		;; (:name python-mode
		;;        :type git
		;;        :url "git://github.com/emacsmirror/python-mode.git"
		;;        :description "Major mode for editing Python programs"
		;;        :features (python-mode doctest-mode)
		;;        :compile nil
		;;        :load "test/doctest-mode.el"
		;;        :prepare (progn
		;; 		  (autoload 'python-mode "python-mode"
		;; 		    "Python editing mode." t)
		;; 		  (add-to-list 'auto-mode-alist
		;; 			       '("\\.py$" . python-mode))
		;; 		  (add-to-list 'interpreter-mode-alist
		;; 			       '("python" . python-mode))))
		;; (:name eproject
		;; 	   :description "another eproject"
		;; 	   :type git
		;; 	   :url "git://repo.or.cz/eproject.git"
		;; 	   )
		;; (:name ede-cmake
		;; 	   :description "ede cmake mode"
		;; 	   :type bzr
		;; 	   :url "lp:~arankine/+junk/ede-cmake"
		;; 	   )
		(:name auto-yasnippet
			   :description "Quickly create disposable yasnippets"
			   :type emacswiki
			   :features auto-yasnippet
			   )
		(:name font-utils
			   :website "http://www.emacswiki.org/emacs-en/FontUtils"
			   :description "Utility functions for working with fonts."
			   :type github
			   :pkgname "rolandwalker/font-utils"
			   ;; :post-ini (progn
			   ;; 	       (require 'font-utils)
			   ;; 	       )
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
		(:name iflipb
			   :description "iflipb is ALT-TAB like buffer switching without full cycling."
			   :type hg
			   :url "http://hg.rosdahl.net/iflipb"
			   )
		(:name iimage
			   :description "inline'd image mode"
			   :type http
			   :url "http://www.netlaputa.ne.jp/~kose/Emacs/lisp/iimage.el"
			   )
		(:name qml-mode
			   :type git
			   :url "git://github.com/Joonhwan/qml-mode.git"
			   )
		(:name log4j-mode
			   :type elpa
			   )
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
		(:name projectile
			   :description "Projectile is a project interaction library for Emacs"
			   :type git
			   :prepare (progn
						  (setq-default projectile-keymap-prefix (kbd "C-c j"))
						  )
			   ;;:url "git@github.com:Joonhwan/projectile.git"
			   :url "git://github.com/bbatsov/projectile.git"
			   ;; do-not (require 'projectile ) yet
			   ;; :features projectile
			   )
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
		))

(setq my-packages
      (append
       '(
		 ace-jump-mode
		 asciidoc
		 auto-install
		 auto-complete
		 auto-complete-clang
		 csharp-mode
		 deferred
		 dired+
		 el-get
		 ;; eproject
		 ;; evil
		 expand-region
		 ;; flymake-fringe-icons
		 full-ack
		 goto-last-change
		 graphviz-dot-mode
		 gtranslate
		 helm
		 htmlize
		 iedit
		 keywiz
		 lua-mode
		 magit
		 markdown-mode
		 mark-multiple
		 ;; nxhtml
		 ;; openwith
		 package
		 popwin
		 pymacs
		 rainbow-delimiters
		 rainbow-mode
		 rope
		 ropemode
		 ropemacs
		 scss-mode
		 smex
		 ;; undo-tree
		 workgroups
		 yasnippet
		 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(package-initialize)

(provide 'my-el-get)
