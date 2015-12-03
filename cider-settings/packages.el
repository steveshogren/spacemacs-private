(defvar cider-settings-packages
  '(
    cider
    ))

(defvar cider-settings-excluded-packages '()
  "List of packages to exclude.")

(defun cider-settings/init-cider ()
  ;; "Initialize my package"
  (use-package cider
    :defer t
    :init
    (progn
      (add-hook 'cider-mode-hook 'paredit-mode))
    :config
    (progn
      ;; (require 'cl)
      ;; (defun spacemacs//bk-kill-buffers (regexp)
      ;;   "Kill buffers matching REGEXP without asking for confirmation."
      ;;   (interactive "sKill buffers matching this regular expression: ")
      ;;   (flet ((kill-buffer-ask (buffer) (kill-buffer buffer)))
      ;;     (kill-matching-buffers regexp)))
      (defun spacemacs//better-cider-connect (port)
        (interactive)
        (if (y-or-n-p "Close all old cider buffers?")
            (kill-matching-buffers "cider"))
        (condition-case ex
            (cider-connect "127.0.0.1" port)
          ('error (if (y-or-n-p "No local repl, jack in?")
                      (cider-jack-in)))))
      (defun spacemacs/cider-local () (interactive)
        (spacemacs//better-cider-connect "7888"))
      (defun spacemacs/clojure-add-trace ()
        (interactive)
        (paredit-wrap-sexp)
        (insert "trace/trace \"\"")
        (backward-char)
        (evil-insert 1)
        (format-file))
      (defun spacemacs/clojure-remove-trace ()
        (interactive)
        (search-backward "trace")
        (paredit-forward-barf-sexp)
        (paredit-backward)
        (paredit-backward)
        (kill-sexp)
        (format-file))

      ;; (define-key clojure-mode-map (kbd "C-<f9>") 'clojure-add-trace)
      ;; (define-key clojure-mode-map (kbd "C-<f10>") 'clojure-remove-trace)
      ;; (define-key clojure-mode-map (kbd "<f7>") 'cider-local)
      (add-hook 'cider-mode-hook 'paredit-mode))

    (define-key clojure-mode-map (kbd "C-q") 'cider-find-var)
    ;; (define-key clojure-mode-map (kbd "<f12>") 'cider-jump)
    (define-key clojure-mode-map (kbd "<f8>") 'cider-eval-buffer)
    (define-key clojure-mode-map (kbd "C-M-h") 'cider-jump-back)
    ;;(define-key clojure-mode-map (kbd "C--") 'cider-jump-back)
    ;; (define-key clojure-mode-map (kbd "C-S-M-x") 'cider-eval-print-last-sexp)

    (evil-leader/set-key-for-mode 'clojure-mode
      "mta" 'spacemacs/clojure-add-trace
      "mtr" 'spacemacs/clojure-remove-trace
      "mcl" 'spacemacs/cider-local
      )))
