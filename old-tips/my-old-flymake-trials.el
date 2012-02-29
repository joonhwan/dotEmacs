
;; (setq flymake-allowed-file-name-masks
;; 	  (cons '(".+\\.c$"
;; 			  flymake-simple-make-init
;; 			  flymake-simple-cleanup
;; 			  flymake-get-real-file-name)
;; 			flymake-allowed-file-name-masks))

;; (add-hook 'find-file-hook 'flymake-find-file-hook)

;; (setq flymake-allowed-file-name-masks
;; 	  '(("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'"
;; 		 my-flymake-simple-make-init
;; 		 flymake-simple-cleanup
;; 		 flymake-get-real-file-name)
;; 		(".+\\.c$" flymake-simple-make-init flymake-simple-cleanup flymake-get-real-file-name)
;; 		("\\.xml\\'" flymake-xml-init)
;; 		("\\.html?\\'" flymake-xml-init)
;; 		("\\.cs\\'" flymake-simple-make-init)
;; 		("\\.p[ml]\\'" flymake-perl-init)
;; 		("\\.php[345]?\\'" flymake-php-init)
;; 		("\\.h\\'" flymake-master-make-header-init flymake-master-cleanup)
;; 		("\\.java\\'" flymake-simple-make-java-init flymake-simple-java-cleanup)
;; 		("[0-9]+\\.tex\\'" flymake-master-tex-init flymake-master-cleanup)
;; 		("\\.tex\\'" flymake-simple-tex-init)
;; 		("\\.idl\\'" flymake-simple-make-init)))

;; (setq flymake-allowed-file-name-masks
;;            (cons '("\\.\\(?:c\\(?:pp\\|xx\\|\\+\\+\\)?\\|CC\\)\\'"
;;                    flymake-simple-make-init
;;                    flymake-simple-cleanup
;;                    flymake-get-real-file-name)
;;                  flymake-allowed-file-name-masks))

;; (defun my-flymake-simple-make-init ()
;;   (flymake-simple-make-init-impl
;;    'flymake-create-temp-inplace
;;    t
;;    t
;;    "Makefile"
;;    'my-flymake-get-make-cmdline))

;; (defun my-flymake-get-make-cmdline (source base-dir)
;;   (list "make"
;; 	(list "-s"
;; 	      "-C"
;; 	      base-dir
;; 	      (concat "CHK_SOURCES=" source)
;; 	      )))
