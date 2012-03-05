
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


;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.

(setq
 el-get-sources
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
    log4j-mode
    lua-mode
    magit
    markdown-mode
    package
    popwin
    (name: qml-mode
	   :type git
	   :url "git://github.com/Joonhwan/qml-mode.git")
    rainbow-delimiters
    rainbow-mode
    scss-mode
    smex
    workgroups
    yasnippet
    )

  ;; (mapcar (lambda (pkg) `(:name ,pkg :type elpa))
  ;; 	  el-get-sources-from-elpa)

  (mapcar
   (lambda (pkg) `(:name ,pkg :type emacswiki))
   '(
     cmd-mode
     )
   )

  ;; (mapcar (lambda (url)
  ;; 	    `(:name ,(el-get-package-name-from-url url)
  ;; 		    :type http
  ;; 		    :url ,url))
  ;; 	  el-get-sources-from-http)
  ))

(loop for source in el-get-sources
      do (ignore-errors (el-get 'sync (list (el-get-source-name source)))))

(package-initialize)

(provide 'my-el-get)
