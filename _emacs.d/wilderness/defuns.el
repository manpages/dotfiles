(defun kill-region-or-backward-word ()
    "If the region is active and non-empty, call `kill-region'.
Otherwise, call `backward-kill-word'."
    (interactive)
    (call-interactively
        (if (use-region-p) 'kill-region 'backward-kill-word)))
