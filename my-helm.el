;; -*- coding:utf-8 -*-
(require 'helm)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c a") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "M-y") 'helm-show-kill-ring)

(define-key helm-command-map (kbd "<return>") 'helm-mini)

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

;; (define-key helm-map (kbd "<ret>") 'helm-mini)

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq
 ;; open helm buffer inside current window, not occupy whole other window
 helm-split-window-in-side-p           t
 ;; move to end or beginning of source when reaching top or bottom of source.
 helm-move-to-line-cycle-in-source     t
 ;; search for library in `require' and `declare-function' sexp.
 helm-ff-search-library-in-sexp        t
 ;; scroll 8 lines other window using M-<next>/M-<prior>
 helm-scroll-amount                    8
 
 helm-ff-file-name-history-use-recentf t
 ;; M-x 가 더지능적이됨. :) 나중에 C-u 를 가지고 옵션으로 실행하게 할 수 있을듯.
 ;; helm-M-x-fuzzy-match t 
 ;; helm-buffers-fuzzy-matching t
 ;; helm-recentf-fuzzy-match    t
 )

(helm-mode 1)
(helm-autoresize-mode t)

;; (helm-mode 1)

;; 공통
;; (setq helm-full-frame t)
;; (cond
;;  (macpq
;;   ;; 문제가 있다.
;;   (setq helm-top-command "-ncols %s -F -R -u")
;;   ;; hint from
;;   ;; https://github.com/emacs-helm/helm/commit/e6d0634c41eeeb2219d15baf0dfd4758ef16b221
;;   (add-to-list 'helm-completing-read-handlers-alist '(tmm-menubar . nil) t)
;;   )
;;  (win32p
;;   (setq helm-grep-default-command "perl.exe c:/dev/utility/ack.pl -Hn --no-group --no-color %e %p %f"
;; 		helm-grep-default-recurse-command "perl.exe c:/dev/utility/ack.pl -H --no-group --no-color %e %p %f")
;;   ;; override original
;;   (defun* helm-grep-use-ack-p (&key where)
;; 	(case where
;; 	  (default (string= (helm-grep-command) "perl.exe"))
;; 	  (recursive (string= (helm-grep-command t) "perl.exe"))
;; 	  (strict (and (string= (helm-grep-command t) "perl.exe")
;; 				   (string= (helm-grep-command) "perl.exe")))
;; 	  (t (and (not (string= (helm-grep-command) "git-grep"))
;; 			  (or (string= (helm-grep-command) "perl.exe")
;; 				  (string= (helm-grep-command t) "perl.exe"))))))
;;   )
;;  )

(provide 'my-helm)
