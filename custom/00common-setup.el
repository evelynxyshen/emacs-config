;; Start: Set the starting position and width and height of Emacs Window
(add-to-list 'default-frame-alist '(left . 0))
(add-to-list 'default-frame-alist '(top . 0))
(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 234))

;; Start: Disable welcome message, no tool bar, no menu bar
(setq inhibit-startup-message t)
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Start: Prefer utf-8 encoding
(prefer-coding-system 'utf-8)

;;Start: Increase memory to be used before garbage collecting
(setq gc-cons-threshold 1000000000)

;; Backup: Change backup file directory
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))

;; AutoComplete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; Style: Color theme
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/custom-themes/emacs-color-theme-solarized")
;; (load-theme 'solarized t)
;; (set-frame-parameter nil 'background-mode 'dark)
;; (enable-theme 'solarized)
(add-to-list 'custom-theme-load-path "~/.emacs.d/custom-themes/emacs-color-theme-tomorrow")
(add-to-list 'load-path "~/.emacs.d/custom-themes/emacs-color-theme-tomorrow")
(require 'tomorrow-night-paradise-theme)
(load-theme 'tomorrow-night-paradise t)

;; Style: Font size
(set-face-attribute 'default nil :height 105)

;; Style: Show line-number and column-number
(line-number-mode 1)
(column-number-mode 1)

;; Style: Display continuous lines
(setq-default truncate-lines nil)
;; Style: Trucate even when screen is split into multiple windows
(setq-default truncate-partial-width-windows nil)

;; Style: indentation
(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq standard-indent 2)
(setq js-indent-level 2)
(setq jsx-indent-level 2)
(setq css-indent-offset 2)

;; Project: Projectile
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)
(setq projectile-indexing-method 'alien)
(setq projectile-switch-project-action 'helm-projectile-find-file)

;; Project: Neotree
(add-to-list 'load-path "~/.emacs.d/custom/neotree")
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Edit: Delete selection
(delete-selection-mode 1)
(setq shift-select-mode nil)

;; Edit: Display line number
(setq linum-format "%4d")
(global-linum-mode 1)
;; Edit: Interface for turning-off line number
;; (require 'linum-off)

;; Edit: Charactor limit each line
(require 'whitespace)
(setq-default whitespace-line-column 100)
(setq-default whitespace-style '(face lines-tail tailing))
(global-whitespace-mode t)

;; Edit: Trailing white spaces
(setq-default show-trailing-whitespace t)
(add-hook 'before-save-hook 'whitespace-cleanup)

;; Custom-set-variable: should only contain one instance in init.el
(custom-set-variables '(frame-background-mode (quote dark)))
(custom-set-faces)

(require 'smart-quotes)
(add-hook 'text-mode-hook 'turn-on-smart-quotes)
(quote (("british" "[[:alpha:]]" "[^[:alpha:]]" "['’]" t ("-d" "en_GB") nil utf-8)))

;; show and hide mode enable for javascript
(add-hook 'js-mode-hook
     (lambda ()
        ;; Scan the file for nested code blocks
        (imenu-add-menubar-index)
        ;; Activate the folding mode
        (hs-minor-mode t)))

;; Show-hide
(add-to-list 'hs-special-modes-alist
	     '(enh-ruby-mode
	       "\\(def\\|do\\|{\\)" "\\(end\\|end\\|}\\)" "#"
	       (lambda (arg) (ruby-end-of-block)) nil))

(add-hook 'c-mode-common-hook   'hs-minor-mode)
(add-hook 'emacs-lisp-mode-hook 'hs-minor-mode)
(add-hook 'java-mode-hook       'hs-minor-mode)
(add-hook 'lisp-mode-hook       'hs-minor-mode)
(add-hook 'perl-mode-hook       'hs-minor-mode)
(add-hook 'sh-mode-hook         'hs-minor-mode)
(add-hook 'ruby-mode-hook       'hs-minor-mode)
(add-hook 'enh-ruby-mode-hook   'hs-minor-mode)
(add-hook 'web-mode-hook        'hs-minor-mode)

(global-set-key (kbd "C-c s") 'hs-show-block)
(global-set-key (kbd "C-S-c s") 'hs-show-all)
(global-set-key (kbd "C-c h") 'hs-hide-block)
(global-set-key (kbd "C-S-c h") 'hs-hide-all)

;; dump-jump jump to function definition
(require 's)
(require 'dumb-jump)
(dumb-jump-mode t)
