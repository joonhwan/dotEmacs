;; Good Day to write something!!!
(require 'pop3)

(add-to-list 'gnus-secondary-select-methods '(nnml ""))

(setq gnus-permanently-visible-groups "mail")

(setq gnus-posting-styles
	  '((".*" (name "Joonhwan Lee"))))

(setq mail-sources					
      '((file :path "/temp/gmail")
        (pop :server "pop.gmail.com"
			 :port 995
			 :user "joonhwan.lee"
			 :connection ssl
			 :leave t)))

;; Configure outbound mail (SMTP)
(setq smtpmail-starttls-credentials '(("smtp.gmail.com" 465 nil nil))
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-default-smtp-server "smtp.gmail.com"
      send-mail-function 'smtpmail-send-it
      message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-service 465
      smtpmail-auth-credentials '(("smtp.gmail.com"
								   465
								   "joonhwan.lee@gmail.com"
								   nil)))

(provide 'my-mail)