(require 'speedbar)
;; (eval-after-load "info" '(require 'sb-info)) 
;; (require 'sb-info "sb-info" t)
;; (require 'sb-html nil t)
;; (add-to-list 'load-path "~/elisp/cedet-1.0pre6/common/")
;; (load "cedet")
;; (global-ede-mode t)
;; (global-semantic-stickyfunc-mode 1) ;; 화면에 안보이는 함수를 보여준다.
;; (global-semantic-idle-scheduler-mode 0)
;; (require 'semantic-ia)
(require 'semantic)
(require 'cedet)
(defun jhlee:semantic-load-enable-minimum-features ()
  "Enable the minimum number of semantic features for basic usage.
This includes:
 `semantic-idle-scheduler-mode' - Keeps a buffer's parse tree up to date.
 `semanticdb-minor-mode' - Stores tags when a buffer is not in memory.
 `semanticdb-load-ebrowse-caches' - Loads any ebrowse dbs created earlier."
  (interactive)

  (global-semantic-idle-scheduler-mode 1)

  (global-semanticdb-minor-mode 1)

  ;; @todo - Enable this
  ;; (semanticdb-cleanup-cache-files t)

  ;; Don't do the loads from semantic-load twice.
  (when (null semantic-load-system-cache-loaded)

    ;; This loads any created system databases which get linked into
    ;; any searches performed.
    (setq semantic-load-system-cache-loaded t)

    ;; This loads any created ebrowse databases which get linked into
    ;; any searches performed.
    (when (and (not (featurep 'xemacs))
	       (boundp 'semanticdb-default-system-save-directory)
	       (stringp semanticdb-default-system-save-directory)
	       (file-exists-p semanticdb-default-system-save-directory))
      (semanticdb-load-ebrowse-caches))
    )
  )
(cond
 (win32p
  (semantic-add-system-include "c:/dev/sdk/boost/boost/include" 'c++-mode)
  (semantic-add-system-include "c:/dev/sdk/windows/include" 'c++-mode)
  (semantic-add-system-include "c:/dev/vs8/vc/include" 'c++-mode)
  (semantic-add-system-include "c:/dev/vs8/vc/atlmfc/include" 'c++-mode))
 (t
  ;; (semantic-add-system-include "~/include/boost/include" 'c++-mode)
  (semantic-add-system-include "/usr/include" 'c++-mode)
  (semantic-add-system-include "/usr/include/c++/4.2.1" 'c++-mode)))

(progn
  ;; ;; (semantic-load-enable-guady-code-helpers)
  ;; ;; (semantic-load-enable-excessive-code-helpers)
  ;; ;; (semantic-load-enable-semantic-debugging-helpers) ;; Enable this if you develop in semantic, or develop grammars
  ;; (semantic-load-enable-minimum-features)
  (jhlee:semantic-load-enable-minimum-features)
  )
(setq-mode-local
 c++-mode
 semanticdb-find-default-throttle
 '(project unloaded system recursive))
(defun joon-semantic-hook ()
  (imenu-add-to-menubar "TAGS"))
(add-hook 'semantic-init-hooks 'joon-semantic-hook)

;; if you want to enable support for gnu global
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
;; (semantic-load-enable-primary-exuberent-ctags-support)

(global-ede-mode t)

(if officep
	(ede-cpp-root-project "pis-trunk"
                :name "pis trunk"
                :file "d:/prj/wp/pis/trunk/pis.sln"
                :include-path '("/PISCommon"
								"/PISCommon/CommonLib"
								"/PISCommon/Defect"
								"/PISCommon/DefectMap"
								"/PISCommon/DragonflyConf"
								"/PISCommon/Recipe"
								"/PISCommon/StateMachine"
								"/PISCommon/WQueue"
								"/SystemControl"
								"/SystemControl/AutoFocusControl"
								"/SystemControl/CameraControl"
								"/SystemControl/AutoFocusControl"
								"/SystemControl/CameraControl"
								"/SystemControl/CFRControl"
								"/SystemControl/CFRServer"
								"/SystemControl/CommonControl"
								"/SystemControl/ConveyerControl"
								"/SystemControl/DAQInterface"
								"/SystemControl/FilmMeasureControl"
								"/SystemControl/FilmMeasureProxy"
								"/SystemControl/ImagingControl"
								"/SystemControl/IPUControl"
								"/SystemControl/MACSControl"
								"/SystemControl/MACSServer"
								"/SystemControl/MotionControl"
								"/SystemControl/OpticsControl"
								"/SystemControl/PLCControl"
								"/SystemControl/CFRControl"
								"/SystemControl/CFRServer"
								"/SystemControl/CommonControl"
								"/SystemControl/ConveyerControl"
								"/SystemControl/DAQInterface"
								"/SystemControl/FilmMeasureControl"
								"/SystemControl/FilmMeasureProxy"
								"/SystemControl/ImagingControl"
								"/SystemControl/ImagingControl"
								"/SystemControl/IPUControl"
								"/SystemControl/MACSControl"
								"/SystemControl/MACSServer"
								"/SystemControl/MotionControl"
								"/SystemControl/OpticsControl"
								"/SystemControl/PLCControl"
								"/SystemControl/StageControl"
                                "/SystemControl"
                               )
                :system-include-path '("c:/dev/sdk/windows/include"
									   "c:/dev/vs8/vc/include"
									   "c:/dev/vs8/vc/atlmfc/include")
                :spp-table '(("isUnix" . "")
                             ("BOOST_TEST_DYN_LINK" . ""))))

(setq
 ecb-options-version "2.40"
 ecb-eshell-auto-activate t
 ecb-auto-activate t
 ecb-compilation-buffer-names (quote (("*Calculator*") ("*vc*") ("*vc-diff*") ("*Apropos*") ("*Occur*") ("\\*.*shell.*\\*" . t) ("\\*[cC]ompilation.*\\*" . t) ("\\*i?grep.*\\*" . t) ("*JDEE Compile Server*") ("*Help*") ("*Completions*") ("*Backtrace*") ("*Compile-log*") ("*bsh*") ("*Messages*") ("^\\*Whitespace.+\\*" . t) ("*Process List*") ("*Python Output*") ("*Directory")))
 ecb-compilation-major-modes (quote (compilation-mode grep-mode rcirc-mode xgtags-select-mode completion-mode erc-mode gud-mode change-log-mode))
 ecb-compilation-predicates nil ;;(quote (comint-check-proc joonhwan-want-this-ecb-compilation-window))
 ecb-compile-window-height 10
 ecb-compile-window-temporally-enlarge 'after-display
 ecb-compile-window-width (quote frame)
 ecb-enlarged-compilation-window-max-height 0.5
 ecb-excluded-directories-regexps (quote ("^\\(CVS\\|\\.[^xX]*\\)$" "^\\(\\.svn\\)$" "^\\([Rr]elease\\|[Dd]ebug\\)$" "__Win32_ReleaseNoPDB"))
 ecb-show-source-file-extension t
 ecb-source-file-regexps (quote ((".*" ("\\(^\\(\\.\\|#\\)\\|\\(~$\\|\\(_i\\|_p\\)\\.\\(h\\|c\\)$\\)\\|\\(~$\\|\\.\\(elc\\|obj\\|o\\|class\\|lib\\|dll\\|a\\|so\\|cache\\|bak\\|vspscc\\|WW\\|plg\\|tlb\\|opt\\|ncb\\|scc\\|aps\\|APS\\|clw\\|bin\\)$\\)\\)") ("^\\.\\(emacs\\|gnus\\)$"))))
 ecb-source-path (quote
				  (cond
				   (officep
					  (("c:/prj/wise/pis" "pis-trunk")
						 ("c:/prj/wise/pis-branches" "pis-branches")))
				   ((and homep macp)
					("/Users/jhlee/prj" projects))))
 ecb-tag-header-face (quote ecb-default-highlight-face)
 ecb-toggle-layout-sequence (quote ("left4" "left2"))
 ;;'(ecb-wget-setup (quote ("~/bin/wget.exe" . windows)))
 ;; ecb-wget-setup (quote ("c:/dev/gnuwin32/bin/wget.exe" . windows))
 ;; ecb-windows-height 0.25
 ecb-windows-width 30
 ecb-tip-of-the-day nil
 ecb-run-ediff-in-ecb-frame nil
 )
(add-to-list 'load-path "~/elisp/ecb")
(require 'ecb-autoloads)
;; (add-hook
;;  'ecb-activate-before-layout-draw-hook 
;;  '(lambda() 
;; 	  (setq
;; 	   ecb-auto-activate t
;; 	   )
;; 	  ))
(global-set-key "\C-c,,e" 'my-ecb-activate)

(provide 'my-ecb)