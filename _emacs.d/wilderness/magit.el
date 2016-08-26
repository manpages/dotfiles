(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "#cccccc")
     (set-face-foreground 'magit-diff-del "#999999")
     (set-face-background 'magit-item-highlight "#231f23")
     (set-face-foreground 'magit-item-highlight "#929792")
     (set-face-foreground 'magit-diff-none "#535353")
     (set-face-foreground 'magit-diff-hunk-header "#000000")
     (set-face-foreground 'magit-branch "#a5aea5")))

(setq magit-last-seen-setup-instructions "1.4.0")
