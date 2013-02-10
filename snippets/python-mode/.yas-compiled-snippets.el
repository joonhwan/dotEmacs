;;; Compiled snippets and support files for `python-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'python-mode
					 '(("wiz" "import logging\nimport optparse\n\n$0\n\ndef main():\n  LOGGING_LEVELS = {$>\n  'critical': logging.CRITICAL,$>\n  'error': logging.ERROR,$>\n  'warning': logging.WARNING,$>\n  'info': logging.INFO,$>\n  'debug': logging.DEBUG$>\n  }$>\n    parser = optparse.OptionParser()$>\n    parser.add_option('-l', '--logging-level', help='Logging level')$>\n    parser.add_option('-f', '--logging-file', help='Logging file name')$>\n    (options, args) = parser.parse_args()$>\n    logging_level = LOGGING_LEVELS.get(options.logging_level, logging.NOTSET)$>\n    logging.basicConfig(level=logging_level, filename=options.logging_file,$>\n                        format='%(asctime)s %(levelname)s: %(message)s',$>\n                        datefmt='%Y-%m-%d %H:%M:%S')$>\n\nif __name__ == '__main__':\n    main()$>\n" "pythong logging template" nil nil
						((yas/indent-line 'fixed))
						nil nil nil)))


;;; Do not edit! File generated at Sun Feb 10 23:05:40 2013
