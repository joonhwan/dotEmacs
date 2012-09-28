;; -*- coding:utf-8 -*-
;; dsvn(equivalent to tortoisesvn)
;;
;; (require 'vc-svn)

;;
;; vc
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
;; magit
;;
(when (my-try-require 'magit)
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
		   (t
			"git"))))
)

;;
;; emacs lisp
;;
(my-try-require 'rainbow-delimiters)
(require 'eldoc)
(add-hook 'emacs-lisp-mode-hook
          '(lambda ()
             (interactive)
             (turn-on-eldoc-mode)
			 (if (featurep 'rainbow-delimiters)
				 (rainbow-delimiters-mode t)
			   )
			 ))

;;
;; ruby mode
;;
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))

;;
;; qml-mode
;;
(when (my-try-require 'qml-mode)
  (add-to-list 'auto-mode-alist '("\\.qml$" . qml-mode))
  (modify-coding-system-alist 'file "\\.qml$" 'utf-8)
  )

;;
;; markdown
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
;; Visual-Basic-Mode
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

;; ediff
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


;; compilation-mode
(eval-after-load "compile"
  '(progn
	 (defun my-compilation-setup()
	   (setq
		truncate-lines t
		compilation-scroll-output t
		compilation-window-height 15)
	   )
	 (add-hook 'compilation-mode-hook 'my-compilation-setup)
	 ))

