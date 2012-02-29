
;;
;; frame-pop usage
;;
(defvar my-use-frame-pop nil)
(setq my-use-frame-pop nil)
(when (and window-system
		   my-use-frame-pop)
  (require 'framepop)
  (framepop-enable)
  (setq framepop-frame-parameters
		'((name . nil)                     ; use buffer name
		  (unsplittable . t)               ; always include this
		  (menu-bar-lines . 0)             ; no menu bar
		  (minibuffer . nil)               ;    or minubuffer
		  (left . -1)                      ; top left corner of screen,
		  (top . 30)                       ;    away from my main frame
		  (width . 71)                     ; narrower, so it fits nicely
		  ;; (background-color . "orchid4")   ; I like purple. So sue me.
		  ;; (foreground-color . "cornsilk")
		  ;; (font . "-*-courier-bold-o-*-*-12-*-*-*-m-*-*-*")
		  )))
