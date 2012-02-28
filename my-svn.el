(add-to-list 'load-path "~/elisp/svn")
(require 'vc-svn)

;; for quick access -_-

;; (setq vc-handled-backends nil)
(setq-default svn-program "c:/dev/svn/bin/svn.exe")
(autoload 'svn-status "dsvn" "Run `svn status'." t)
(autoload 'svn-update "dsvn" "Run `svn update'." t)

(defun my-svn-commit ()
  "Commit changes to current directory recursively"
  (interactive)
  (save-some-buffers)
  (let ((status-buf (current-buffer))
        (commit-buf (get-buffer-create "*svn commit*"))
        (window-conf (and svn-restore-windows (current-window-configuration)))
        (listfun (lambda () (with-current-buffer log-edit-parent-buffer
                              (svn-action-files)))))
    (log-edit 'my-svn-confirm-commit t
              (if (< emacs-major-version 23)
                  listfun
                (list (cons 'log-edit-listfun listfun)))
              commit-buf)
    (set (make-local-variable 'saved-window-configuration) window-conf)))

(defun my-svn-confirm-commit ()
  "Commit changes with the current buffer as commit message."
  (interactive)
  (let ((files (with-current-buffer log-edit-parent-buffer
                 (svn-action-files)))
        (commit-buf (current-buffer))
        (status-buf log-edit-parent-buffer)
        (window-conf saved-window-configuration)
	;; XEmacs lacks make-temp-file but has make-temp-name + temp-directory
        (msg-file (if (fboundp 'make-temp-file)
		      (make-temp-file "svn-commit")
		    (make-temp-name (expand-file-name "svn-commit"
						      (temp-directory))))))
    ;; Ensure final newline
    (goto-char (point-max))
    (unless (bolp)
      (newline))
    (write-region (point-min) (point-max) msg-file)
    (when (boundp 'vc-comment-ring)
      ;; insert message into comment ring, unless identical to the previous
      (let ((comment (buffer-string)))
	(when (or (ring-empty-p vc-comment-ring)
		  (not (equal comment (ring-ref vc-comment-ring 0))))
	  (ring-insert vc-comment-ring comment))))
    (kill-buffer commit-buf)
    (with-current-buffer status-buf
      (make-local-variable 'svn-commit-msg-file)
      (make-local-variable 'svn-commit-files)
      (setq svn-commit-msg-file msg-file)
      (setq svn-commit-files files)
      (svn-run 'commit (append (list "-N" "-F" msg-file) files)))
    (if window-conf
        (set-window-configuration window-conf))))

(provide 'my-svn)
