(defvar my-command-map)
(define-prefix-command 'my-command-map)
(global-set-key (kbd "C-`") my-command-map)

(define-key my-command-map (kbd "C-`") 'hs-toggle-hiding)
(let ((map (make-sparse-keymap)))
  (define-key map (kbd "RET")
	'anything-confirm-and-exit-minibuffer)
  map)
