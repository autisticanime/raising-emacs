;; Emacs configuration file.

;; Starts emacs server.
(server-start)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(defun system-is-linux ()
    "Linux system checking."
    (interactive)
    (string-equal system-type "gnu/linux"))

(defun system-is-mac ()
    "Mac OS X system checking."
    (interactive)
    (string-equal system-type "darwin"))

(defun system-is-windows ()
    "MS Windows system checking."
    (interactive)
    (string-equal system-type "windows-nt"))

;; Auto loading other initialization files.
;; It loads all *.el files in `~/.emacs.d/` directory.
(defconst user-init-dir (concat
    (cond ((boundp 'user-emacs-directory)
           user-emacs-directory)
	  ((boundp 'user-init-directory)
	   user-init-directory)
	  (t "~/.emacs.d/"))
    "mods/"))

(defun load-user-file (file)
    "Loading user file from init directory of him."
    (interactive)
    (setq file (expand-file-name file user-init-dir))
    (if (file-exists-p file)
	(load-file file)
	(print "Can't load file %s because it doesn't exist." file)))

(defun load-init-files ()
    "Auto loading other initialization files."
    (interactive)
    (dolist (file (file-expand-wildcards (expand-file-name "*.el" user-init-dir)))
	(load-user-file file)))

(load-init-files)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (tabbar-ruler tabbar yandex-weather soundcloud slime-annot auto-complete projectile slime tabbar-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
