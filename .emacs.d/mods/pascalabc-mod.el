;; PascalABC.NET module. Created to compile program in Emacs.
;;

(defvar pascal-debug-buffer-name "*PASCAL-DEBUG*")
(defvar pascal-error-buffer-name "*PASCAL-ERRORS*")

(defun compile-pas (source-file)
  "Compiles pascal program source file."
  (interactive "sTarget file name (current file by default): ")
  (if (equal source-file "")
      (setq source-file (buffer-file-name)))
  (let* ((cc "\"C:\\Program Files (x86)\\PascalABC.NET\\pabcnetcclear.exe\"")
         (coding-system-for-read 'cp1251)
	 (coding-system-for-write 'cp1251)
	 (shell-req (concat cc " \"" source-file "\"")))
    (message "Compilling %s..." source-file)
    (shell-command shell-req pascal-debug-buffer-name pascal-error-buffer-name)))

(global-set-key (kbd "C-x M-c") 'compile-pas)


(defun run-compiled-pascal-program-for-current-file ()
  (interactive)
  (let* ((coding-system-for-read 'cp1251)
	 (coding-system-for-write 'cp1251)
	 (fname (buffer-file-name))
	 (fname-len (length fname))
	 (exe-fname (concat "\"" (substring fname 0 (- fname-len 4)) ".exe"
			    "\"")))
    (message "Running %s..." exe-fname)
    (shell-command exe-fname pascal-debug-buffer-name pascal-error-buffer-name)))

(global-set-key (kbd "C-x M-r") 'run-compiled-pascal-program-for-current-file)
