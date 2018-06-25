(defun neotree-project-dir-toggle ()
  "Open NeoTree using the project root."
  (interactive)
  (let ((project-dir
    (ignore-errors
      (projectile-project-root)))
      (file-name (buffer-file-name))
      (neo-smart-open t))
    (if (and (fboundp 'neo-global--window-exists-p)
      (neo-global--window-exists-p))
      (neotree-hide)
      (progn
        (neotree-show)
        (if project-dir
          (neotree-dir project-dir))
          (if file-name
            (neotree-find file-name))))))

(provide 'base-functions)
