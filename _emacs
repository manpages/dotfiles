;; get melpa
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; magit
(require 'magit)
(load-file "~/.emacs.d/wilderness/magit.el")

;; emacs-lisp
(add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)

;; my key-bindings
(load "~/.emacs.d/wilderness/defuns.el")
(global-set-key [(control ?w)] 'kill-region-or-backward-word)
(global-set-key [(control ?k)] 'kill-region-or-entire-line)
(global-set-key (kbd "<escape>") 'keyboard-quit)

;; prettify haskell
(global-prettify-symbols-mode t)
(load "~/.emacs.d/wilderness/haskell.el")

;; monochrome scheme is ok
(load "~/.emacs.d/wilderness/monochrome-theme.el")
(require 'rainbow-delimiters)

;; haskell-mode with heuristic autocompletion
(require 'haskell-mode-autoloads)
(add-hook 'haskell-mode-hook 'rainbow-delimiters-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

;; coffee-script (I know, right?)
(add-hook 'coffee-mode-hook 'rainbow-delimiters-mode)
(add-hook 'after-save-hook
	  (lambda ()
	    (when (string-match "\.coffee$" (buffer-name))
	      (coffee-compile-file)))) 

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
