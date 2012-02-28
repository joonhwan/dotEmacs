;;; Provide support for the environment on Mac OS X

(defun generate-environment ()
  "Dump the current environment into the ~/.MacOSX/environment.plist file."
  ;; The system environment is found in the global variable:
  ;; 'initial-environment' as a list of "KEY=VALUE" pairs.
  (interactive)
  (let ((list initial-environment)
        pair start command key value)
    ;; clear out the current environment settings
    (find-file "~/.MacOSX/environment.plist")
    (goto-char (point-min))
    (setq start (search-forward "<dict>\n"))
    (search-forward "</dict>")
    (beginning-of-line)
    (delete-region start (point))
    (while list
      (setq pair (split-string (car list) "=")
            list (cdr list))
      (setq key (nth 0 pair)
            value (nth 1 pair))
      (insert "  <key>" key "</key>\n")
      (insert "  <string>" value "</string>\n")

      ;; Enable this variable in launchd
      (setq command (format "launchctl setenv %s \"%s\"" key value))
      (shell-command command))
    ;; Save the buffer.
    (save-buffer)))
