(require 'filecache)
(require 'ido)

(setq-default ido-enable-flex-matching t)
(setq-default ido-everywhere t)
(ido-mode t)

(defun my-ido-find-file-in-tag-files ()
  (interactive)
  (save-excursion
	(let ((enable-recursive-minibuffers t))
	  (visit-tags-table-buffer))
	(find-file
	 (expand-file-name
	  (ido-completing-read
	   "Project file: " (tags-table-files) nil t)))))

;; from  http://www.emacswiki.org/emacs/idomenu.el
(require 'imenu)
(defun idomenu--guess-default (index-alist symbol)
  "Guess a default choice from the given symbol."
  (catch 'found
    (let ((regex (concat "\\_<" (regexp-quote symbol) "\\_>")))
      (dolist (item index-alist)
        (if (string-match regex (car item)) (throw 'found (car item)))))))

(defun idomenu--read (index-alist &optional prompt guess)
  "Read a choice from an Imenu alist via Ido."
  (let* ((symatpt (thing-at-point 'symbol))
         (default (and guess symatpt (idomenu--guess-default index-alist symatpt)))
         (names (mapcar 'car index-alist))
         (name (ido-completing-read (or prompt "imenu ") names
                                    nil t nil nil default))
         (choice (assoc name index-alist)))
    (if (imenu--subalist-p choice)
        (idomenu--read (cdr choice) prompt nil)
      choice)))

(defun idomenu ()
  "Switch to a buffer-local tag from Imenu via Ido."
  (interactive)
  ;; ido initialization
  (ido-init-completion-maps)
  (add-hook 'minibuffer-setup-hook 'ido-minibuffer-setup)
  (add-hook 'choose-completion-string-functions 'ido-choose-completion-string)
  (add-hook 'kill-emacs-hook 'ido-kill-emacs-hook)
  ;; set up ido completion list
  (let ((index-alist (cdr (imenu--make-index-alist))))
    (if (equal index-alist '(nil))
        (message "No imenu tags in buffer")
      (imenu (idomenu--read index-alist nil t)))))

(global-set-key (kbd "C-c , m") 'idomenu)

(progn
  (require 'smex)
  (smex-initialize)
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  ;; This is your old M-x.
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))
  
(provide 'my-ido)
