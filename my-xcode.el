;; -*- coding:utf-8-auto; -*-

(when (my-try-require 'xcode-document-viewer)
  (setq xcdoc:document-path "/Users/jhlee/Library/Developer/Shared/Documentation/DocSets/com.apple.adc.documentation.AppleiOS6.1.iOSLibrary.docset")
  (setq xcdoc:open-w3m-other-buffer t) ;if you like
  )
