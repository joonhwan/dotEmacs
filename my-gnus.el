;; from
;; http://www.xsteve.at/prg/gnus/

;; XSteve's Gnus page
;; Gnus is a sophisticated and powerful crossplatform email and news reader.
;; It is implemented in Emacs Lisp. That way you have the full power of Emacs available in your email application.
;; My .gnus explained
;; I subscribed a bunch of mailing lists via news.gmane.org.
;; I use the gmane server as my primary news source.
(setq gnus-select-method '(nntp "news.gmane.org"))


;; Use a smtp server to send emails.
(setq smtpmail-smtp-server "joonhwan.lee@gmail.com")
(setq user-mail-address "joonhwan.lee@gmail.com")
(setq message-send-mail-real-function 'smtpmail-send-it)

;; Display the recipants in gnus summary buffers instead of my mail own mail address for my sent mails.
(setq gnus-ignored-from-addresses "Joonhwan Lee")


;; Set the prefix when using jump to select a newsgroup.
;; needs a newer gnus
;; (setq gnus-group-jump-to-group-prompt '((0 . "nnml:mail.") (1 .  "gmane.")
;;                                         (2 . "nnshimbun+")
;;                                         (3 .  "nnfolder+archive:")))
(setq gnus-group-jump-to-group-prompt "nnml:mail.")


;; Use nnml as mail backend. Use news.host.com as nntp server.
(setq gnus-secondary-select-methods nil)
      ;; '((nnml "")
      ;;   (nntp "news.host.com")))

;; Keep a backup of the received mails for 60 days and delete that mails after 60 days without a confirmation.
(setq mail-source-delete-incoming 60)
(setq mail-source-delete-old-incoming-confirm nil)

;; Expireable articles will be deleted after 35 days.
(setq nnmail-expiry-wait 35)

;; Display html emails via emacs-w3m
(setq mm-text-html-renderer 'w3m)

;; Do not use the html part of a message, use the text part if possible!
(setq mm-discouraged-alternatives '("text/html" "text/richtext"))

;; Specify the mail sources from which gnus should fetch new mail. The mail will be transfered to your computer and deleted on the mail host. Below you see an example definition for pop and one for imap. I have some fictional values for the needed entries.
(setq mail-sources
      '(;; (pop :server "pop.host.at" :user "xsteve@host.at" :password "pwhost")
        (imap :server "imap.gmail.com" :user "joonhwan.lee@gmail.com" ;; :password "??????"
			  )))

;; ;; Mail splitting is a very powerful and useful feature of gnus. You should add your own rules below. The rules are tried from the first to the last. If a rule matches, the Mail is spooled to the specified mail group. If no rule matches, the mail is delivered to the group "mail.other".
;; (setq nnmail-split-methods 'nnmail-split-fancy)
;; (setq nnmail-split-fancy
;;       '(|
;;         (: spam-split)
;;         (: gnus-registry-split-fancy-with-parent)
;;         ;; ("X-BeenThere" "xtla-el-dev@gna.org" "mail.myprg.xtla")
;;         ;; (from ".*@amazon.de" "mail.privat.amazon")
;;         "mail.other"))


;; Mails and News that you send are stored in the folders "sent-mail" or "sent-news"
(setq gnus-message-archive-group
      '((if (message-news-p)
            "sent-news"
          "sent-mail")))


;; The scoring system sorts articles and authors you read often to the beginning of the available mails.
;; Less interesting stuff is located at the end.
(setq gnus-use-adaptive-scoring t)
(setq gnus-score-expiry-days 14)
(setq gnus-default-adaptive-score-alist
  '((gnus-unread-mark)
    (gnus-ticked-mark (from 4))
    (gnus-dormant-mark (from 5))
    (gnus-saved-mark (from 20) (subject 5))
    (gnus-del-mark (from -2) (subject -5))
    (gnus-read-mark (from 2) (subject 1))
    (gnus-killed-mark (from 0) (subject -3))))
    ;(gnus-killed-mark (from -1) (subject -3))))
    ;(gnus-kill-file-mark (from -9999)))
    ;(gnus-expirable-mark (from -1) (subject -1))
    ;(gnus-ancient-mark (subject -1))
    ;(gnus-low-score-mark (subject -1))
    ;(gnus-catchup-mark (subject -1))))