;;
;; cmake
;;
(when (my-try-require 'cmake-mode)
  (require 'cmake-mode)
  (defun my-cmake-mode-hook ()
	(subword-mode 1)
	(local-set-key (kbd "C-c . r") 'cmake-command-run)
	(local-set-key (kbd "C-c . h") 'cmake-help-list-commands)
	(local-set-key (kbd "C-c . t") 'cmake-get-topic)
	(local-set-key (kbd "C-c . u") 'unscreamify-cmake-buffer)
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
;; eshell
;;
(if win32p
    (defun eshell/op (FILE)
      "Invoke (w32-shell-execute \"Open\" FILE) and substitute slashes for backslashes.
   i.e: c:/home $ op test.xls ==> open test.xls in excel!!!"
      (w32-shell-execute "Open" (substitute ?\\ ?/ (expand-file-name FILE)))))

;;
;; graphviz
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

;;
;; python
;;
(eval-after-load "python"
  '(progn
	 ;; hint from http://www.saltycrane.com/blog/2010/05/my-emacs-python-environment/
	 (require 'pymacs)
	 (pymacs-load "ropemacs" "rope-")
	 (setq ropemacs-enable-autoimport t)
	 (add-to-list 'load-path "~/.emacs.d/vendor/auto-complete-1.2")
	 (require 'auto-complete-config)
	 (add-to-list 'ac-dictionary-directories "~/.emacs.d/vendor/auto-complete-1.2/dict")
	 (ac-config-default)
	 (add-hook 'find-file-hook 'flymake-find-file-hook)
	 ;; Pyflakes for python
	 ;; (load-library "flymake-fringe-icons")
	 (when (load "flymake" t)
	   (defun flymake-pychecker-init ()
		 (let* ((temp-file (flymake-init-create-temp-buffer-copy
							'flymake-create-temp-inplace))
				(local-file (file-relative-name
							 temp-file
							 (file-name-directory buffer-file-name))))
		   (list "pycheck" (list local-file))))
	   (add-to-list 'flymake-allowed-file-name-masks
					'("\\.py\\'" flymake-pychecker-init)))
	 ;; (when (load "flymake" t)
	 ;;   (defun flymake-pyflakes-init ()
	 ;; 	 (let* ((temp-file (flymake-init-create-temp-buffer-copy
	 ;; 						'flymake-create-temp-inplace))
	 ;; 			(local-file (file-relative-name
	 ;; 						 temp-file
	 ;; 						 (file-name-directory buffer-file-name))))
	 ;; 	   (list "pycheckers"  (list local-file))))
	 ;;   (add-to-list 'flymake-allowed-file-name-masks
	 ;; 				'("\\.py\\'" flymake-pyflakes-init)))
	 (global-set-key (kbd "C-c C-p") 'flymake-goto-prev-error)
	 (global-set-key (kbd "C-c C-n") 'flymake-goto-next-error)
	 (defun my-electric-pair ()
	   "Insert character pair without sournding spaces"
	   (interactive)
	   (let (parens-require-spaces)
		 (insert-pair)))
	 (defun my-python-display-shell ()
	   (interactive)
	   (if (featurep 'popwin)
		   (popwin:display-buffer "*Python*")
		 (display-buffer "*Python*")))
	 (defun my-python-send-buffer ()
	   (interactive)
	   (python-send-buffer)
	   (when (featurep 'popwin)
		 (popwin:display-buffer "*Python*")))
	 (define-key python-mode-map (kbd "\C-c\C-c") 'my-python-send-buffer)
	 (define-key python-mode-map (kbd "\C-c!") 'my-python-display-shell)
	 (defun my-python-mode-hook ()
	   ;; (define-key python-mode-map "\"" 'my-electric-pair)
	   ;; (define-key python-mode-map "\'" 'my-electric-pair)
	   ;; (define-key python-mode-map "(" 'my-electric-pair)
	   ;; (define-key python-mode-map "[" 'my-electric-pair)
	   ;; (define-key python-mode-map "{" 'my-electric-pair)
	   (setq
		indent-tabs-mode nil
		tab-width 4
		python-remove-cwd-from-path nil
		)
	   (flymake-mode 1)
	   (eldoc-mode 1)
	   )
	 (add-hook 'python-mode-hook 'my-python-mode-hook)
	 ;; (when macp
	 ;;   (defun my-inferior-python-mode-comint-filter-for-mac (s)
	 ;; 	 (replace-regexp-in-string "" "" s)
	 ;; 	 )
	 ;;   (add-hook 'inferior-python-mode-hook 'my-inferior-python-mode-comint-filter-for-mac)
	 ;;   )
	 )
  )
;; (defun my-py-execute-buffer (&optional shell dedicated switch)
;;   (interactive)
;;   (sit-for 1.)
;;   (py-execute-buffer shell dedicated switch)
;;   (popwin:display-buffer "*Python*")
;;   )
;; (defun my-py-shell (&optional argprompt dedicated pyshellname switch sepchar)
;;   (interactive "P")
;;   (let ((py-shell-process (py-shell argprompt dedicated pyshellname switch sepchar)))
;; 	(when (functionp 'popwin:display-buffer)
;; 	  (popwin:display-buffer (process-buffer py-shell-process)))
;; 	))
;; (define-key python-mode-map (kbd "\C-c\C-c") 'my-py-execute-buffer)
;; (define-key python-mode-map (kbd "\C-c!") 'my-py-shell)
;; (define-key python-mode-map (kbd "\C-c\C-z") 'my-py-shell)
;; (eval-after-load "python-mode"
;;   '(progn
;; 	 (setq
;; 	  ;; disable python-mode to pop up buffer
;; 	  py-split-windows-on-execute-p nil
;; 	  py-shell-switch-buffers-on-execute-p nil
;; 	  )
;; 	 (cond
;; 	  (macp
;; 	   (setq python-python-command "python")
;; 	   )
;; 	  (t
;; 	   (setq python-python-command "c:/dev/python26/python.exe")
;; 	   )
;; 	  )
;; 	 (defun my-python-mode-hook ()
;; 	   (setq
;; 		py-shell-name "python"
;; 		py-shell-toggle-1 "python3"
;; 		py-shell-toggle-2 "python"
;; 		)
;; 	   (call-interactively 'py-switch-shell)
;; 	   )
;; 	 (add-hook 'python-mode-hook 'my-python-mode-hook)
;; ))


;;;; flymake
;;
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
;; plantuml
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
;; matlab
;;
(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive Matlab mode." t)

;;
;; protobuf mode
;;
(when (my-try-require 'protobuf-mode)
  (add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))
  )

;; (require 'csharp-mode)

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
