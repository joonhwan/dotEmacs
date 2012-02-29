
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
    (end-of-buffer)
    (eval-print-last-sexp)))

(eval-after-load "package"
  '(progn
	 (add-to-list 'package-archives
				  '("elpa" . "http://tromey.com/elpa/"))
	 ;; Add the user-contributed repository
	 (add-to-list 'package-archives
				  '("marmalade" . "http://marmalade-repo.org/packages/"))
	 ))

;; now either el-get is `require'd already, or have been `load'ed by the
;; el-get installer.
(setq
 el-get-sources
 '((:name anything-ack
		  :description "search refinement of ack result with anything"
		  :website "http://www.emacswiki.org/emacs-fr/anything-ack.el"
		  :type emacswiki
		  :post-init (autoload 'anything-ack "anything-ack"
					   "Run ack in `anything' buffer to narrow results." t)
		  :depends anything)
   (:name eproject
   		  :description "File grouping (\"project\") extension for emacs"
   		  :type git
   		  :url "https://github.com/jrockway/eproject.git"
   		  :load-path ("." "lang")
   		  ;; the core functionality needs to be present.
   		  ;; eproject-extras, otoh, has autoload cookies.
   		  ;; lang/* can be added by the user as needed.
   		  :features eproject)
   (:name iedit
		  :description "Edit multiple regions with the same content simultaneously."
		  :type emacswiki
		  :after (progn
				   (define-key global-map (kbd "\C-c,i") 'iedit-mode))
		  :features iedit)
   (:name package
		  :after (progn
				   ;; emacs' package management system
				   (package-initialize)
				   (add-to-list 'package-archives
								'("elpa" . "http://tromey.com/elpa/"))
				   ;; Add the user-contributed repository
				   (add-to-list 'package-archives
								'("marmalade" . "http://marmalade-repo.org/packages/"))
				   ))
   (:name magit				; git meet emacs, and a binding
	  :after (lambda ()
		   (global-set-key (kbd "C-x C-z") 'magit-status)))
   (:name goto-last-change		; move pointer back to last change
   	  :after (lambda ()
   		   ;; when using AZERTY keyboard, consider C-x C-_
   		   (global-set-key (kbd "C-x C-/") 'goto-last-change)))
   (:name log4j-mode
		  :description "log4j log view mode"
		  :features log4j-mode
		  :type elpa
		  :after (progn
				   (add-hook 'log4j-mode-hook
							 (lambda()
							   ;; restore case fold search in log4j log file(easy to search!!!)
							   (setq case-fold-search t)))))
   (:name cmd-mode
		  :description "cmd-mode"
		  :features cmd-mode
		  :type emacswiki
		  :after (progn
				   (autoload 'cmd-mode "cmd-mode" "CMD mode." t)
				   (add-to-list 'auto-mode-alist '("\\.\\(cmd\\|bat\\)$" . cmd-mode) nil)
				   (add-hook 'cmd-mode-hook (lambda () (setq comment-start "rem ")))))
   (:name popwin
   	  :description "popwin is a popup window manager for Emacs"
   	  :type git
   	  :url "https://github.com/m2ym/popwin-el"
   	  :load-path ("." "misc")
   	  :features popwin
   	  :post-init (progn
   		       (message "'popwin' has been loaded...")
   		       (setq
   			display-buffer-function 'popwin:display-buffer
   			special-display-function 'popwin:special-display-popup-window
   			special-display-regexps '((regexp-opt '((regexp-opt '("\\*completions\\*" "\\*Completions\\*" "\\*Help\\*" "\\*Anything.*\\*")))))
   			;; special-display-buffer-names
   			;; '("*cmd shell*" "*compilation*"))
   			)
   		       )
   	  )
   (:name log4j-mode
		  :description "log4j log view mode"
		  :features log4j-mode
		  :type elpa
		  :after (progn
				   (add-hook 'log4j-mode-hook
							 (lambda()
							   ;; restore case fold search in log4j log file(easy to search!!!)
							   (setq case-fold-search t)))))
   (:name rainbow-mode
		  :description "rainbowing mode"
		  :type elpa
		  :post-init (progn (autoload 'rainbow-mode "rainbow-mode" "rain bow mode." t)
							))
   (:name qml-mode
		  :description "joonhwan's modified qml-mode"
		  :type git
		  :url "git://github.com/Joonhwan/qml-mode.git"
		  :depends rainbow-mode
		  :features qml-mode)
   (:name full-ack
		  :description "full ack.pl mode"
		  :type git
		  :url "git://github.com/nschum/full-ack.git"
		  :features full-ack)
   (:name yasnippet
		  :website "https://github.com/capitaomorte/yasnippet"
		  :description "YASnippet is a template system for Emacs."
		  :type git
		  :url "git://github.com/capitaomorte/yasnippet.git"
		  :features "yasnippet"
		  :prepare (progn
					 ;; Set up the default snippets directory
					 ;;
					 ;; Principle: don't override any user settings
					 ;; for yas/snippet-dirs, whether those were made
					 ;; with setq or customize.  If the user doesn't
					 ;; want the default snippets, she shouldn't get
					 ;; them!
					 (unless (or (boundp 'yas/snippet-dirs) (get 'yas/snippet-dirs 'customized-value))
					   (setq yas/snippet-dirs 
							 (list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets")))))
		  :post-init (progn
					   ;; Trick customize into believing the standard
					   ;; value includes the default snippets.
					   ;; yasnippet would probably do this itself,
					   ;; except that it doesn't include an
					   ;; installation procedure that sets up the
					   ;; snippets directory, and thus doesn't know
					   ;; where those snippets will be installed.  See
					   ;; http://code.google.com/p/yasnippet/issues/detail?id=179
					   (put 'yas/snippet-dirs 'standard-value 
							;; as cus-edit.el specifies, "a cons-cell
							;; whose car evaluates to the standard
							;; value"
							(list (list 'quote
										(list (concat el-get-dir (file-name-as-directory "yasnippet") "snippets"))))))
		  ;; byte-compile load vc-svn and that fails
		  ;; see https://github.com/dimitri/el-get/issues/200
		  :compile nil)
 )
 )

;; my packages
(setq
 my-el-get-packages
 (append
  ;; list of packages we use straight from official recipes
  '(
    anything
    anything-ack
    ;; anything-books
    asciidoc
    auto-install
    ;; cmake-mode
    cmd-mode
    csharp-mode
    ;; deferred
    ;; eclim
    el-get
    graphviz-dot-mode
    gtranslate
    htmlize
    iedit
    keywiz
    log4j-mode
    lua-mode
    markdown-mode
    package
    qml-mode
    popwin
    rainbow-delimiters
    ;; rainbow-mode
    scss-mode
    smex
    ;; textmate
    workgroups
    )

  ;; add to my packages all from `el-get-sources'
  ;; (loop for src in el-get-sources
  ;; 	     for name = (el-get-as-symbol (el-get-source-name src))
  ;; 	     unless (member name '(emms))
  ;; 	     collect name)))
  (mapcar 'el-get-as-symbol (mapcar 'el-get-source-name el-get-sources))))


;; (unless (string-match "apple-darwin" system-configuration)
;;   (loop for p in '(color-theme		; nice looking emacs
;; 				   color-theme-tango	; check out color-theme-solarized
;; 				   )
;; 		do (add-to-list 'el-get-sources p)))

;;
;; Some recipes require extra tools to be installed
;;
;; Note: el-get-install requires git, so we know we have at least that.
;;
;; (when (el-get-executable-find "cvs")
;;   (add-to-list 'el-get-sources 'emacs-goodies-el)) ; the debian addons for emacs

;; (when (el-get-executable-find "svn")
;;   (loop for p in '(psvn    		; M-x svn-status
;; 				   yasnippet		; powerful snippet mode
;; 		   )
;; 	do (add-to-list 'el-get-sources p)))

;; install new packages and init already installed packages
(el-get 'sync my-el-get-packages)
(el-get 'wait)

;; (el-get 'sync)
;; (el-get 'wait)

(provide 'my-el-get)
