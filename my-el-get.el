;; -*- coding:utf-8-auto -*-

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; -- for el-get itself
(add-to-list 'load-path (concat my-dotfiles-dir "alien/el-get-package/el-get"))
(setq-default el-get-dir (concat my-dotfiles-dir "alien/el-get-package"))

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
      '((:name cmake-project
			   :type github
			   :pkgname "joonhwan/emacs-cmake-project"
			   )
		(:name emacs-git-gutter
			   :type github
			   :pkgname "syohex/emacs-git-gutter"
			   )
		(:name magit
			   :before (global-set-key (kbd "C-x g") 'magit-status))
		
		(:name expand-region
			   :before (global-set-key (kbd "C-M-SPC") 'er/expand-region))
		
		(:name csharp-mode
			   :type elpa)

		(:name goto-last-change
			   :before (global-set-key (kbd "C-x C-/") 'goto-last-change))

		;; (:name iflipb
		;; 	   :description "iflipb is ALT-TAB like buffer switching without full cycling."
		;; 	   :type hg
		;; 	   :url "http://hg.rosdahl.net/iflipb"
		;; 	   )
		(:name s_dot_el
			   :description "The long lost Emacs string manipulation library."
			   :type github
			   :pkgname "magnars/s.el"
			   )
		))

;; my packages
(setq my-packages
      (append
       ;; list of packages we use straight from official recipes
       '(ace-jump-mode
		 auto-complete
		 ;; csharp-mode
		 dash
		 dash-at-point
		 diminish
		 dired-details
		 full-ack
		 fuzzy
		 graphviz-dot-mode
		 grizzl
		 gtranslate
		 helm
		 htmlize
		 ido-ubiquitous
		 js2-mode
		 key-chord
		 keywiz
		 logito
		 lua-mode
		 magit
		 markdown-mode
		 multiple-cursors
		 outshine
		 pcache
		 popwin
		 projectile
		 qml-mode
		 rainbow-delimiters
		 rainbow-mode
		 smex
		 tfs
		 thingatpt+
		 undo-tree
		 use-package
		 web-mode
		 wgrep
		 xcscope
		 yaml-mode
		 yasnippet
		 )
       (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))

(el-get 'sync my-packages)

(provide 'my-el-get)
