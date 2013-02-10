;;; Compiled snippets and support files for `c++-mode'
;;; Snippet definitions:
;;;
(yas-define-snippets 'c++-mode
					 '(("getset" "${1:int} ${2:data}(void) const {\nreturn m_$2;\n}\nvoid set${2:$(concat (upcase (substring (yas/substr text \".*\") 0 1)) (substring (yas/substr text \".*\") 1))}($1& value) {\nm_$2 = value;\n}\n" "ref data() const; / setData(ref);" nil nil nil nil nil nil)
					   ("getset" "${1:int} Get${2:data}(void) const {\nreturn m_$2;\n}\nvoid Set${2:$(concat (upcase (substring (yas/substr text \".*\") 0 1)) (substring (yas/substr text \".*\") 1))}($1& value) {\nm_$2 = value;\n}\n" "ref GetData() const; / SetData(ref);" nil nil nil nil nil nil)
					   ("qappmain" "#include <QApplication>\n\n#if defined(_DEBUG) && defined(WIN32)\n#define _CRTDBG_MAP_ALLOC\n#include <stdlib.h>\n#include <crtdbg.h>\nclass MemLeakDetector\n{\npublic:\n	MemLeakDetector()\n	{\n		_CrtSetDbgFlag ( _CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF );\n	}\n	~MemLeakDetector()\n	{\n	}\n} detector;\n#endif\n\nint main(int argc, char** argv)\n\\{\n	QApplication app(argc, argv);\n	QCoreApplication::setOrganizationName(\"joonhwan\");\n	QCoreApplication::setOrganizationDomain(\"www.joonhwan.org\");\n	QCoreApplication::setApplicationName(\"${1:appName}\");\n	$0\n	return app.exec();\n\\}\n" "Qt app main function ..." nil nil nil nil nil nil)
					   ("qtclass" "#pragma once\n\n#include <${2:$(yas/substr text \".*\")}>\n\nclass ${1:`(file-name-nondirectory (file-name-sans-extension (buffer-file-name)))`} : public ${2:QObject}\n{\n    Q_OBJECT\npublic:\n    ${1:$(yas/substr text \"[^: ]*\")}(QObject* parent=0);\n    virtual ~${1:$(yas/substr text \"[^: ]*\")}();\n	$0\nsignals:\npublic slots:\nprotected:\n};" "qt class decl ... { ... }" nil nil nil nil nil nil)
					   ("switchsm" "switch(${1:e->sig})\n{\ncase QF_ENTRY_SIG:\n    return QF_HANDLED();\ncase QF_INIT_SIG:\n    return QF_HANDLED();\ncase QF_EXIT_SIG:\n    return QF_HANDLED();$0\n}\n" "switch case statement for hsm ... { ... }" nil nil nil nil nil nil)
					   ("switchsm" "switch(${1:e->sig})\n{\ncase Q_ENTRY_SIG:\n    return Q_HANDLED();\ncase Q_INIT_SIG:\n    return Q_HANDLED();\ncase Q_EXIT_SIG:\n    return Q_HANDLED();$0\n}\n" "switch case statement for hsm ... { ... } old version" nil nil nil nil nil nil)))


;;; Do not edit! File generated at Sun Feb 10 23:04:47 2013
