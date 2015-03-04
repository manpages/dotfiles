(deftheme magit-classic
  "Old-style faces of Magit")

(custom-theme-set-faces
 'magit-classic

'(magit-file-header ((t (:foreground "violet"))))
'(magit-hunk-header ((t (:foreground "blue"))))
'(magit-header ((t (:foreground "cyan"))))
'(magit-tag-label ((t (:background "blue" :foreground "orange"))))
'(magit-diff-add ((t (:foreground "MediumSlateBlue"))))
'(magit-diff-del ((t (:foreground "maroon"))))
'(magit-item-highlight ((t (:background "#000012"))))

(provide-theme 'magit-classic)
