(defun kill-region-or-backward-word ()
    "If the region is active and non-empty, call `kill-region'. Otherwise, call `backward-kill-word'."
    (interactive)
    (call-interactively
        (if (use-region-p) 'kill-region 'backward-kill-word)))

(defun kill-region-or-entire-line ()
  "Kill current line, or text selection.
When `universal-argument' is called first, cut whole buffer (but respect `narrow-to-region').
Author: Xah Lee"
  (interactive)
  (let (p1 p2)
    (if (null current-prefix-arg)
        (progn (if (use-region-p)
                   (progn (setq p1 (region-beginning))
                          (setq p2 (region-end)))
                 (progn (setq p1 (line-beginning-position))
                        (setq p2 (line-beginning-position 2)))))
      (progn (setq p1 (point-min))
             (setq p2 (point-max))))
    (kill-region p1 p2)))
