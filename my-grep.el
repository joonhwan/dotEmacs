;; -*- coding:utf-8; -*-

(when win32p
  (eval-after-load "full-ack"
	(progn
	  (setq ack-executable "c:/dev/scripts/ack.cmd")
	  ;; (setq ack-arguments '("--nogroup" "--nopager"))
	  (setq
	   ack-heading nil
	   ack-context 0
	   )
	)
  ))

(setq  grep-files-aliases
	   '(("el" . "*.el")
		 ("cpp" . "*.cc *.cpp *.c *.h *.hh *.hpp *.ihh *.inl *.cxx *.hxx")
		 ("src" . "*.cc *.cpp *.c")
		 ("inc" . "*.h *.hh *.hpp *.ihh *.inl")
		 ("ch" . "*.[ch]")
		 ("c" . "*.c")
		 ("h" . "*.h")
		 ("asm" . "*.[sS]")
		 ("m" . "[Mm]akefile*")
		 ("l" . "[Cc]hange[Ll]og*")
		 )
	   grep-find-ignored-directories '
	   ("CVS" "OBSOLETE" ".OBSOLETE" "{arch}"
		"lost+found" "tmp"
		"release" "releaseAC" "releaseAS"
		"pdi_spec_lib" "vnc" "kernel"
		"doc" "mpsSamples" "mpsSystem"
		"3rd_party" "pfeSystem")
	   ;;
	   ;; @NOTE : following routine shouldn't be included.
	   ;;         More than often, (grep-compute-defaults) will do
	   ;;grep-use-null-device nil
	   ;;grep-find-template "find . <X> -type f <F> -print0 | xargs -0 -e grep <C> -nH -e <R>"
	   ;;grep-find-command "find . -type f -print0 | xargs -0 -e grep -nH -e "
	   ;;grep-find-use-xargs 'gnu)
	   ;;grep-command "grep -nH"
	   ;;find-program "/usr/bin/find"
	   ;;grep-highlight-matches 'auto-detect
	   )

(if win32p
	(setq
	 find-program "c:/dev/ezwinports/bin/gfind.exe"
	 grep-program "c:/dev/ezwinports/bin/grep.exe"
	 find-ls-option '("-exec ls -ld {} +";; "-ls"
					  .
					  "-ld" ;; "-hdlsb"
					  )
	 )
  )

(defun my-setup-grep-mode ()
  (turn-on-follow-mode)
  ;; (setq font-lock-defaults '(grep-mode-font-lock-keywords t))
)
(add-hook 'grep-setup-hook 'my-setup-grep-mode)

(progn
  (global-set-key (kbd "C-c g r") 'rgrep)		; Search Recursively
  (global-set-key (kbd "C-c g l") 'lgrep)		; Search Locally
  (if (commandp 'ack)
	(global-set-key (kbd "C-c g a") 'ack))
  )

(provide 'my-grep)

