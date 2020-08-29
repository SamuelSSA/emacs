
; Configuration for Emcas samuel.antunes@thalesgroup.com

; removing welcome message
(setq inhibit-startup-message t)
; removing icons menu
(tool-bar-mode -1)

;inserting line numer
(global-linum-mode t)

; Package managment system
(require 'package)
(setq package-enable-at-startup nil) ;desable default package management

; MELPA package repository
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
 
(package-initialize); start packages

; package installer wrapper
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
; package for test a package
(use-package try
  :ensure t )

; package for remember shortcut functions
(use-package which-key
  :ensure t
  :config (which-key-mode))

; auto complete package
(use-package auto-complete
  :ensure t
  :init
  (progn
    (ac-config-default)
    (global-auto-complete-mode t)))

; treeview 
(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow)))
  :bind (("C-\\" . 'neotree-toggle))) ; toggle neotree

; icons for folders
(use-package all-the-icons
  :ensure t)

; window selection package
(use-package ace-window
  :ensure t
  :bind (("C-x o" . ace-window)))

; changes the default commands for the standard behavior adopted in the normal editors
(use-package ergoemacs-mode
  :ensure t
  :config
  (progn
    (setq ergoemacs-theme nil)
    (setq ergoemacs-keyboard-layout "us")
    (ergoemacs-mode 1)))

;; Theme
(use-package molokai-theme
  :ensure t
  :config (load-theme 'molokai-theme))

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode t))

;HOTKEYS
(global-set-key (kbd "C-<tab>") 'other-window)
(global-set-key (kbd "M-<down>") 'enlarge-window)
(global-set-key (kbd "M-<up>") 'shrink-window)
(global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
(global-set-key (kbd "M-<right>") 'shrink-window-horizontally)
