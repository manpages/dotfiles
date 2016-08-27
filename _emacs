(load "~/.emacs.d/wilderness/defuns.el")

;; while deploying emacs on a new machine, cross your fingers and hope for best
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)
(unless package-archive-contents
    (package-refresh-contents))
(unless (require 'quelpa nil t)
  (with-temp-buffer
    (url-insert-file-contents "https://raw.github.com/quelpa/quelpa/master/bootstrap.el")
        (eval-buffer)))

;; Sorrow.
(quelpa 'evil 'evil-magit 'evil-surround 'evil-leader)
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(package-initialize)

;; Happiness
(setq evil-want-C-i-jump nil)
(evil-mode 1)
;; Leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
;; Work with org-mode
(require 'evil-org)

;; prettify haskell
(global-prettify-symbols-mode t)
(load "~/.emacs.d/wilderness/haskell.el")
(setq haskell-stylish-on-save t)

;; monochrome scheme is ok
(load "~/.emacs.d/wilderness/monochrome-theme.el")
(require 'rainbow-delimiters)

;; warm and fuzzy
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)

(ido-mode 1)

;; backups
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying-when-linked t
  delete-old-versions t
  kept-new-versions 10
  kept-old-versions 5
  version-control t)
(setq auto-save-default nil)

;; boring shit
(set-cursor-color "#997A8D") 
(set-mouse-color "#997A8D") 
(blink-cursor-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(set-default-font "Ubuntu Mono-8")
(set-face-background 'rainbow-delimiters-unmatched-face "red")
(set-face-foreground 'rainbow-delimiters-unmatched-face "black")
(set-face-foreground 'rainbow-delimiters-depth-9-face "#BBBBBB")
(set-face-foreground 'rainbow-delimiters-depth-8-face "#90B0B0")
(set-face-foreground 'rainbow-delimiters-depth-6-face "#B0B095")
(set-face-foreground 'rainbow-delimiters-depth-4-face "#907590")
(set-face-foreground 'rainbow-delimiters-depth-5-face "#B0B0B0")
(set-face-foreground 'rainbow-delimiters-depth-2-face "#909075")
(set-face-foreground 'rainbow-delimiters-depth-1-face "#909090")
(set-face-foreground 'rainbow-delimiters-depth-7-face "#B090B0")
(set-face-foreground 'rainbow-delimiters-depth-3-face "#759090")
(put 'downcase-region 'disabled nil)
