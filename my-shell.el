(global-set-key "\C-z" 'shell)

(defun my-shell-setup()
  (dirtrack-mode t)
  (ansi-color-for-comint-mode-on)
  (setq comint-prompt-read-only t)
)

(add-hook 'shell-mode-hook 'my-shell-setup)

(provide 'my-shell)
