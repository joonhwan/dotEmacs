;; -*- coding:utf-8-auto; -*-
;; dsvn(equivalent to tortoisesvn)
;;
;; (require 'vc-svn)

;; * template
(setq-default template-default-directories `(,(concat my-dotfiles-dir "template")))
(require 'template)
(template-initialize)

;;
;; * outshine for org'nized commenting
;;
(setq-default outline-minor-mode-prefix "\C-c\C-c")
(require 'outshine)
(require 'imenu)
(add-hook 'outline-minor-mode-hook 'outshine-hook-function)


;; * idutils
(autoload 'gid "idutils" "run idutils' gid command" t)

;;
;; * vc
;;
(if win32p
	(cond
	 ((file-exists-p "c:/Program Files (x86)/Git/bin/git.exe")
	  (setq vc-git-program "c:/Program Files (x86)/Git/bin/git.exe"))
	 ((file-exists-p "c:/Program Files/Git/bin/git.exe")
	  (setq vc-git-program "c:/Program Files (x86)/Git/bin/git.exe"))
	 )
  )

;;
;; * tfs(MS Team Foundation Server) on win32
;;
(when win32p
  ;; until lisp veteran gives me another nice tfs integration....
  (require 'tfs)
  (setq tfs/tf-exe  "c:/dev/vs11/Common7/IDE/TF.exe")
  (global-set-key  "\C-cvo" 'tfs/checkout)
  (global-set-key  "\C-cvi" 'tfs/checkin)
  (global-set-key  "\C-cvp" 'tfs/properties)
  (global-set-key  "\C-cvr" 'tfs/rename)
  (global-set-key  "\C-cvg" 'tfs/get)
  (global-set-key  "\C-cvh" 'tfs/history)
  (global-set-key  "\C-cvu" 'tfs/undo)
  (global-set-key  "\C-cvd" 'tfs/diff)
  (global-set-key  "\C-cv-" 'tfs/delete)
  (global-set-key  "\C-cv+" 'tfs/add)
  (global-set-key  "\C-cvs" 'tfs/status)
  (global-set-key  "\C-cva" 'tfs/annotate)
  (global-set-key  "\C-cvw" 'tfs/workitem)
  )

;;
;; * magit
;;
(global-set-key (kbd "C-x g") 'magit-status)
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
(if macp
	(setq magit-emacsclient-executable
		  "/Applications/Emacs.app/Contents/MacOS/bin/emacsclient"))

;;
;; * emacs lisp
;;
(my-try-require 'rainbow-delimiters)
(require 'eldoc)
(defun my-emacs-lisp-mode-hook ()
  (turn-on-eldoc-mode)
  (outline-minor-mode 1)
  (if (featurep 'rainbow-delimiters)
	  (rainbow-delimiters-mode t)
	)
  )
(add-hook 'emacs-lisp-mode-hook 'my-emacs-lisp-mode-hook)

;;
;; * auto-complete mode
;;
(eval-after-load "auto-complete"
  '(progn
	 (setq ac-auto-start nil)))
(when (my-try-require 'auto-complete)
  (setq
   ;; 숫자면 해당 숫자 길이 이상의 문자 입력하면 바로 ac시작
   ac-auto-start 2
   ac-trigger-key "TAB"
   ac-use-menu-map t
   ac-quick-help-limit 1.0
   )
  ;; http://blog.iany.me/2012/03/fix-tab-binding-for-yasnippet-and-auto-complete/
  (defun my-tab-noconflict ()
	(let ((command (key-binding [tab]))) ; remember command
	  (local-unset-key [tab]) ; unset from (kbd "<tab>")
	  (local-set-key (kbd "TAB") command))) ; bind to (kbd "TAB")
  ;; (add-hook 'ruby-mode-hook 'my-tab-noconflict)
  (add-hook 'markdown-mode-hook 'my-tab-noconflict)
  (add-hook 'orgg-mode-hook 'my-tab-noconflict)
  (add-to-list
   'ac-dictionary-directories
   "~/elisp/alien/el-get-package/auto-complete/dict")
  (when (my-try-require 'auto-complete-config)
	(setq ac-sources '(
					   ac-source-words-in-same-mode-buffers
					   ac-source-yasnippet
					   ac-source-abbrev
					   ac-source-dictionary
					   ))
	(ac-config-default)
	(add-to-list 'ac-modes 'objc-mode)
	)
  (setq my-use-clang-complete nil)
  ;; (when (and my-use-clang-complete  (my-try-require 'auto-complete-clang-async))
  ;; 	(defun my-ac-cc-clang-completion-mode-setup ()
  ;; 	  (setq ac-clang-complete-executable "c:/prj/oss/mine/emacs-clang-complete-async/build/Debug/clang-complete.exe")
  ;; 	  (setq ac-sources '(ac-source-clang-async))
  ;; 	  (ac-clang-launch-completion-process)
  ;; 	  )
  ;; 	(progn
  ;; 	  (add-hook 'c-mode-common-hook 'my-ac-cc-clang-completion-mode-setup)
  ;; 	  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  ;; 	  (global-auto-complete-mode t)
  ;; 	  )
  ;; )
  )

;;
;; * dash-at-point
;;
(when macp
  (when (my-try-require 'dash-at-point) 
	(autoload 'dash-at-point "dash-at-point"
	  "Search the word at point with Dash." t nil)
	(global-set-key "\C-cd" 'dash-at-point)
	)
  )
;;
;; * ruby mode
;;
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;;
;; * qml-mode
;;
(when (my-try-require 'qml-mode)
  (add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))
  (modify-coding-system-alist 'file "\\.qml$" 'utf-8)
  )

;;
;; * markdown
;;
(unless macp
  (progn
	(autoload 'markdown-mode "markdown-mode.el"
	  "Major mode for editing Markdown files" t)
	(setq auto-mode-alist
		  (cons '("README" . markdown-mode) auto-mode-alist))
    (setq auto-mode-alist
		  (cons '("\\.text" . markdown-mode) auto-mode-alist))))


;;
;; * Visual-Basic-Mode
;;
;; (if (and win32p officep)
;;     (progn
;;       (autoload 'visual-basic-mode "visual-basic-mode" "Visual Basic mode." t)
;;       (add-to-list 'auto-mode-alist '("\\.\\(vbs\\|frm\\|bas\\|cls\\)$" . visual-basic-mode) nil)
;;       (setq-default visual-basic-allow-single-line-if nil
;; 		    visual-basic-capitalize-keywords-p t
;; 		    visual-basic-fontify-p t
;; 		    visual-basic-ide-pathname (quote c:devvs6vb98vb6\.exe)
;; 		    visual-basic-mode-indent 4
;; 		    visual-basic-wild-files "*.frm *.bas *.cls *.vbs *.wsf *.wsc")))

;; ;;
;; ;; Lua Mode
;; ;;
;; (defun my-lua-mode-hook ()
;;   (setq indent-tabs-mode nil)
;;   (if (string= (file-name-extension (buffer-file-name)) "wlua")
;;       (set (make-local-variable 'lua-default-application) "c:\\dev\\lua\\wlua.exe")))
;; (setq my-lua-file-ext-regexp (regexp-opt '("wlua" "lua")))
;; (if t ;;(and win32p officep)
;;     (progn
;;       (autoload 'lua-mode "lua-mode" "Lua mode." t)
;;       (setq-default lua-default-command-switches '("-i"))
;; 	  (add-to-list 'auto-mode-alist `'(,my-lua-file-ext-regexp . lua-mode) nil)
;;       (setq-default lua-default-application "c:\\dev\\lua\\lua.exe")))
;; 	  ;;(setq-default lua-default-application (if win32p "c:/msys/1.0/local/bin/lua" "/home/rp)
;;       ;;(add-hook 'lua-mode-hook (lambda () ))

;; * ediff
(eval-after-load "ediff"
  '(progn
	 (setq
	  ;; ediff-window-setup-function 'ediff-setup-windows-plain
	  ediff-window-setup-function 'ediff-setup-windows-multiframe
	  ediff-split-window-function 'split-window-horizontally
	  ediff-make-buffers-readonly-at-startup t
	  )
	 (cond
	  (win32p
	   (setq ediff-diff-program "c:/dev/gnuwin32/bin/diff.exe")))
	 ))


;; * compilation-mode
(eval-after-load "compile"
  '(progn
	 (defun my-compilation-setup()
	   (setq
		truncate-lines nil
		compilation-scroll-output t
		compilation-window-height 15)
	   )
	 (add-hook 'compilation-mode-hook 'my-compilation-setup)
	 ))

;;
;; * cmake
;;
(when (my-try-require 'cmake-mode)
  (require 'cmake-mode)
  (fset 'my-cmake-sort-list
		[?\M-m ?\C-  ?\C-e ?\M-w ?\C-\M-u ?\C-a ?\C-n ?\C-  ?\C-\M-u ?\C-\M-n ?\C-p ?\C-e ?\M-x ?s ?o ?r ?t ?- ?l ?i ?n ?e ?s return ?\C-\M-u ?\C-s ?\M-e ?\C-y return ?\C-e])
  (defun my-cmake-mode-hook ()
	(subword-mode 1)
	(local-set-key (kbd "C-c . r") 'cmake-command-run)
	(local-set-key (kbd "C-c . h") 'cmake-help-list-commands)
	(local-set-key (kbd "C-c . t") 'cmake-get-topic)
	(local-set-key (kbd "C-c . u") 'unscreamify-cmake-buffer)
	(local-set-key (kbd "C-c . s") 'my-cmake-sort-list)
	)
  (setq auto-mode-alist
		(append '(
				  ("CMakeLists\\.txt\\'" . cmake-mode)
				  ("\\.cmake\\'" . cmake-mode)
				  )
				auto-mode-alist))
  (add-hook 'cmake-mode-hook 'my-cmake-mode-hook)
  )

;;
;; * eshell
;;
(if win32p
    (defun eshell/op (FILE)
      "Invoke (w32-shell-execute \"Open\" FILE) and substitute slashes for backslashes.
   i.e: c:/home $ op test.xls ==> open test.xls in excel!!!"
      (w32-shell-execute "Open" (substitute ?\\ ?/ (expand-file-name FILE)))))

;;
;; * xaml
;;
(setq auto-mode-alist (cons '("\.xaml$" . nxml-mode) auto-mode-alist))

;;
;; * graphviz
;;
(eval-after-load "graphviz-dot-mode"
  '(progn
	 (cond
	  ((and win32p officep)
	   (progn
		 (setq
		  graphviz-dot-dot-program "c:\\dev\\graphviz\\bin\\dot.exe"
		  graphviz-dot-indent-width 4
		  graphviz-dot-preview-extension "gif"
		  ))))))

;;;; flymake
;;
;; 이상하게 어떤 모드는 flymake를 require 하지 않으면 오류가 난다.
;; 어디서 나는지 알면 아래 require는 제거해도 된다.
(require 'flymake)
;
(eval-after-load "flymake"
  '(progn
	 (setq
	  ;; i hate gui style warning
	  flymake-gui-warnings-enabled nil
	  ;; -1 = NONE, 0 = ERROR, 1 = WARNING, 2 = INFO, 3 = DEBUG
	  flymake-log-level 0
	  flymake-allowed-file-name-masks '(;; ("^\\.emacs$" flymake-for-el-init)
										;; (".+\\.el$" flymake-for-el-init)
										;; ("\\.py\\'" flymake-pyflakes-init)
										;; (".+\\.scss$" flymake-scss-init)
										;; ("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'" flymake-simple-make-init)
										;; ("\\.xml\\'" flymake-xml-init)
										;; ("\\.html?\\'" flymake-xml-init)
										;; ("\\.cs\\'" flymake-simple-make-init)
										;; ("\\.p[ml]\\'" flymake-perl-init)
										;; ("\\.php[345]?\\'" flymake-php-init)
										;; ("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
										;; ("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup)
										;; ("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
										;; ("\\.tex\\'" flymake-simple-tex-init)
										;; ("\\.idl\\'" flymake-simple-make-init)
										)
	  )))

;;
;; * plantuml
;;
(eval-after-load "plantuml"
  (progn
	(setq
	 plantuml-jar-path (cond
						(win32p
						 (cond
						  ((file-exists-p "c:/dev/plantuml/plantuml.jar")
						   "c:/dev/plantuml/plantuml.jar")
						  ((file-exists-p "c:/dev/utility/plantuml.jar")
						   "c:/dev/utility/plantuml.jar")
						  ))
						(t "~/scripts/plantuml.jar"))
	 )
	)
  )

;;
;; * matlab
;;
(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)

;;
;; * protobuf mode
;;
(when (my-try-require 'protobuf-mode)
  (add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
  )

(when (featurep 'eproject)
  (setq
   ;; do not rename buffer to its relative path. too long to see in mode line!
   prj-rename-buffers nil
   ;; do not add/remove too intelligent. :(
   prj-autotracking nil
   )
  (global-set-key (kbd "C-c C-f") 'eproject-visitfile)
  )

(when (my-try-require 'projectile)
  (require 'my-projectile)
  )

(when (my-try-require 'qt-pro)
  (add-to-list 'auto-mode-alist '("\\.pr[io]$" . qt-pro-mode)))


(provide 'my-programming)
