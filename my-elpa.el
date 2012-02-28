;;
;; elpa
;;
(add-to-list 'load-path "~/elisp/packages")
;; (setq-default package-directory-list '((concat my-dotfiles-dir "~/elisp/packages/installed/"))
(setq-default package-user-dir (concat my-dotfiles-dir "alien/elpa-package"))

(require 'package)

(when
    nil
  ;; from http://sachachua.com/blog/2011/01/emacs-24-package-manager/
  ;; Add the original Emacs Lisp Package Archive
  (add-to-list 'package-archives
	       '("elpa" . "http://tromey.com/elpa/"))
  ;; Add the user-contributed repository
  (add-to-list 'package-archives
	       '("marmalade" . "http://marmalade-repo.org/packages/")))

;; sync
(defun my-sync-package ()
  (interactive)
  (let ((buffer (url-retrieve-synchronously
				 "http://tromey.com/elpa/package-install.el")))
	(save-excursion
	  (set-buffer buffer)
	  (goto-char (point-min))
	  (re-search-forward "^$" nil 'move)
	  (eval-region (point) (point-max))
	  (kill-buffer (current-buffer)))))

;;(call-interactively 'package-initialize)
(package-initialize)

;;
;; another package manager
;;
(setq-default auto-install-directory "~/elisp/auto-install/")
(require' auto-install)


(provide 'my-elpa)
