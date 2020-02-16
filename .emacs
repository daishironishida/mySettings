
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

;; load theme (only in GUI)
(if (display-graphic-p) (load-theme 'deeper-blue))

;;; *.~ とかのバックアップファイルを作らない
(setq make-backup-files nil)
;;; .#* とかのバックアップファイルを作らない
(setq auto-save-default nil)

;;; ¥の代わりにバックスラッシュを入力する
(define-key global-map [?¥] [?\\])

;; Alt-n to move 3 lines down
(global-set-key (kbd "M-n")
  (lambda ()
    (interactive)
    (setq this-command 'next-line)
    (next-line 3)))

;; Alt-p to move 3 lines up
(global-set-key (kbd "M-p")
  (lambda ()
    (interactive)
    (setq this-command 'previous-line)
    (previous-line 3)))

;; delete selected text when typing
 (delete-selection-mode 1)

;; show buffer menu in current window
(global-set-key "\C-x\C-b" 'buffer-menu)

;; execute shell command
(global-set-key "\C-o" 'shell-command)

;; don't add newline at the end of file
(setq mode-require-final-newline nil)

;; memo
(defun memo ()
  (interactive)
  (let ((daily-name (format-time-string "%y%m%d-%T")))
    (find-file (format "~/memo/tmp/%s.org" daily-name))))
(global-set-key "\C-cc" 'memo)

;; 日本語表記のチラツキをなくす
(setq redisplay-dont-pause nil)

;; C-jをunbind (ひらがな表記に使いたい)
(global-unset-key (kbd "C-j"))
(require 'org)
(define-key org-mode-map (kbd "C-j") nil)

;; C-h for backspace
(keyboard-translate ?\C-h ?\C-?)

;; make cursor a line
(setq-default cursor-type 'bar)

;; ツールバーをなくす
(tool-bar-mode -1)

;; set window size and position
(if (window-system)
    (set-frame-position (selected-frame) 00 0))
(if (window-system)
    (set-frame-size (selected-frame) 201 54))

;; delete word doesn't add to kill-ring
(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))
(defun backward-delete-word (arg)
  "Delete characters backward until encountering the end of a word.
With argument, do this that many times."
  (interactive "p")
  (delete-word (- arg)))
(global-set-key [(meta backspace)] 'backward-delete-word)
(global-set-key [(meta d)] 'delete-word)

;; ranger
(global-set-key "\C-x\C-d" 'ranger)
;; カーソルが線のままになる変更
(load-file "~/.emacs.d/elpa/ranger-20190412.624/ranger.el")

;; undo tree
(global-undo-tree-mode)

;; set font size
(set-face-attribute 'default nil :height 120)

;; org-modeをきれいに (only in GUI)
(add-to-list 'load-path "~/.emacs.d/org-beautify/")
(if (display-graphic-p) (require 'org-bullets))
(if (display-graphic-p) (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(if (display-graphic-p) (add-hook 'org-mode-hook 'org-indent-mode))
(if (display-graphic-p) (require 'org-beautify-theme))

;; 見出しを全部表示
(setq org-startup-folded 'showall)

;; option and command keys for mac port
(setq mac-option-modifier 'meta)
(setq mac-command-modifier 'super)
(global-set-key (kbd "s-x") 'kill-region)
(global-set-key (kbd "s-c") 'kill-ring-save)
(global-set-key (kbd "s-v") 'yank)
(global-set-key (kbd "s-a") 'mark-whole-buffer)

;; MELPA
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  (when no-ssl
    (warn "\
Your version of Emacs does not support SSL connections,
which is unsafe because it allows man-in-the-middle attacks.
There are two things you can do about this warning:
1. Install an Emacs version that does support SSL and be safe.
2. Remove this warning from your init file so you won't see it again."))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (undo-tree smooth-scrolling ranger))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
