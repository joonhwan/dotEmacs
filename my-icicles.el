;;
;; 
;; icicles mode
;;
;; (setq-default icicle-cycling-respects-completion-mode-flag t)
(iswitchb-mode 1) ;; first activate iswitchb mode for icicle to handle
				  ;; it properly

(add-to-list 'load-path "~/elisp/icicles")
(require 'icicles)
(require 'icicles-install)
(iswitchb-default-keybindings)

(setq icicle-apropos-cycle-next-keys (quote ([next] [?\C-v]))
	  icicle-apropos-cycle-previous-keys (quote ([prior] [?\M-v])))
(setq icicle-reminder-prompt-flag nil) ;; i know icicle!. 
(setq-default icicle-download-dir "~/elisp/icicles")
(define-key minibuffer-local-completion-map "\C-n" 'icicle-next-apropos-candidate)
(define-key minibuffer-local-completion-map "\C-p" 'icicle-previous-apropos-candidate)
(global-set-key "\C-c,,r" 'icicle-recent-file)

;; while accessing emacs via xstart, following is needed for
;; S-Tab completion in icicle.
(if unixp
	(define-key icicle-mode-map [S-kp-tab] 'icicle-generic-S-tab))
;; (set-face-attribute
;;  'default nil
;;  :stipple nil :background "#0a0e1b" :foreground "#e0e0da")
(setq icicle-change-region-background-flag nil)
;; (setq icicle-saved-completion-sets (quote (("afx" . "c:/dev/vs8/VC/atlmfc/include/afx.icy"))))
(setq icicle-Completions-text-scale-decrease 0.0)

(setq icicle-file-sort 'icicle-dirs-first-p)

;; hack error...
(setq icicle-sort-functions-alist nil)


;; Turn on Icicle mode.
(icicle-mode 1)

(provide 'my-icicles)
  
