;; delete whitespace when saving a file
(defun my-before-save-hook-function ()
  (delete-trailing-whitespace)
  )
(add-hook 'before-save-hook 'my-before-save-hook-function)
