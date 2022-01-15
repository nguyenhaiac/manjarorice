;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hai Nguyen"
      user-mail-address "hainguyentien@hotmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
(setq doom-font "Hack Nerd Font-12")
(require 'org-habit)
(setq org-agenda-skip-deadline-prewarning-if-scheduled t)
(setq org-agenda-span 7)
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "~/Nextcloud/org/")
(setq org-agenda-files (quote ("~/Nextcloud/org/todo.org")))
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)
(setq org-habit-show-habits-only-for-today nil) ;)


;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(setq org-agenda-custom-commands
      '(("g" . "GTD contexts")
        ("go" "work" tags-todo "@work")
        ("gc" "Computer" tags-todo "@computer")
        ("gp" "Phone" tags-todo "@phone")
        ("gh" "Home" tags-todo "@home")
        ("ge" "Home" tags-todo "@ergomech")
        ("G" "GTD Block Agenda"
         ((tags-todo "@work")
          (tags-todo "@computer")
          (tags-todo "@phone")
          (tags-todo "@home")
          (tags-todo "@ergomech"))
         nil                      ;; i.e., no local settings
         ("~/Nextcloud/next-actions.html")) ;; exports block to this file with C-c a e
       ;; ..other co    mmands here
        ))
(setq vterm-shell "/usr/bin/zsh")
(setq rmh-elfeed-org-files (list "~/.doom.d/elfeed.org"))
(setq org-agenda-tags-column 90)
(setq org-agenda-block-separator "-")
(setq org-agenda-compact-blocks t)
(setq org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-prewarning-if-scheduled t
      org-agenda-skip-scheduled-if-deadline-is-shown t)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))
