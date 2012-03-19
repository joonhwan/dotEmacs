(require 'org)
(require 'org-compat)
(require 'org-publish)
(require 'org-html)
(require 'iimage)
;;(require 'gcal)
;;(require 'org-install)

(defvar my-org-current-project-name nil)
(defun my-org-publish ()
  (interactive)
  (org-publish my-org-current-project-name))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(modify-coding-system-alist 'file "\\.org\\'" 'utf-8)

;; cafe24 etc webhosting doesn't support xml htxml :(
;; (setq org-export-html-xml-declaration
;; 	  '(("html" . "<?xml version=\"1.0\" encoding=\"%s\"?>")
;; 		("php" . "<?php echo \"<?xml version=\\\"1.0\\\" encoding=\\\"%s\\\" ?>\"; ?>")))
(my-modify-alist-with-alist
 'org-export-html-xml-declaration
 '(("html" . "")))

;; active org-babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)
   (dot . t)
   (gnuplot . t)
   (plantuml . t)))

;; customizing org
(setq
 org-startup-folded t
 ;; #+begin_src ... #+end_src  font-lock
 org-src-fontify-natively t
 org-directory "~/DropBox/org"
 org-agenda-files '("todo.org")
 ;; org-agenda-ndays 7
 ;; org-deadline-warning-days 14
 ;; org-agenda-show-all-dates t
 ;; org-agenda-skip-deadline-if-done t
 ;; org-agenda-skip-scheduled-if-done t
 ;; org-agenda-start-on-weekday nil
 ;; org-reverse-note-order t
 ;; org-remember-store-without-prompt t
 ;; org-fast-tag-selection-single-key (quote expert))
 org-confirm-babel-evaluate nil
 org-plantuml-jar-path (cond
						(win32p "c:/dev/plantuml/plantuml.jar")
						(t "~/scripts/plantuml.jar"))
 )

(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(if win32p
	;; in win32p (user-full-name) cannot give us anything.
	(progn
	  (defun my-user-full-name (&optional UID)
		;; my-name
		"Joonhwan Lee"
		)
	  (fset 'user-full-name 'my-user-full-name)))
(setq
 org-export-htmlize-output-type 'css
 org-export-html-style (concat "<link"
							   "rel=\"stylesheet\" "
							   "type=\"text/css\" "
							   "href=\"org-styles.css\""
							   ">")
 )

(setq org-publish-project-alist
	  '(
		("inherit-org-info-js"
		 :base-directory "~/DropBox/orgwiki/code"
		 :recursive t
		 :base-extension "js"
		 :publishing-directory "~/wiki/web"
		 :publishing-function org-publish-attachment)
		("orgwiki-note"
		 :author "Joonhwan Lee"
		 :auto-preamble t
		 :auto-sitemap t
		 :base-directory "~/DropBox/orgwiki/"
		 :base-extension "org"
		 :headline-levels 4
		 :publishing-directory "~/wiki/web"
		 :publishing-function org-publish-org-to-html
		 :recursive t
		 :section-numbers nil
		 :sitemap-filename "index.org"
		 :sitemap-title "sitemap"
		 :table-of-contents t
		 )
		("orgwiki-static"
		 :base-directory "~/DropBox/orgwiki"
		 :base-extension "css\\|js\\|png\\|jpg\\|gif\\|pdf\\|mp3\\|ogg\\|swf"
		 :publishing-directory "~/wiki/web"
		 :recursive t
		 :publishing-function org-publish-attachment
		 )
		("orgwiki" :components ("inherit-org-info-js" "orgwiki-note" "orgwiki-static"))
		))

(add-to-list 'safe-local-variable-values '(my-org-current-project-name . "orgwiki"))

;; if i think it is safe block to be evaluated(i.e plantuml code)
;; then, just do not ask me about confirmation.
(defun my-org-babel-confirm-evaluate-func (lang block)
  (cond
   ((string-equal lang "plantuml")
	nil)
   (t
	t)
   ))
(setq org-confirm-babel-evaluate 'my-org-babel-confirm-evaluate-func)

(defun my-org-mode-hook ()
  (iimage-mode t)
  (auto-fill-mode t)
  )

(add-hook 'org-mode-hook 'my-org-mode-hook)

;; ;; Set to the location of your Org files on your local system
;; (setq org-directory "~/org")
;; ;; Set to the name of the file where new notes will be stored
;; (setq org-mobile-inbox-for-pull "~/org/flagged.org")
;; ;; Set to <your Dropbox root directory>/MobileOrg.
;; (setq org-mobile-directory "~/Dropbox/MobileOrg")

;;
;; org-capture configuration
;;
(setq
 ;; filename for notes fallback case out of 'org-capture-template'
 org-default-notes-file "notes.org"
 ;; 
 org-capture-templates 
 '(("j" ;; key
	"Journal" ;; description
	entry ;; type
	(file+datetree "journal.org") ;; target
	"* %?\nEntered on %U\n  %i\n  %a" ;; template
	)
   ("c" ;; key
	"CodeNote" ;; description
	entry ;; type
	(file+headline "note.org" "Code") ;; target
	"** %?\nEntered on %U\n  %i\n  %a" ;; template
	)
   ("l" ;; key
	"Lifehack" ;; description
	entry ;; type
	(file+headline "note.org" "Life") ;; target
	"** %?\nEntered on %U\n  %i\n  %a" ;; template
	)
   )
 )

(defvar my-org-image-irfanview-path
  "c:/Program Files/IrfanView/i_view32.exe"
  "irfanview is being used to handling image in org mode"
  )

(defvar my-org-image-subdirectory-name
 "img"
 "subdirectory name where image file will be created"
 )

(defun my-org-paste-image-from-clipboard ()
  "Take a screenshot into a time stamped unique-named file in the same 
  directory as the org-buffer and insert
  a link to this file."
  (interactive)
  (let* ((buffer-file-directory
		  (file-name-directory (buffer-file-name)))
		 (image-directory (concat
						   buffer-file-directory
						   my-org-image-subdirectory-name))
		 (image-path-body (concat
						   image-directory
						   "/"
						   (file-name-sans-extension
							(file-name-nondirectory (buffer-file-name)))))
		 (image-path (convert-standard-filename (concat
					  image-path-body
					  "_"
					  (format-time-string "%Y%m%d_%H%M%S_")
					  ".png")))
		 (image-rel-path (file-relative-name image-path buffer-file-directory))
		 )
	(cond
	 ;; Windows: Irfanview
	 (win32p
	  (call-process my-org-image-irfanview-path nil nil nil (concat 
															 "/clippaste /convert=" image-path)))
	 (t
	  ;; Linux: ImageMagick
	  (call-process "import" nil nil nil image-path)))
	(insert (concat "[[file:" image-rel-path "]]"))
	(org-display-inline-images)))

(define-key org-mode-map "\C-col" 'org-store-link)
(define-key org-mode-map "\C-coa" 'org-agenda)
(define-key org-mode-map "\C-cob" 'org-iswitchb)
(define-key org-mode-map "\C-cop" 'my-org-publish)
(when (locate-library "anything")
  (define-key org-mode-map (kbd "C-c a o") 'anything-info-org)
  (define-key org-mode-map (kbd "C-c a k") 'anything-org-keywords)
)
(define-key global-map (kbd "C-c c") 'org-capture)

(provide 'my-org)
