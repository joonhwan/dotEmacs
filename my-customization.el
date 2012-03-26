(message "loading my-customization")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(debug-on-error nil)
 '(safe-local-variable-values (quote ((eval ignore-errors "Write-contents-functions is a buffer-local alternative to before-save-hook" (add-hook (quote write-contents-functions) (lambda nil (delete-trailing-whitespace (point-min) (point-max)) nil)) (require (quote whitespace)) "Sometimes the mode needs to be toggled off and on." (whitespace-mode 0) (whitespace-mode 1)) (my-build-dir . "d:/prj/wp/sis/build/trunk") (anything-c-filelist-file-name . "d:/prj/wp/pis/trunk/cscope.files") (my-org-current-project-name . "orgwiki") (eval ignore-errors (add-hook (quote before-save-hook) (quote delete-trailing-whitespace)) (require (quote whitespace)) (set-face-attribute (quote whitespace-line) nil :background "red1" :foreground "yellow" :weight (quote bold)) (set-face-attribute (quote whitespace-tab) nil :background "red1" :foreground "yellow" :weight (quote bold)) "Need to ensure that whitespace mode is turned off and on again. This guaranteees that the new values of the whitespace-related variables will take effect." (whitespace-mode 0) (whitespace-mode 1)) (whitespace-line-column . 80) (whitespace-style face trailing lines-tail) (require-final-newline . t)))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
