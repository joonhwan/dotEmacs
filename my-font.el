(progn
  ;; (set-face-font 'default
  ;; 				 "Menlo-15")
  ;; 				 ;; "Menlo-14")
  ;; 				 ;; "Menlo-13")
  ;;                ;;"Courier-14")
  ;; 				 ;; "Monaco-14")
  ;; 				 ;;"Andale_Mono-14")
  (set-fontset-font "fontset-default" '(#x1100 . #xffdc)
					'("NanumGothicOTF" . "iso10646-1"))
  (set-fontset-font "fontset-default" '(#xe0bc . #xf66e)
					'("NanumGothicOTF" . "iso10646-1"))
  (set-fontset-font "fontset-default" 'kana
					'("Hiragino Kaku Gothic Pro" . "iso10646-1"))
  (set-fontset-font "fontset-default" 'han
					'("Hiragino Kaku Gothic Pro" . "iso10646-1"))
  (set-fontset-font "fontset-default" 'japanese-jisx0208
					'("Hiragino Kaku Gothic Pro" . "iso10646-1"))
  (set-fontset-font "fontset-default" 'katakana-jisx0201
					'("Hiragino Kaku Gothic Pro" . "iso10646-1"))

  (setq face-font-rescale-alist
		'((".*hiragino.*" . 1.2)
		  (".*nanum.*" . 1.0))))

(provide 'my-font)
