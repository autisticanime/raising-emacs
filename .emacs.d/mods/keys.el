;; This file is created for bindings related with key bindings, navigations mods
;; and all over stuff.
;;

;; Add new binding for scroling boffer by line.
(global-set-key [?\M-n] 'scroll-up-line)
(global-set-key [?\M-т] 'scroll-up-line)
(global-set-key [?\M-p] 'scroll-down-line)
(global-set-key [?\M-з] 'scroll-down-line)
;; Add new binding for fast switching betwin buffers.
(global-set-key [?\C-,] 'previous-buffer)
(global-set-key [?\C-б] 'previous-buffer)
(global-set-key [?\C-.] 'next-buffer)
(global-set-key [?\C-ю] 'next-buffer)
;; ...and to kill current buffer.
(global-set-key [?\M-\]] 'kill-this-buffer)
(global-set-key [?\M-ъ] 'kill-this-buffer)
;; ...and to switch betwing paragraphs on rus keyboard.
(global-set-key [?\M-Х] 'backward-paragraph)
(global-set-key [?\M-Ъ] 'forward-paragraph)
;; ...and to go to the start or the end of the buffer for Russian keyboard layout.
(global-set-key [?\M-Б] 'beginning-of-buffer)
(global-set-key [?\M-Ю] 'end-of-buffer)
;; ...and to fast create new buffer.
(defun open-new-buffer ()
    (interactive)
    (switch-to-buffer (generate-new-buffer-name "new-buffer")))
(global-set-key (kbd "C-c n") 'open-new-buffer)
(global-set-key (kbd "C-с т") 'open-new-buffer)
;; .. and to fast switching between themes.
(defvar *active-theme-name* "wombat")
(defun switch-theme ()
    (interactive)
    (message (format "Active theme is %s." *active-theme-name*))
    (load-theme (if (equal *active-theme-name* "adwaita")
		    (prog1 'wombat
			(message "Wombat theme has been applied.")
			(setq *active-theme-name* "wombat")
		        ;; Set tabbar setups.
			(apply-tabbar-with-theme "gray20" "white" "gray75"))
		    (prog1 'adwaita
			(message "Adwaita theme has been applied.")
			(setq *active-theme-name* "adwaita")
			;; Set tabbar setups.
			(apply-tabbar-with-theme "gray75" "black" "gray30")))))
(global-set-key (kbd "C-c t") 'switch-theme)
;;(global-set-key (kbd "C-с е") 'switch-theme) ;; rus characters

;; Swithcing between tabber's tabs.
(global-set-key [M-left] 'tabbar-backward-tab)
(global-set-key [M-right] 'tabbar-forward-tab)
