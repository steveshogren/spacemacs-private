(defvar cider-settings-packages
  '(
    cider
    )

(defvar cider-settings-excluded-packages '()
  "List of packages to exclude.")

(defun cider-settings/init-cider ()
   ;; "Initialize my package"
  (use-package cider
    :defer t
    :init
    (progn
      (add-hook 'cider-mode-hook 'paredit-mode))))
