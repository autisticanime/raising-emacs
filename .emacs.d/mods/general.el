;; This file is created for general modifications including setting some modes,
;; setting tab indents and all over.

;; Indents if lisp code.
(setq-default lisp-body-indent 4)
(setq lisp-indent-function 'common-lisp-indent-function)

;; Indents in C code.
(add-hook 'c-mode-common-hook
		  (lambda () (setq c-default-style "java"
						   c-basic-offset 4
						   tab-width 4
						   indent-tabs-mode t)))

;; You only have to press y or n whenever you're asked to.
(defalias 'yes-or-no-p 'y-or-n-p)

;; Auto highlight parenthesis.
;; Uncomment follownng line to highlight all expression in parenthesis.
; (setq show-paren-style 'expression)
(show-paren-mode 1)

;; Replace selected text with that I typed.
(delete-selection-mode 1)

;; Encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)

;; Autostart visual-line-mode on text-mode.
(add-hook 'text-mode-hook 'visual-line-mode)

;; To save last session on new start.
(desktop-save-mode t)

;; Terminal settings.
(setq windows-shell-path "C:\\Cygwin64\\Cygwin.bat")
(setq unix-shell-path "/bin/bash")
(if (system-is-windows)
    (progn
		(setq explicit-shell-file-name windows-shell-path)
		(add-to-list 'exec-path "C:\\Cygwin64\\bin"))
    (setq explicit-shell-file-name unix-shell-path))
(setq shell-file-name explicit-shell-file-name)
;; Colors in terminal.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Running SBCL in emacs.
(defun run-sbcl ()
    (interactive)
    (make-comint-in-buffer "SBCL" nil "sbcl" nil)
    (switch-to-buffer "*SBCL*"))

;; Make Emacs not to ring.
;; (setq visible-bell t)
(setq ring-bell-function 'ignore)
