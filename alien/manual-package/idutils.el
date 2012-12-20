;;; idutils.el --- emacs interface to `lid -R grep', a.k.a. `gid'
;;; Copyright (C) 1995-1996, 2006-2011 Free Software Foundation, Inc.
;;; Greg McGary <gkm@gnu.ai.mit.edu>.

;; This file is part of GNU idutils.

;; GNU idutils is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; GNU idutils is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; This package provides the tools meant to help editing PO files,
;;; as documented in the GNU idutils user's manual.  See this manual
;;; for user documentation, which is not repeated here.

;;; To install, merely put this file somewhere GNU Emacs will find it,
;;; then add the following lines to your .emacs file:
;;;
;;;   (autoload 'gid "idutils" "run idutils' gid command" t)
;;;
;;; You may also adjust some customizations variables, below, by defining
;;; them in your .emacs file.

(require 'compile)
(require 'thingatpt)

(defgroup gid nil
  "Run gid, with user-specified ARGS, and collect output in a buffer."
  :group 'tools
  :group 'processes
  :group 'grep
  :version "23.3")

(defcustom gid-ID-file nil
  "*If non-nil, the name of an ID file to pass to `gid' command."
  :type '(choice (const :tag "Default" nil)
		 (file :tag "Specify file" :value "./ID"))
  :group 'gid)
(put 'gid-ID-file 'safe-local-variable 'stringp-or-null-p)

(defvar gid-command "gid" "The command run by the gid function.")

(defvar gid-mode-font-lock-keywords
  '(("^\\(Compilation\\|Gid\\) \\(started\\|finished\\).*"
     (0 '(face nil message nil help-echo nil mouse-face nil) t))))

(defvar gid-use-search-in-buffer-name t
  "If non-nil, use the search string in the gid buffer's name.")

(defvar gid-history nil)

(define-compilation-mode gid-mode "Gid"
  "Specialization of compilation-mode for use with gid."
  nil)

;;;###autoload
(defun gid (args)
  "Run gid, with user-specified ARGS, and collect output in a buffer.
While gid runs asynchronously, you can use the \\[next-error] command to
find the text that gid hits refer to.  The command actually run is
defined by the gid-command variable."
  (interactive
   (list
    (let ((defalt (thing-at-point 'symbol)))
      (read-shell-command (concat "Run " gid-command " (with args): ")
			  (if gid-ID-file
			      (concat "-f " gid-ID-file " " defalt)
			    defalt)
			  (if (equal (car gid-history) defalt)
			      '(gid-history . 1)
			    'gid-history)))))
  (or (called-interactively-p 'any)
      (null gid-ID-file)
      (setq args (concat "-f " gid-ID-file " " args)))
  (let (compile-command
	(compilation-error-regexp-alist grep-regexp-alist)
	(compilation-directory default-directory)
	(gid-full-buffer-name (concat "*gid-" args "*")))
    (save-some-buffers (not compilation-ask-about-save) nil)
    (compilation-start (concat gid-command " " args) 'gid-mode
		       (when gid-use-search-in-buffer-name
			 (function (lambda (ignore)
				     gid-full-buffer-name)))
		       (regexp-quote args))))

(provide 'idutils)

;;; idutils.el ends here
