;;writing configuration while emacs.version==30.1 (file: .emacs);;

;;load emacs lisp packages, and activate them
(package-initialize)

;;add melpa to the package repository list
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

;;set custom emacs lisp file for system overwriting
(setq custom-file "~/.config/emacs-custom.el")

;;load local el script path, so that emacs can load those scripts
(add-to-list 'load-path "~/.emacs.d/local/")

;;disable initial screen of emacs
(setq inhibit-startup-screen t)

;;set default font type to Iosevka and size to 16
(set-frame-font "Iosevka 16" nil t)
;(set-face-attribute 'default nil :height 160)

;;disable top menu bar
(menu-bar-mode 0)

;;disable top menu bar
(tool-bar-mode 0)

;;enable line number (relative line number)
(global-display-line-numbers-mode 1)

;;enable path suggestions for file search
(ido-mode 1)

;;enable ido for every buffer
(ido-everywhere 1)

;;enable bracket pairs for (), {}, []
(electric-pair-mode 1)

;;enable navigation between different windows
(windmove-default-keybindings)

;;set character encoding to UTF-8, so that colored and UTF-8 characters can be printable
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(setq locale-coding-system 'utf-8)

;;load whitespace package for whitespace UTF-8 character rendering
(require 'whitespace)
(setq whitespace-style
      '(face tabs tab-mark))

;;define characters for spaces and tabs
(setq whitespace-display-mappings
      '((space-mark 32 [183] [46])
        (tab-mark 9 [187 9] [62 9])))

;;enable whitespace rendeing globlally
(global-whitespace-mode 1)

;;insert spaces instead of tab
(setq-default indent-tabs-mode nil)

;;define tab width to 4
(setq-default tab-width 4)

;;load mouse package and enable cursor movement via mouse and mouse wheel scroll
;;(require 'mouse)
;;(xterm-mouse-mode 1)
(mouse-wheel-mode 1)

;;load simpc-mode (alternate of default c mode that is too slow)
(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

;;load theme (au-whispergrove-night)
(use-package au-themes
  :vc (:url "https://github.com/szymonwilczek/au-themes" :rev :newest)
  :config
  (load-theme 'au-whispergrove-night t))

;;set all windows location at the bottom of the current frame
(add-to-list 'display-buffer-alist
             '(".*"
               (display-buffer-in-side-window)
               (side . bottom)
               (window-height . (lambda (window)
                                  fit-window-to-buffer window nil 10))))

;;load smex to run shell commands
(use-package smex :defer t)

;;map Alt-x key bindings with smex function
(global-set-key (kbd "M-x") 'smex)

;;map Ctrl-c Ctrl-c Alt-x key bindings with old execute command function
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

;;define duplicate line function to efficiently copy current line and paste right after that line
(defun duplicate-line()
  (interactive)
  (let ((column (- (point) (point-at-bol)))
        (line (let ((s (thing-at-point 'line t)))
              (if s (string-remove-suffix "\n" s) ""))))
  (move-end-of-line 1)
  (newline)
  (insert line)
  (move-beginning-of-line 1)
  (forward-char column)))

;;map Ctrl-d key bindings with dublicate line function
(global-set-key (kbd "C-d") 'duplicate-line)

;;map Ctrl-h Shift-m key binding with woman to show man pages
(global-set-key (kbd "C-h M") #'woman)

;;write backups to ~/.emacs.d/backup/
(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
      backup-by-copying      t
      version-control        t
      delete-old-versions    t
      kept-new-versions      20
      kept-old-versions      5)

;;load custom file defined to overwrite any properties
(load-file custom-file)
