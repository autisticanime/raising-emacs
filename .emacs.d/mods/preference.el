;; This file is created for preference modifications.
;;

;; Disabling tool-bar, scroll-bar and menu-bar.
(tool-bar-mode -1)
(scroll-bar-mode -1)
(menu-bar-mode -1)

;; Show tabs.
;; Requires tabbar.
(tabbar-mode t)
;; Display all tabs in one group.
;;
(defun my-tabbar-buffer-groups ()
    (list "tabs"))
(setq tabbar-buffer-groups-function 'my-tabbar-buffer-groups)
;; Sort all tabs by name.
(defun tabbar-add-tab (tabset object &optional append_ignored)
    "Add to TABSET a tab with value OBJECT if there isn't one there yet.
 If the tab is added, it is added at the beginning of the tab list,
 unless the optional argument APPEND is non-nil, in which case it is
 added at the end."
    (let ((tabs (tabbar-tabs tabset)))
	(if (tabbar-get-tab object tabset)
	    tabs
	    (let ((tab (tabbar-make-tab object tabset)))
		(tabbar-set-template tabset nil)
		(set tabset (sort (cons tab tabs)
				  (lambda (a b) (string< (buffer-name (car a)) (buffer-name (car b))))))))))

;;(setq tabbar-use-images nil)

(setq u-tabbar-background-color "gray20")
(setq u-tabbar-background-selected-color "white")

(defun apply-tabbar-with-theme (background-color selected-text-color unselected-text-color)
    (set-face-attribute 'tabbar-default nil
			:background background-color
			:foreground selected-text-color
			:underline nil
			:box `(:line-width 2 :color ,background-color :style nil)
			:height 1.1)
    (set-face-attribute 'tabbar-unselected nil
			:background background-color
			:foreground unselected-text-color
			:box `(:line-width 2 :color ,background-color :style nil))
    (set-face-attribute 'tabbar-selected nil
			:background background-color
			:foreground selected-text-color
			:underline t
			:box `(:line-width 2 :color ,background-color :style nil))
    (set-face-attribute 'tabbar-highlight nil
			:background unselected-text-color
			:foreground selected-text-color
			:underline nil
			:box `(:line-width 1 :color ,background-color :style nil))
    (set-face-attribute 'tabbar-modified nil
			:background background-color
			:foreground selected-text-color
			:underline nil
			:box `(:line-width 2 :color ,background-color :style nil))
    (set-face-attribute 'tabbar-button nil
			:box `(:line-width 1 :color ,background-color :style nil))
    (set-face-attribute 'tabbar-separator nil
			:background selected-text-color
			:height 0.6))
;; Apply tabbar theme considering that womabt is applied.
(apply-tabbar-with-theme "gray20" "white" "gray75")

;; Change padding of the tabs
;; we also need to set separator to avoid overlapping tabs by highlighted tabs
(custom-set-variables
 '(tabbar-separator (quote (0.5))))
;; adding spaces
(defun tabbar-buffer-tab-label (tab)
  "Return a label for TAB.
That is, a string used to represent it on the tab bar."
  (let ((label  (if tabbar--buffer-show-groups
                    (format "  [%s]  " (tabbar-tab-tabset tab))
                  (format "  %s  " (tabbar-tab-value tab)))))
    ;; Unless the tab bar auto scrolls to keep the selected tab
    ;; visible, shorten the tab label to keep as many tabs as possible
    ;; in the visible area of the tab bar.
    (if tabbar-auto-scroll-flag
        label
      (tabbar-shorten
       label (max 1 (/ (window-width)
                       (length (tabbar-view
                                (tabbar-current-tabset)))))))))

;; Mode line setups.
;; !disabled by powerline-mode!
;; (setq mode-line-format
;;       '(" -/" mode-line-modified
;; 	;;mode-line-frame-identification
;; 	;;mode-line-buffer-identification "%4"
;; 	"  " mode-line-position
;; 	;; Some specific information about the current buffer:
;; 	;;lunaryorn-projectile-mode-line ; Project information
;; 	;;(vc-mode lunaryorn-vc-mode-line) ; VC information
;; 	;;(flycheck-mode flycheck-mode-line) ; Flycheck status
;; 	;;(multiple-cursors-mode mc/mode-line) ; Number of cursors
;; 	;; Misc information, notably battery state and function name
;; 	" "
;; 	mode-line-misc-info
;; 	;; And the modes, which I don't really care for anyway
;; 	mode-line-modes mode-line-end-spaces))

;; Show line and column numbers.
(global-linum-mode t)
(column-number-mode t)

;; Cursor line highlited.
;;(global-hl-line-mode 1)

;; Change default color theme.
;; (load-theme 'adwaita)
(load-theme 'wombat)
;; Powerline theme.
(powerline-center-theme)

;; Set font setups.
(set-default-font "Monaco 9")

;; Change window title.
(setq frame-title-format "%b %4 ~%f~")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (auto-complete projectile slime))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
