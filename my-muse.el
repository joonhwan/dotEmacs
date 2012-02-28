(require 'muse-mode)
(require 'muse-publish)
(require 'muse-html)  ;; and so on
(require 'muse-project)

(add-to-list 'auto-mode-alist '("\\.muse$" . muse-mode))
(modify-coding-system-alist 'file "\\.muse$" 'utf-8)

(setq my-personal-wiki-dir (concat my-dropbox-dir "/wiki"))

(setq muse-project-alist
	  `(("PersonalWiki" (,my-personal-wiki-dir :default "index")
		 (:base "html" :path ,(concat my-personal-wiki-dir "/pub/html")))))

(provide 'my-muse)
