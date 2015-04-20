(defvar paredit-evil-keys-packages
  '(
    paredit
    )
  "List of all packages to install and/or initialize. Built-in packages
which require an initialization must be listed explicitly in the list.")

(defvar paredit-evil-keys-excluded-packages '()
  "List of packages to exclude.")

;; For each package, define a function paredit-evil-keys/init-<package-paredit-evil-keys>
;;
;; (defun paredit-evil-keys/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package

(defun paredit-evil-keys/init-paredit ()
   ;; "Initialize my package"
  (use-package paredit
    :defer t
    :init
    (progn
      (add-to-list 'load-path "~/.emacs.d/private/paredit-evil-keys")
      (require 'evil-paredit)
      (add-hook 'paredit-mode-hook 'evil-paredit-mode)

      (define-key evil-normal-state-map (kbd ")") 'paredit-forward)
      (define-key evil-normal-state-map (kbd "(") 'paredit-backward)
      )))

