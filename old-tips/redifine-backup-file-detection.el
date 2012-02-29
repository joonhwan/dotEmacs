
;; redefine backup file.
(defun backup-file-name-p (file)
  "Return non-nil if FILE is a backup file name (numeric or not).
This is a separate function so you can redefine it for customization.
You may need to redefine `file-name-sans-versions' as well."
  (string-match (my-regexp-concat '("~$" "\\.bak$")) file))
