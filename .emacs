;;; .emacs -- Emacs configuration file
;;; Commentary:
;;; This is a fork of manpages .emacs, using some good stuff by volhovm

;;; Code:
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
;(quelpas 'evil 'evil-magit 'evil-surround 'evil-leader
;	 'rainbow-delimiters 'haskell-mode 'flycheck-haskell)

(package-initialize)
(add-to-list 'load-path "~/.emacs.d/plugins/evil-org-mode")
(require 'evil-org)
(setq evil-want-C-i-jump nil)

;; Leader
(global-evil-leader-mode)
(evil-leader/set-leader ",")
;; Happiness
(evil-mode 1)

;; Org-mode
(setq org-todo-keywords
      '((sequence "TODO(t)" "NEXT(n)" "DOING(d)"
		  "WAITING(w@/!)" "DELEGATED(x@/!)" "|"
		  "DONE(o!)" "CANCELED(c@/!)")))
; \emsp fix by Misha
(defun my-org-clocktable-indent-string (level)
  "LEVEL -- indentation level."
  (if (= level 1)
      ""
    (let ((str "▶"))
      (while (> level 2)
	(setq level (1- level)
	      str (concat str "  ")))
      (concat str " ")))
  )
(advice-add 'org-clocktable-indent-string :override #'my-org-clocktable-indent-string)

;; haskell
;; smart stuff by Misha
(require 'haskell-process)
(require 'hindent)
(setq-default hindent-style "johan-tibell")
(add-hook 'haskell-mode-hook 'volhovm-haskell-mode-hook)
(defun volhovm-haskell-mode-hook ()
  "Func for haskell-mode hook."
  (interactive-haskell-mode)
  (whitespace-mode)
  (volhovm-haskell-style)
  (hindent-mode))
;; make advanced tools usable
'(flycheck-ghc-args (quote ("-v")))
'(flycheck-haskell-runghc-command
  (quote
   ("stack" "--verbosity" "silent" "runghc" "--")))
'(haskell-interactive-popup-errors nil)
'(haskell-process-args-stack-ghci (quote ("--ghc-options=-ferror-spans")))
'(haskell-process-log t)
'(haskell-process-type (quote auto))
;; eye-candy
(global-prettify-symbols-mode t)
(load "~/.emacs.d/wilderness/haskell.el")
(setq haskell-stylish-on-save t)
;; we've got style, we've got moves
(defun volhovm-haskell-style ()
  "Style properties for haskell."
  (interactive)
  (setq tab-width 4
	haskell-indentation-layout-offset 4
	haskell-indentation-left-offset 4
	haskell-indentation-ifte-offset 4))
;; not-so-smart stuff by Jonn
(add-hook 'after-init-hook #'global-flycheck-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup))

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files (quote ("~/life.org"))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(whitespace-newline ((t (:foreground "black" :weight normal))))
 '(whitespace-space ((t (:background "black" :foreground "black")))))

(provide '.emacs)
;;; .emacs ends here