(setq gnus-score-decay-constant 1) ;default = 3
(setq gnus-score-decay-scale 0.03) ;default = 0.05

(setq gnus-decay-scores t) ;(gnus-decay-score 1000)


Use a global score file to filter gmane spam articles. That is a really cool feature.

(setq gnus-global-score-files
       '("~/gnus/scores/all.SCORE"))

;; all.SCORE contains:
;;(("xref"
;;  ("gmane.spam.detected" -1000 nil s)))
(setq gnus-summary-expunge-below -999)


Summary line format strings

(setq gnus-summary-line-format "%O%U%R%z%d %B%(%[%4L: %-22,22f%]%) %s\n")
(setq gnus-summary-mode-line-format "Gnus: %p [%A / Sc:%4z] %Z")


Threading visual appearance

(setq gnus-summary-same-subject "")
(setq gnus-sum-thread-tree-root "")
(setq gnus-sum-thread-tree-single-indent "")
(setq gnus-sum-thread-tree-leaf-with-other "+-> ")
(setq gnus-sum-thread-tree-vertical "|")
(setq gnus-sum-thread-tree-single-leaf "`-> ")


Use the keybinding M-F7 to toggle between the gnus window configuration and your normal editing windows.

(defun xsteve-gnus ()
  (interactive)
  (let ((bufname (buffer-name)))
    (if (or
         (string-equal "*Group*" bufname)
         (string-equal "*BBDB*" bufname)
         (string-match "\*Summary" bufname)
         (string-match "\*Article" bufname))
        (progn
          (xsteve-bury-gnus))
      ;unbury
      (if (get-buffer "*Group*")
          (xsteve-unbury-gnus)
        (gnus-unplugged)))))

(defun xsteve-unbury-gnus ()
  (interactive)
  (when (and (boundp 'gnus-bury-window-configuration) gnus-bury-window-configuration)
    (set-window-configuration gnus-bury-window-configuration)))

(defun xsteve-bury-gnus ()
  (interactive)
  (setq gnus-bury-window-configuration nil)
  (let ((buf nil)
        (bufname nil))
    (dolist (buf (buffer-list))
      (setq bufname (buffer-name buf))
      (when (or
             (string-equal "*Group*" bufname)
             (string-equal "*BBDB*" bufname)
             (string-match "\*Summary" bufname)
             (string-match "\*Article" bufname))
        (unless gnus-bury-window-configuration
          (setq gnus-bury-window-configuration (current-window-configuration)))
        (delete-other-windows)
        (if (eq (current-buffer) buf)
            (bury-buffer)
          (bury-buffer buf))))))

(global-set-key [(meta f7)] 'xsteve-gnus)


Generate the mail headers before you edit your message.

(setq message-generate-headers-first t)


The message buffer will be killed after sending a message.

(setq message-kill-buffer-on-exit t)


When composing a mail, start the auto-fill-mode.

(add-hook 'message-mode-hook 'turn-on-auto-fill)


Increase the score for followups to a sent article.

(add-hook 'message-sent-hook 'gnus-score-followup-article)
(add-hook 'message-sent-hook 'gnus-score-followup-thread)


Toggle the Gcc Header.
The Gcc Header specifies a local mail box that receives a copy of the sent article.

(defun message-toggle-gcc ()
  "Insert or remove the \"Gcc\" header."
  (interactive)
  (save-excursion
    (save-restriction
      (message-narrow-to-headers)
      (if (message-fetch-field "Gcc")
          (message-remove-header "Gcc")
        (gnus-inews-insert-archive-gcc)))))
(define-key message-mode-map [(control ?c) (control ?f) (control ?g)] 'message-toggle-gcc)


The message-citation-line-function is responsible to display a message citation. The following Code allows to switch

(setq message-citation-line-function 'xsteve-message-citation) ; was message-insert-citation-line
(setq message-cite-function 'message-cite-original-without-signature)
;;
(defun xsteve-message-citation ()
  (interactive)
  (when message-reply-headers
    (xsteve-message-citation-delete)
    (message-goto-body)
    (let* ((parsed-address (mail-header-parse-address (mail-header-from message-reply-headers)))
           (my-bbdb-record (bbdb-search-simple (cdr parsed-address) (car parsed-address)))
           (start-pos (point))
           (overlay)
           (anrede (when my-bbdb-record (bbdb-record-getprop my-bbdb-record 'anrede)))
           (full-name
            (or (if my-bbdb-record
                    (bbdb-record-name my-bbdb-record)
                  (cdr parsed-address))
                "Fred Namenlos ")))
      (if anrede
          (insert (format "%s\n\n" anrede))
        (funcall xsteve-message-citation-function full-name))
      (unless (eq start-pos (point))
        (setq overlay (make-overlay start-pos (point)))
        (overlay-put overlay 'xsteve-message-citation nil)))))

(defun xsteve-message-citation-hallo (full-name)
  (insert "Hallo " (car (split-string full-name)) "!\n\n"))

(defun xsteve-message-citation-hi (full-name)
  (insert "Hi " (car (split-string full-name)) "!\n\n"))

(defun xsteve-message-citation-herr (full-name)
  (insert "Hallo Herr " (cadr (split-string (or full-name "Fred Namenlos "))) "!\n\n"))

(defun xsteve-message-citation-default (full-name)
  (message-insert-citation-line))

(xsteve-define-alternatives 'xsteve-message-citation-function '(xsteve-message-citation-hallo
                                                                xsteve-message-citation-herr
                                                                xsteve-message-citation-hi
                                                                xsteve-message-citation-default))

(defun xsteve-message-citation-delete ()
  (interactive)
  (let ((overlay)
        (start-pos))
    (goto-char (point-min))
    (goto-char (next-overlay-change (point)))
    (setq overlay (car-safe (overlays-at (point)))) ;; do not use car...
    (when overlay
      (overlay-get overlay 'xsteve-message-citation)
      (setq start-pos (point))
      (goto-char (next-overlay-change (point)))
      (delete-region start-pos (point)))))

(defun xsteve-message-citation-toggle ()
  (interactive)
  (save-excursion
    (toggle-xsteve-message-citation-function)
    (xsteve-message-citation)))

(define-key message-mode-map [f6] 'xsteve-message-citation-toggle)


Bind M-h to a function that shows the latest received mails.

(defun xsteve-show-nnmail-split-history ()
  (interactive)
  (let ((hi (sort (mapcar 'caar nnmail-split-history) 'string<))
        (elem)
        (count)
        (total))
    (while hi
      (if (string= elem (car hi))
          (setq count (+ count 1))
        (setq elem (car hi))
        (when total
          (setcar total (concat (car total) ": " (number-to-string count))))
        (setq count 1)
        (add-to-list 'total elem))
      (setq hi (cdr hi)))
    (if total
        (setcar total (concat (car total) ": " (number-to-string count)))
      (setq total '("No new Mail")))
    (message (format"%s%s" xsteve-check-mail-time (nreverse total)))))

(defun xsteve-get-new-news-set-time ()
  (setq xsteve-check-mail-time (format-time-string "[%H:%M] ")))

(unless (boundp 'xsteve-check-mail-time)
  (xsteve-get-new-news-set-time))

(add-hook 'gnus-get-new-news-hook 'xsteve-get-new-news-set-time)

(define-key gnus-group-mode-map [(meta h)] 'xsteve-show-nnmail-split-history)


Store gnus specific files to ~/gnus

(setq gnus-directory "~/gnus")
(setq message-directory "~/gnus/mail")
(setq nnml-directory "~/gnus/nnml-mail")
(setq gnus-article-save-directory "~/gnus/saved")
(setq gnus-kill-files-directory "~/gnus/scores")
(setq gnus-cache-directory "~/gnus/cache")


Integration to bbdb and dired

(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'dired-mode-hook 'turn-on-gnus-dired-mode)


Use the gnus registry

(require 'gnus-registry)
(gnus-registry-initialize)


Select the header that should be shown. Yes I am interested in the used mail or news client from other people ;-)

(setq gnus-visible-headers "^From:\\|^Newsgroups:\\|^Subject:\\|^Date:\\|^Followup-To:\\|^Reply-To:\\|^Summary:\\|^Keywords:\\|^To:\\|^[BGF]?Cc:\\|^Posted-To:\\|^Mail-Copies-To:\\|^Mail-Followup-To:\\|^Apparently-To:\\|^Gnus-Warning:\\|^Resent-From:\\|^X-Sent:\\|^User-Agent:\\|^X-Mailer:\\|^X-Newsreader:")


Specify the order of the header lines

(setq gnus-sorted-header-list '("^From:" "^Subject:" "^Summary:" "^Keywords:" "^Newsgroups:" "^Followup-To:" "^To:" "^Cc:" "^Date:" "^User-Agent:" "^X-Mailer:" "^X-Newsreader:"))


Use the topic mode

(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)


Added some keybindings to the gnus summary mode

(define-key gnus-summary-mode-map [(meta up)] '(lambda() (interactive) (scroll-other-window -1)))
(define-key gnus-summary-mode-map [(meta down)] '(lambda() (interactive) (scroll-other-window 1)))
(define-key gnus-summary-mode-map [(control down)] 'gnus-summary-next-thread)
(define-key gnus-summary-mode-map [(control up)] 'gnus-summary-prev-thread)


I use gnus-alias to make it possible to use different mail addresses for me. I have changed the mail addresses below to some invalid ones. I can use C-c C-p to select an identity from the given list. It is also possible via gnus-alias-identity-rules to select the correct mail address from a given context.

(require 'gnus-alias)
(setq gnus-alias-identity-alist
      '(("riic-xsteve" "" "Stefan Reichör " "" nil "" "")
        ;;("web.de" "" "Stefan Reichör " "" nil "" "Stefan.")
        ("sigriic" "" "Stefan Reichör " "" nil "" "~/data/.signature-riic")))

(setq gnus-alias-identity-rules '(("xtla.el"
                                   ("to" "xtla-el-devNOSPAM@gna.org" current)
                                   "xsteve")))

(setq gnus-alias-default-identity "xsteve")
(gnus-alias-init)
(define-key message-mode-map "\C-c\C-p" 'gnus-alias-select-identity)


My spam settings. I use the spam processing for the gmane groups.

(setq spam-directory "~/gnus/spam/")

(setq gnus-spam-process-newsgroups
      '(("^gmane\\."
         ((spam spam-use-gmane)))))

(require 'spam)


Make it easier to find ham messages in my spam folder nnml:spam.
The following setup highlights some words that I expect in ham messages.

(setq gnus-summary-nospam-highlight-list '("[PATCH]" "svn" "x-dict" "pwsafe"
                                           "emacs" "python"))
(defun gnus-summary-hl-nospam ()
  (interactive)
  (highlight-regexp (regexp-opt gnus-summary-nospam-highlight-list)))

(defun gnus-summary-hl-nospam-in-spam-group ()
  (when (string= gnus-newsgroup-name "nnml:spam")
    (message "Highlighting words for possible ham mails")
    (gnus-summary-hl-nospam)))
(add-hook 'gnus-summary-prepare-hook 'gnus-summary-hl-nospam-in-spam-group)


Setup the search via gnus-namazu. First create the index via the command line.

# generate the database: look at gnus-directory, mine is "~/gnus"
# ~/gnus/nnml-mail contains the mails
mkdir ~/gnus/namazu
mknmz -a -h -O ~/gnus/namazu ~/gnus/nnml-mail


Enable gnus-namazu. You can start a search vie C-c C-n.

(require 'gnus-namazu)
(gnus-namazu-insinuate)
(setq gnus-namazu-index-update-interval nil)
;; call explicitely M-x gnus-namazu-update-all-indices


Update the namazu index every day at 6:00am

(defun xsteve-gnus-namazu-update-all-indices ()
  (interactive)
  (gnus-namazu-update-all-indices t))

(defun xsteve-gnus-update-namazu-index ()
  (run-at-time "6:00am" nil 'xsteve-gnus-namazu-update-all-indices))

(require 'midnight)
(add-hook 'midnight-hook 'xsteve-gnus-update-namazu-index)


Display the signatures in a less readable font.

(require 'sigbegone)
