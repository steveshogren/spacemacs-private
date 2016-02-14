;; -*- mode: dotspacemacs -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (ie. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '(
                                           "~/private/"
                                           )
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; --------------------------------------------------------
     ;; Example of useful layers you may want to use right away
     ;; Uncomment a layer name and press C-c C-c to install it
     ;; --------------------------------------------------------
     (auto-completion :variables
                      auto-completion-enable-company-help-tooltip t)
     better-defaults
     (git :variables
          git-gutter-use-fringe t)
     markdown
     org
     sql
     syntax-checking
     clojure
     scala
     themes-megapack
     ;; cider-settings
     paredit-evil-keys
     (haskell :variables haskell-enable-hindent-style "johan-tibell")
     ess
     restclient
     langtool
     fsharp
     racket
     react
     (colors ;;:variables
             ;;colors-enable-rainbow-identifiers t
             ;;colors-enable-nyan-cat-progress-bar t
             )
     ;; ujelly
     ;; twilight-anti-bright
     ;; tronesque
     ;; tango2
     ;; sanityinc-tomorrow-night
     ;;purple-haze
     )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages t))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progess in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to a .PNG file.
   ;; If the value is nil then no banner is displayed.
   ;; dotspacemacs-startup-banner 'official
   dotspacemacs-startup-banner 'official
   ;; t if you always want to see the changelog at startup
   dotspacemacs-always-show-changelog t
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(ujelly deeper-blue sanityinc-tomorrow-bright
                         solarized-dark
                         solarized-light
                         leuven
                         monokai
                         zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 10
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil the paste micro-state is enabled. While enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state t
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.4
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup 't
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode t
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  (autoload 'haskell-indentation-enable-show-indentations "haskell-indentation")
  (autoload 'haskell-indentation-disable-show-indentations "haskell-indentation")
  (add-to-list 'exec-path "~/.cabal/bin/")
  )

(defun dotspacemacs/user-config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."

  ;;(desktop-save-mode 1)
  (golden-ratio-mode 1)
  ;;(desktop-read)

  (define-key global-map (kbd "C-M-h") 'pop-tag-mark)
  (define-key global-map (kbd "C-q") 'cider-find-var)

  ;;(define-key l-state-map (kbd ")") 'paredit-forward)
  ;;(define-key evil-normal-state-map (kbd "(") 'paredit-backward)

  (defun wc-only-words ()
    "Prints number of lines, words and characters in region or whole buffer."
    (interactive)
    (let ((n 0)
          (start (if mark-active (region-beginning) (point-min)))
          (end (if mark-active (region-end) (point-max))))
      (save-excursion
        (goto-char start)
        (while (< (point) end) (if (forward-word 1) (setq n (1+ n)))))
      (format "%3d" n)))

 ;; (spacemacs|define-mode-line-segment date-time-segment
 ;;   (concat (shell-command-to-string "echo -n $(date +%k:%M)")
 ;;           " WC:" (wc-only-words)))

  ;;(add-to-list 'spacemacs-mode-line-right 'date-time-segment)

  ;; Sql usage
  ;; sql-postgres (connect to postgres buffer)
  ;; nav to sql file
  ;; sql-set-product (postgres)
  ;; sql-set-sqli-buffer (*SQL*)
  ;; C-cC-b send buffer to *SQL* instance

  ;; SPC-k to start spartparens movement
  ;; SPC-k s/b slurp barf
  (setq sql-postgres-login-params
      '((user :default "postgres")
        (database :default "swipes")
        (server :default "localhost")
        (port :default 5432)))
  (add-hook 'sql-interactive-mode-hook
            (lambda ()
              (toggle-truncate-lines t)))

  (add-hook 'org-mode-hook
            (lambda ()
              (flyspell-mode t)
              (auto-fill-mode t)
              ))

  (define-key global-map (kbd "C-)") 'sp-forward-slurp-sexp)
  (define-key global-map (kbd "C-}") 'sp-forward-barf-sexp)
  (define-key global-map (kbd "C-(") 'sp-backward-slurp-sexp)
  (define-key global-map (kbd "C-{") 'sp-backward-barf-sexp)

  (defun helm-do-grep-recursive (&optional non-recursive)
    "Like `helm-do-grep', but greps recursively by default."

    (interactive "P")
    (let* ((current-prefix-arg (not non-recursive))
           (helm-current-prefix-arg non-recursive))
      (call-interactively 'helm-do-grep)))

  (eval-after-load 'grep
    '(progn
       (add-to-list 'grep-find-ignored-directories ".git")
       (add-to-list 'grep-find-ignored-directories "target")
       (add-to-list 'grep-find-ignored-directories "node_modules")
       (add-to-list 'grep-find-ignored-directories "gen")
       (add-to-list 'grep-find-ignored-files "*.jar")
       (add-to-list 'grep-find-ignored-files "angular.js")
       (add-to-list 'grep-find-ignored-files "bootstrap.js")
       (add-to-list 'grep-find-ignored-files "ng-grid.js")
       (add-to-list 'grep-find-ignored-files "cal-heatmap.js")
       (add-to-list 'grep-find-ignored-files "nrcerts")
       (add-to-list 'grep-find-ignored-files "*.dump")))

  ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
  (add-hook 'haskell-mode-hook 'haskell-indentation-mode)

  ;; Replacing text in several files
  ;; Replacing an occurrence of text in several files can be performed via helm-ag.
  ;; Say you want to replace all foo occurrences by bar in your current project:
  ;; initiate a search with SPC /
  ;; enter in edit mode with C-c C-e
  ;; go to the occurrence and enter in iedit state with SPC s e
  ;; edit the occurrences then leave the iedit state
  ;; press C-c C-c


  (add-hook 'helm-before-initialize-hook
            (lambda ()
              ;; instead I've found that one can save a grep session with
              ;; C-x C-s, then go to files using C-up/down when in insert
              ;;(define-key helm-grep-mode-map (kbd "RET") 'helm-grep-mode-jump-other-window)
              (define-key global-map (kbd "C-x C-f") 'helm-do-grep-recursive)
              ;(define-key global-map (kbd "C-x C-f") 'helm-find-files)
              (define-key global-map (kbd "C-x b") 'helm-mini)
              ))

  )
;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
