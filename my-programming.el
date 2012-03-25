;;
;; dsvn(equivalent to tortoisesvn)
;;
;; (require 'vc-svn)

;;
;; magit
;;
(when (my-try-require 'magit)
  (global-set-key (kbd "C-x C-g") 'magit-status)
  ;; unable to detect end of process in magit process buffer?!
  ;; discussion found https://github.com/magit/magit/issues/18
  ;; but no help. :(
  ;; (setq magit-process-connection-type nil)
)

;;
;; nXML mode
;;
;; (progn
;;   (add-to-list 'load-path "~/elisp/nxml")
;;   (load "rng-auto")
;;   (add-to-list 'auto-mode-alist  '("\\.\\(xml\\|xsl\\|rng\\|xhtml\\)\\'" . nxml-mode) nil)
;;   (setq nxml-child-indent 4))))


;;
;; emacs lisp
;;
;; (require 'rainbow-delimiters)
;; (add-hook 'emacs-lisp-mode-hook
;;           '(lambda ()
;;              (interactive)
;;              ;; (require 'eldoc)
;;              ;; (turn-on-eldoc-mode)
;;              (rainbow-delimiters-mode t)
;; 			 ))

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
  (setq auto-mode-alist
		(append '(
				  ("CMakeLists\\.txt\\'" . cmake-mode)
				  ("\\.cmake\\'" . cmake-mode)
				  )
				auto-mode-alist))
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
(defun my-py-execute-buffer (&optional shell dedicated switch)
  (interactive)
  (py-execute-buffer shell dedicated switch)
  (popwin:display-buffer "*Python*")
  )
(defun my-py-shell (&optional argprompt dedicated pyshellname switch sepchar)
  (interactive "P")
  (let ((py-shell-process (py-shell argprompt dedicated pyshellname switch sepchar)))
	(when (functionp 'popwin:display-buffer)
	  (popwin:display-buffer (process-buffer py-shell-process)))
	))
(define-key python-mode-map (kbd "\C-c\C-c") 'my-py-execute-buffer)
(define-key python-mode-map (kbd "\C-c!") 'my-py-shell)
(define-key python-mode-map (kbd "\C-c\C-z") 'my-py-shell)

(eval-after-load "python-mode"
  '(progn
	 (setq
	  ;; disable python-mode to pop up buffer
	  py-split-windows-on-execute-p nil
	  py-shell-switch-buffers-on-execute-p nil
	  )
	 (cond
	  (macp
	   (setq python-python-command "python")
	   )
	  (t
	   (setq python-python-command "c:/dev/python26/python.exe")
	   )
	  )))


;;;; flymake
;;
(eval-after-load "flymake"
  '(progn
	 (setq
	  ;; i hate gui style warning
	  flymake-gui-warnings-enabled nil
	  ;; -1 = NONE, 0 = ERROR, 1 = WARNING, 2 = INFO, 3 = DEBUG
	  flymake-log-level 2
	  )))

;;
;; plantuml
;;
(eval-after-load "plantuml"
  (progn
	(setq plantuml-jar-path (cond
							 (win32p "c:/dev/plantuml/plantuml.jar")
							 (t "~/scripts/plantuml.jar"))
	)
  )
  )

;; (require 'csharp-mode)


(provide 'my-programming)
