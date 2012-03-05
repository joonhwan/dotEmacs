(defun my-mac-shell()
  (interactive)
  ;; (ansi-term "/bin/bash" "shell")
  (shell)
  )

(cond
 (win32p
  (global-set-key "\C-z" 'cmd-shell)
  ;; (setq w32-quote-process-args ?\")
  )
 (macp
  (global-set-key "\C-z" 'my-mac-shell)
  ))

(defun my-shell-setup()
  (dirtrack-mode t)
  (ansi-color-for-comint-mode-on)
  (setq comint-prompt-read-only t)
)

(add-hook 'shell-mode-hook 'my-shell-setup)

(provide 'my-shell)
