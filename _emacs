;; get melpa
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; magit
(require 'magit)

;; my key-bindings
(load "~/.emacs.d/wilderness/defuns.el")
(global-set-key [(control ?w)] 'kill-region-or-backward-word)

;; prettify haskell
(global-prettify-symbols-mode t)
(load "~/.emacs.d/wilderness/haskell.el")

;; monochrome scheme is ok
(load "~/.emacs.d/wilderness/monochrome-theme.el")
(require 'rainbow-delimiters)

;; haskell-mode with heuristic autocompletion
(require 'haskell-mode-autoloads)
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
(set-face-foreground 'rainbow-delimiters-depth-9-face "#E5E5E5")
(set-face-foreground 'rainbow-delimiters-depth-8-face "#303030")
(set-face-foreground 'rainbow-delimiters-depth-6-face "#FAFAFA")
(set-face-foreground 'rainbow-delimiters-depth-4-face "#A6A6A6")
(set-face-foreground 'rainbow-delimiters-depth-5-face "#686868")
(set-face-foreground 'rainbow-delimiters-depth-2-face "#909000")
(set-face-foreground 'rainbow-delimiters-depth-1-face "#909090")
(set-face-foreground 'rainbow-delimiters-depth-7-face "#A0A0A0")
(set-face-foreground 'rainbow-delimiters-depth-3-face "#009090") 
