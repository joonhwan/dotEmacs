;;
;;
;;
;; (require 'xgtags)
;; (global-set-key "\M-[" 'xgtags-select-prev-tag)
;; (global-set-key "\M-]" 'xgtags-select-next-tag)
;; (global-set-key "\C-cxr" 'xgtags-find-rtag)
;; (add-hook 'c-mode-hook '(lambda() (xgtags-mode 1)))
;; (add-hook 'c++-mode-hook '(lambda() (xgtags-mode 1)))
;; ;; gtags has a bug analyzing path. so....
;; (if win32p
;; 	(setq xgtags--tag-regexp "\\([^         ]+\\)[  ]+\\([0-9]+\\)[         ]+\\(.*\\.\\(?:cpp\\|hpp\\|h\\|c\\|idl\\)\\)[   ]+\\(.+\\)"))

;; (require 'anything)
;; (require 'anything-config)
;; (defun anything-ctags ()
;;   (interactive)
;;   (anything
;;    '((name . "Exuberant ctags")
;;     (init . anything-c-source-ctags-init)
;;     (candidates-in-buffer)
;;     (adjust)
;;     (type . line))))

(autoload 'cscope-set-initial-directory "xcscope")
(eval-after-load "xcscope"
  '(progn
	 (setq cscope-database-regexps
	  '(
		( "^d:/prj/wp"
		  ( t )
		  ( "c:/dev/vs9/vc" )
		  ( "c:/dev/sdk/codejock")
		  ( "c:/dev/sdk/boost/boost_1_43_0" )
		  ( "c:/dev/sdk/windows" )
		  ( "c:/qt/4.7.1")
		)
		))))

(provide 'my-tags)
