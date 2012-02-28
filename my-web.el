(add-to-list 'load-path "~/elisp/web")
(add-to-list 'load-path "~/elisp/g-client")

;;
;; tumblr
;;
;; (require 'tumble)
;; (setq tumble-email "joonhwan.lee@gmail.com")
;; (setq tumble-password "winkler7")
;; (setq tumble-url "tumblr.joonhwan.org")

;;
;; twitter
;;
;; (require 'twitter)
;; (setq twitter-username "joonhwan.lee@gmail.com"
;; 	  twitter-password nil)

;; (require 'trac-wiki)
;; (setq trac-projects
;;       '(
;; 	("sw-trac"
;; 	 :endpoint "http://192.168.0.201/projects/pis/login/xmlrpc" 
;; 	 :login "jhlee"
;; 	 :name "Joonhwan") 
;; 	))
;; (global-set-key "\C-c,,t" 'trac-wiki)

(require 'pastie)

;; (require 'weblogger)

;; (require 'atom-blogger)
;; (setq atom-blogger-author "joonhwan.lee"
;; 	  atom-blogger-default-auth "joonhwan.lee:winkler7")

;; (load-library "g")
;; (load-library "gblogger")

;; (setq g-curl-program "c:/dev/utils/curl.exe"
;; 	  g-user-email "joonhwan.lee@gmail.com"
;; 	  g-curl-debug t
;; 	  g-xslt-debug t
;; 	  gblogger-user-email "joonhwan.lee@gmail.com"
;; 	  gblogger-user-password "winkler7"
;; 	  gblogger-author "joonhwan")


;; (require 'yammer)
;; (setq oauth-use-curl nil)
;; (setq yammer-user-authorize "https://www.yammer.com/oauth/access_token")
;; (setq yammer-consumer-key "0GMdp4sZHI4X0KqSukMrw")
;; (setq yammer-consumer-secret "l2B854Zf8PWuCEjDotMEJouay5JZ7ces8AgmEZ3GLE")
;; (yammer-authenticate)

(provide 'my-web)
