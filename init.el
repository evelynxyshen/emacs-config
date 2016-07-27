;; MELPA http://melpa.org/#/getting-started
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; Cask
 (require 'cask "/usr/local/Cellar/cask/0.7.4/cask.el")
 (cask-initialize)
 (require 'pallet)
 (pallet-mode t)

;; My emacs setups
 (add-to-list 'load-path "~/.emacs.d/custom")
 (load "smart-quotes.el")
 (load "s.el")
 (load "00common-setup.el")
 (load "01key-bindings.el")
 (load "02ruby.el")
 (load "03web.el")
 (load "04helm-swoop.el")
