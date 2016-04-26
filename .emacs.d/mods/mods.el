;; This file is created for initializing of mods.
;;

;; Paths (for Common Lisp compiler - SBCL)
(setq unix-sbcl-bin "sbcl")
;(setq windows-sbcl-bin "\"C:/Program Files/Steel Bank Common Lisp/1.2.15/sbcl.exe\"")
(setq windows-sbcl-bin "sbcl.exe")
(setq inferior-lisp-program (if (system-is-windows)
				windows-sbcl-bin
				unix-sbcl-bin))

;; Package manager:
;; Initialise package and add Melpa repository
(require 'package)
;; Add Melpha resources.
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
;; Package manager initialization.
(package-initialize)

;; Package list
(defvar required-packages
  '(slime ;; Slime -  Common Lisp IDE, integrated with Emacs
    projectile ;; Convinient project manager
    auto-complete ;; Autocomplete
    tabbar
    tabbar-ruler ;; Tabs as in a browser
    powerline ;; powerline like in vim
    ))

;; Require Common Lisp extensions
(require 'cl)

;; The function implements checking of slime, projectile, auto-complete is
;; installed.
(defun packages-installed-p ()
    "Packages availability checking."
    (interactive)
    (loop for package in required-packages
          unless (package-installed-p package)
            do (return nil)
          finally (return t)))

;; Auto-installing slime, projectile, auto-complete packages with Emacs first
;; running.
(unless (packages-installed-p)
    (message "%s" "Emacs is now refreshing it's package database...")
    (package-refresh-contents)
    (message "%s" " done.")
    (dolist (package required-packages)
        (unless (package-installed-p package)
            (package-install package))))

;; Configure our packages.
(when (packages-installed-p)

    ;; Auto-complete
    (require 'auto-complete)
    (require 'auto-complete-config)
    (ac-config-default)
    (setq ac-auto-start        t)
    (setq ac-auto-show-manu    t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes 'lisp-mode)

    ;; SLIME
    (require 'slime)
    (require 'slime-autoloads)
    ;;
    (slime-setup '(slime-fancy))
    ;; start
    (add-hook 'lisp-mode-hook (lambda () (slime-mode t)))
    (add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
    ;(make-comint-in-buffer "sbcl" nil "sbcl" nil)
    ;; end
    (setq slime-net-coding-system 'utf-8-unix)
    (slime-setup '(slime-fancy slime-asdf slime-indentation))
    (if (or (file-exists-p unix-sbcl-bin) (file-exists-p windows-sbcl-bin))
        (if (system-is-windows)
            (setq inferior-lisp-program windows-sbcl-bin)
            (setq inferior-lisp-program unix-sbcl-bin))
        (message "%s" "SBCL not found..."))
    (add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))

    ;; Projectile
    (require 'projectile)
    (projectile-global-mode)

    ;; Tabber
    (require 'tabbar))


;; Hunspell - software created for checkspelling.
;; It's just checking - no installig if it doesn't exist.
(setq ispell-program-name (executable-find "hunspell"))
(setenv "LANG" "ru_RU_yo")
(setq ispell-local-dictionary "ru_RU_yo")
