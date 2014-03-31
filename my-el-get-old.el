;; -*- coding:utf-8-auto -*-

(require 'package)
(progn
  ;; (add-to-list 'package-archives
  ;; 			  '("elpa" . "http://tromey.com/elpa/"))
  (add-to-list 'package-archives
			   '("melpa" . "http://melpa.milkbox.net/packages/") t)
  ;; Add the user-contributed repository
  ;; (add-to-list 'package-archives
  ;; 			   '("marmalade" . "http://marmalade-repo.org/packages/"))
  )
(package-initialize)

(add-to-list 'load-path (concat my-dotfiles-dir "alien/el-get-package/el-get"))

;; (setq-default package-user-dir (concat my-dotfiles-dir "alien/elpa-package"))
(setq-default el-get-dir (concat my-dotfiles-dir "alien/el-get-package"))
;; (eval-after-load "el-get"
;;   `(progn
;;      (add-to-list 'el-get-recipe-path (concat my-dotfiles-dir "el-get-recipes"))))

;; unable to detect end of process in magit process buffer?!
;; discussion found https://github.com/magit/magit/issues/18
;; but no help. :(
;; (setq magit-process-connection-type nil)
(if win32p
	(setq magit-git-executable
		  (cond
		   ((file-exists-p "c:/Program Files/Git/bin/git.exe")
			"c:/program files/git/bin/git.exe")
		   ((file-exists-p "c:/Program Files (x86)/Git/bin/git.exe")
			"c:/Program Files (x86)/Git/bin/git.exe")
		   ((file-exists-p "c:/msysgit/bin/git.exe")
			"c:/msysgit/bin/git.exe")
		   (t
			"git"))))

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
		(:name cmake-project
			   :type github
			   :pkgname "joonhwan/emacs-cmake-project"
			   )
		(:name codesearch
			   :type github
			   :pkgname "abingham/codesearch.el"
			   )
		;; (:name emacs-clang-complete-async
		;; 	   :type github
		;; 	   :pkgname "joonhwan/emacs-clang-complete-async"
		;; 	   )
		(:name emacs-git-gutter
			   :type github
			   :pkgname "syohex/emacs-git-gutter"
			   )
		(:name emacs-loc-changes
			   :type github
			   :pkgname "rocky/emacs-loc-changes"
			   )
		(:name iedit
			   :type github
			   :pkgname "victorhge/iedit"
			   )
		(:name grizzl
			   :description "Grizzl - A fuzzy search index & completing-read for Emacs"
			   :type github
			   :pkgname "d11wtq/grizzl"
			   )
		;; (:name iflipb
		;; 	   :description "iflipb is ALT-TAB like buffer switching without full cycling."
		;; 	   :type hg
		;; 	   :url "http://hg.rosdahl.net/iflipb"
		;; 	   )
		;; elisp에서 문자열구연 레퍼런스 삼을 만한 것
		(:name s_dot_el
			   :description "The long lost Emacs string manipulation library."
			   :type github
			   :pkgname "magnars/s.el"
			   )
		(:name thingatpt+
			   :description "Extensions to `thingatpt.el'."
			   :type emacswiki
			   :features thingatpt+
			   )
		(:name wgrep
			   :description "Writable grep buffer and apply the changes to files"
			   :type git
			   :url "git://github.com/mhayashi1120/Emacs-wgrep.git")
		(:name magit
		       :website "https://github.com/magit/magit#readme"
		       :description "It's Magit! An Emacs mode for Git."
		       :type github
		       :pkgname "magit/magit"
		       :depends (cl-lib git-modes)
		       ;; :info "."
		       ;; let el-get care about autoloads so that it works with all OSes
		       ;; :build (if (version<= "24.3" emacs-version)
		       ;; 		  `(("make" ,(format "EMACS=%s" el-get-emacs) "all"))
		       ;; 		`(("make" ,(format "EMACS=%s" el-get-emacs) "docs")))
		       :;; build/berkeley-unix (("touch" "`find . -name Makefile`") ("gmake"))
		       )
		(:name org-mode
			   :type git
			   :url "git://orgmode.org/org-mode.git"
			   )
		(:name outshine
			   :description "outline with outshine outshines outline"
			   :type github
			   :pkgname "tj64/outshine"
			   )
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
		 ;; auto-complete-clang
		 ;; dbgr
		 ;; mark-multiple
		 ;; org-mode
		 ;; switch-window
		 popup
		 ;; emacs-clang-complete-async
		 ;; emacs-dbgr
		 ;; emacs-load-relative
		 ;; emacs-test-unit
		 ;; cdb-gud
		 ;; esup
		 ;; everything
		 ;; font-utils
		 ;; gh-gist
		 ;; gist
		 ;; miniedit
		 ace-jump-mode
		 auto-complete
		 auto-install
		 cmake-project
		 csharp-mode
		 dash
		 dash-at-point
		 deferred
		 diminish
		 dired-details
		 emacs-git-gutter
		 ;; evil
		 expand-region
		 flycheck
		 flymake-cursor
		 full-ack
		 fuzzy
		 git-modes
		 goto-last-change
		 graphviz-dot-mode
		 grizzl
		 gtranslate
		 helm
		 htmlize
		 ido-ubiquitous
		 ;; iedit ;; i use my own github origin(victorhge's most active version)
		 ;; iflipb
		 js2-mode
		 key-chord
		 keywiz
		 logito
		 lua-mode
		 magit
		 markdown-mode
		 multiple-cursors
		 pcache
		 popwin
		 projectile
		 qml-mode
		 rainbow-delimiters
		 rainbow-mode
		 s_dot_el
		 smex
		 tfs
		 thingatpt+
		 undo-tree
		 use-package
		 ;; warp
		 web-mode
		 wgrep
		 xcscope
		 yaml-mode
		 yasnippet
		 )
	   my-platform-packages
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(package-initialize)

(provide 'my-el-get)
