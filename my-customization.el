;; -*- coding:utf-8-auto; -*-

(message "loading my-customization")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debug-on-error nil)
 '(org-agenda-files nil)
 '(org-drill-optimal-factor-matrix nil)
 '(safe-local-variable-values
   (quote
	((buffer-file-coding-system . utf-8-dos)
	 (buffer-file-coding-system . utf-8)
	 (eval c-set-offset
		   (quote innamespace)
		   0)
	 (ac-clang-flags "-Ic:/dev/vs9/VC/crt/src")
	 (ac-clang-flags "-I../../framework -I../../common -I../../system")
	 (ac-clang-flags "-I../framework -I../common")
	 (eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook"
		   (add-hook
			(quote write-contents-functions)
			(lambda nil
			  (delete-trailing-whitespace
			   (point-min)
			   (point-max))
			  nil))
		   (require
			(quote whitespace))
		   "Sometimes the mode needs to be toggled off and on."
		   (whitespace-mode 0)
		   (whitespace-mode 1))
	 (whitespace-line-column . 80)
	 (whitespace-style face trailing lines-tail)
	 (anything-c-everything-preferred-directory . "d:\\prj\\wp\\pis\\release-0.92-rc.*")
	 (require-final-newline . t)
	 (anything-c-filelist-file-name . "d:/prj/wp/pis/trunk/cscope.files")
	 (my-build-dir . "d:/prj/wp/sis/build/trunk")
	 (eval rainbow-mode t)
	 (my-org-current-project-name . "orgwiki")))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face)))))
