;; -*- coding:utf-8-auto -*-

;; (require 'package)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; -- for el-get itself
(add-to-list 'load-path (concat my-dotfiles-dir "alien/el-get-package/el-get"))
(setq-default el-get-dir (concat my-dotfiles-dir "alien/el-get-package"))

(require 'package)

;; git path
(if win32p
    (setq magit-git-executable
		  (my-find-any-first-exists-file 
		   '("c:/Program Files/Git/bin/git.exe"
			 "c:/Program Files (x86)/Git/bin/git.exe"
			 "c:/msysgit/bin/git.exe"
			 "c:/dev/git/bin/git.exe"
			 )
		   "git.exe"))
  )

(unless (require 'el-get nil t)
  ;; (with-current-buffer
  ;;     (url-retrieve-synchronously
  ;; 	   ;; "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
  ;;      "https://raw.github.com/joonhwan/el-get/master/el-get-install.el"
  ;; 	   )
  ;;   (let ((el-get-master-branch t)
  ;; 	  (el-get-git-install-url "git@github.com:joonhwan/el-get.git"))
  ;;     (end-of-buffer)
  ;;     (eval-print-last-sexp)))
  (with-current-buffer
      (url-retrieve-synchronously
	   "https://raw.github.com/dimitri/el-get/master/el-get-install.el"
	   )
    (progn
      (end-of-buffer)
      (eval-print-last-sexp))))

(add-to-list 'el-get-recipe-path (concat my-dotfiles-dir "my-el-get-recipes"))
(setq el-get-verbose t)

;; personal recipes
(setq el-get-sources
      '(
		(:name cmake-project
			   :type github
			   :pkgname "joonhwan/emacs-cmake-project"
			   )
		(:name emacs-git-gutter
			   :type github
			   :pkgname "syohex/emacs-git-gutter"
			   )
		(:name exec-path-from-shell
			   :type github
			   :pkgname "purcell/exec-path-from-shell"
			   :description "Make Emacs use the $PATH set up by the user's shell"
			   )
		;; (:name magit
		;; 	   :before (global-set-key (kbd "C-x g") 'magit-status))
		(:name magit
		       :website "https://github.com/magit/magit#readme"
		       :description "It's Magit! An Emacs mode for Git."
		       :type github
		       :pkgname "magit/magit"
		       :branch "master"
		       :depends (cl-lib git-modes)
		       ;; :info "."
		       ;; use the Makefile to produce the info manual, el-get can
		       ;; handle compilation and autoloads on its own.
		       :compile "magit.*\\.el\\'"
		       ;; :build `(("make" ,(format "EMACSBIN=%s" el-get-emacs) "docs"))
		       ;; :build/berkeley-unix (("gmake" ,(format "EMACSBIN=%s" el-get-emacs) "docs"))
		       ;; assume windows lacks make and makeinfo
		       :build/windows-nt (progn nil))
		(:name epl
		       :type github
		       :description "Emacs Package Library"
		       :pkgname "cask/epl")
		(:name expand-region
			   :before (global-set-key (kbd "C-M-SPC") 'er/expand-region))
		(:name helm-swoop
			   :type github
			   :pkgname "ShingoFukuyama/helm-swoop"
			   :description "Efficiently hopping squeezed lines powered by Emacs helm interface"
			   :depends (helm)
			   )
		(:name impatient-mode
			   :type github
			   :pkgname "skeeto/impatient-mode"
			   :depends (simple-httpd)
			   )
		(:name csharp-mode
			   :type elpa)
		(:name grizzl
			   :type github
			   :pkgname "d11wtq/grizzl"
			   )
		(:name goto-last-change
			   :before (global-set-key (kbd "C-x C-/") 'goto-last-change))

		;; (:name iflipb
		;; 	   :description "iflipb is ALT-TAB like buffer switching without full cycling."
		;; 	   :type hg
		;; 	   :url "http://hg.rosdahl.net/iflipb"
		;; 	   )
		(:name emacs-python-environment
			   :type github
			   :pkgname "tkf/emacs-python-environment"
			   )
		(:name ob-browser
			   :type github
			   :pkgname "krisajenkins/ob-browser"
			   )
		;; (:name omnisharp-emacs
		;; 	   :type github
		;; 	   :pkgname "sp3ctum/omnisharp-emacs"
		;; 	   :depends (flycheck)
		;; 	   )
		(:name org-page
			   :type github
			   :pkgname "kelvinh/org-page"
			   :depends (ht dash mustache)
			   )
		;; (:name outshine
		;;        :type github
		;;        :pkgname "tj64/outshine"
		;;        :description "emacs outline with outshine outshines outline"
		;;        )
		(:name pkg-info
		       :description "Provide information about Emacs packages."
		       :type github
		       :pkgname "lunaryorn/pkg-info.el"
		       :depends (dash epl)
		       )
		(:name s_dot_el
			   :description "The long lost Emacs string manipulation library."
			   :type github
			   :pkgname "magnars/s.el"
			   )
		(:name sublimity
			   :description "smooth-scrolling and minimap like sublime editor."
			   :type github
			   :pkgname "zk-phi/sublimity"
			   )
		(:name warp-mode
			   :description "Web Article Realtime Preview for Emacs"
			   :type github
			   :pkgname "yukihr/Warp"
			   )
		(:name zeal-at-point
			   :description "Search the word at point with Zeal (Emacs)"
			   :type github
			   :pkgname "jinzhu/zeal-at-point"
			   )
		))

;; my packages
(setq my-packages
      (append
       ;; list of packages we use straight from official recipes
       '(ace-jump-mode
		 ace-window
		 auto-complete
		 ;; csharp-mode
		 dash
		 dash-at-point
		 diminish
		 dired-details
		 flx
		 full-ack
		 fuzzy
		 graphviz-dot-mode
		 git-commit-mode
		 helm
		 htmlize
		 ido-vertical-mode
		 iedit
		 ido-ubiquitous
		 js2-mode
		 key-chord
		 ;; keywiz
		 logito
		 lua-mode
		 magit
		 markdown-mode
		 multiple-cursors
		 outshine
		 ;; org-mode
		 pcache
		 php-mode
		 popwin
		 projectile
		 ;; pydoc-info
		 ;; qml-mode
		 rainbow-delimiters
		 rainbow-mode
		 ;; smex
		 ;; sql-indent
		 ;; tfs
		 thingatpt+
		 undo-tree
		 use-package
		 visual-regexp
		 web-mode
		 wgrep
		 xcscope
		 yaml-mode
		 yasnippet
		 zeal-at-point
		 )
       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

;; ;; clean up any of packages that is not permanent
;; (el-get-cleanup my-packages)
;; init packages
(el-get 'sync my-packages)

(provide 'my-el-get)
