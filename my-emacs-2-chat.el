;; -*- coding:utf-8; -*-
(require 'my-common)
(require 'my-theme)
(require 'my-editing)
(require 'my-ido)

;; starting erc
(require 'erc)
(erc-autojoin-mode 1)
(setq erc-autojoin-channels-alist '((".*\\.freenode.net" "#emacs" "#qt" "#ardour")))


(erc :server "irc.freenode.net" :port 6667 :nick "jhlee")
