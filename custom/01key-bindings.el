;; Global: Code Navigation
;;;; Navigate between windows using Alt-1, Alt-2, Shift-left, shift-up, shift-right
(global-set-key [S-left]  'windmove-left)
(global-set-key [S-right] 'windmove-right)
(global-set-key [S-up] 'windmove-up)
(global-set-key [S-down] 'windmove-down)

(global-set-key [f6] 'goto-line)

(require 'neotree)
(global-set-key [f8] 'neotree-toggle)

;; Quick focus to minibuffer
(defun switch-to-minibuffer-window ()
  "switch to minibuffer window (if active)"
  (interactive)
  (when (active-minibuffer-window)
    (select-frame-set-input-focus (window-frame (active-minibuffer-window)))
    (select-window (active-minibuffer-window))))
(global-set-key (kbd "<f7>") 'switch-to-minibuffer-window)

;;;; go to last edit location (super useful)
(require 'goto-last-change)
(global-set-key (kbd "C-c C-q") 'goto-last-change)
;;;; C-u C-space could go back to up to 16 markers on the page

;; Edit: indent/unindent region
(defun my-indent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N 2))
             (setq deactivate-mark nil))
    (self-insert-command N)))
(defun my-unindent-region (N)
  (interactive "p")
  (if (use-region-p)
      (progn (indent-rigidly (region-beginning) (region-end) (* N -2))
             (setq deactivate-mark nil))
    (self-insert-command N)))
(global-set-key (kbd "C->") 'my-indent-region)
(global-set-key (kbd "C-<") 'my-unindent-region)

;; Edit: list all buffers in use
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Edit: go to last edit location
(require 'goto-last-change)
(global-set-key (kbd "C-c C-q") 'goto-last-change)

;; Projectile: Key binding
(define-key global-map [?\s-f] 'helm-projectile-find-file)
(define-key global-map [?\s-a] 'helm-projectile-ag)
(define-key global-map [?\s-b] 'helm-projectile-switch-to-buffer)
