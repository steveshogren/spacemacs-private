;;; packages.el --- langtool Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.
(setq format-sql-packages
    '(
      ;; package names go here
      ;format-sql
      ))

;; List of packages to exclude.
(setq format-sql-excluded-packages '())
;; For each package, define a function langtool/init-<package-name>
;;
(defun format-sql/init-format-sql ()
  "Initialize my package"
    (use-package format-sql

        ; Use :mode to set language modes to automatically activate on certain extensions
        ; :defer t activates lazy loading which makes startup faster
        :defer t
        ; The code in :init is always run, use it to set up config vars and key bindings
        :init
        (progn ; :init only takes one expression so use "progn" to combine multiple things
          (defun sql-beautify-region (beg end)
            "Beautify SQL in region between beg and END."
            (interactive "r")
            (save-excursion
              (shell-command-on-region beg end "pg_format" nil t)))

          ;; change sqlbeautify to anbt-sql-formatter if you
          ;;ended up using the ruby gem

          (defun sql-beautify-buffer ()
            "Beautify SQL in buffer."
            (interactive)
            (sql-beautify-region (point-min) (point-max)))

;;            (global-set-key "\M-n" 'langtool-goto-next-error)
        :config
        (message "format-sql loaded!"))))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
