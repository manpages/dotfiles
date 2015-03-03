;; get melpa
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

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

;; warm and fuzzy
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(setq ido-create-new-buffer 'always)

(ido-mode 1)
;;(require 'icicles)
;;(require 'fuzzy-match)
;;(setq icicle-TAB-completion-methods '(fuzzy vanilla basic))
;;(icy-mode)

;; backups
(setq backup-directory-alist `(("." . "~/.saves")))
(setq backup-by-copying-when-linked t
  delete-old-versions t
  kept-new-versions 10
  kept-old-versions 5
  version-control t)

;; boring shit
(blink-cursor-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)
(set-default-font "Ubuntu Mono-8")
