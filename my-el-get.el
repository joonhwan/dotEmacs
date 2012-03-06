
(add-to-list 'load-path (concat my-dotfiles-dir "alien/el-get-package/el-get"))

;; (setq-default package-user-dir (concat my-dotfiles-dir "alien/elpa-package"))
(setq-default el-get-dir (concat my-dotfiles-dir "alien/el-get-package"))
;; (eval-after-load "el-get"
;;   `(progn
;;      (add-to-list 'el-get-recipe-path (concat my-dotfiles-dir "el-get-recipes"))))

(unless (require 'el-get nil t)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (end-of-buffer)
      (eval-print-last-sexp))))

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
		))

(setq my-packages
      (append
       '(
		 anything
		 anything-ack
		 asciidoc
		 auto-install
		 csharp-mode
		 deferred
		 el-get
		 eproject
		 evil
		 full-ack
		 goto-last-change
		 graphviz-dot-mode
		 gtranslate
		 htmlize
		 ido-ubiquitous
		 iedit
		 keywiz
		 lua-mode
		 magit
		 markdown-mode
		 nxhtml
		 package
		 popwin
		 rainbow-delimiters
		 rainbow-mode
		 scss-mode
		 smex
		 workgroups
		 yasnippet
		 )
       (mapcar 'el-get-source-name el-get-sources)))

(el-get 'sync my-packages)

(package-initialize)

(provide 'my-el-get)
