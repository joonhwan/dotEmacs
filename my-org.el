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
 org-agenda-files '("~/DropBox/todo.org")
 org-default-notes-file "~/DropBox/notes.org"
 ;; org-agenda-ndays 7
 ;; org-deadline-warning-days 14
 ;; org-agenda-show-all-dates t
 ;; org-agenda-skip-deadline-if-done t
 ;; org-agenda-skip-scheduled-if-done t
 ;; org-agenda-start-on-weekday nil
 ;; org-reverse-note-order t
 org-remember-store-without-prompt t
 ;; org-fast-tag-selection-single-key (quote expert))

 org-plantuml-jar-path "c:/dev/plantuml/plantuml.jar"
 )

(if win32p
	;; in win32p (user-full-name) cannot give us anything.
	(progn
	  (defun my-user-full-name (&optional UID)
		;; my-name
		"Joonhwan Lee"
		)
	  (fset 'user-full-name 'my-user-full-name)))

(setq org-export-htmlize-output-type 'css)
(setq org-export-html-style "<link rel=\"stylesheet\" type=\"text/css\" href=\"org-styles.css\">")

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

(define-key org-mode-map "\C-col" 'org-store-link)
(define-key org-mode-map "\C-coa" 'org-agenda)
(define-key org-mode-map "\C-cob" 'org-iswitchb)
(define-key org-mode-map "\C-cop" 'my-org-publish)


(provide 'my-org)
