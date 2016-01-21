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
(setq langtool-packages
    '(
      ;; package names go here
      langtool
      ))

;; List of packages to exclude.
(setq langtool-excluded-packages '())
;; For each package, define a function langtool/init-<package-name>
;;
(defun langtool/init-langtool ()
  "Initialize my package"
    (use-package langtool
        ; Use :mode to set language modes to automatically activate on certain extensions
        ; :defer t activates lazy loading which makes startup faster
        :defer f
        ; The code in :init is always run, use it to set up config vars and key bindings
        :init
        (progn ; :init only takes one expression so use "progn" to combine multiple things
        ; You can configure package variables here
            (setq langtool-language-tool-jar "/home/jack/LanguageTool-3.2/languagetool-commandline.jar")
            ;;(setq langtool-default-language "en-US -d EN_QUOTES[1]")
            (setq langtool-default-language "en-US")
            (setq langtool-disabled-rules '("EN_QUOTES"))
            
            ;;(setq langtool-disabled-rules "[EN_QUOTES[1]],[EN_QUOTES[2]]")
            
;;            (setq langtool-disabled-rules '("[EN_QUOTES[1]]" "[EN_QUOTES[2]]"))

            (global-set-key "\M-n" 'langtool-goto-next-error)
        ; Using evil-leader/set-key-for-mode adds bindings under SPC for a certain mode
        ; Use evil-leader/set-key to create global SPC bindings
        ;;(evil-leader/set-key-for-mode 'ledger-mode
            ;;"mhd"   'ledger-delete-current-transaction
            ;;"m RET" 'ledger-set-month))
        :config ; :config is called after the package is actually loaded with defer
        ; You can put stuff that relies on the package like function calls here
        (message "Langtool loaded!"))))
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
