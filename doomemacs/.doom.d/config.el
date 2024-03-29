;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Hai Nguyen"
      user-mail-address "admin@ergomech.store")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
(setq doom-font "Hack Nerd Font-12")
(require 'org-habit)
(require 'org-linker-edna)
(org-edna-mode 1)
(org-super-agenda-mode 1)
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
(setq org-agenda-files (quote ("~/Nextcloud/org/todo.org"
                               "~/Nextcloud/org/inbox.org"
                               "~/Nextcloud/org/oneday.org"
                               "~/Nextcloud/org/mobile.org"
                               "~/Nextcloud/org/cal.org")))
(setq org-roam-directory "~/Nextcloud/org/roam")

(setq +org-capture-todo-file "inbox.org")

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

(setq org-deadline-warning-days 3)





(after! org
(setq org-todo-keywords
        '((sequence
           "TODO(t)"  ; A task that needs doing & is ready to do
           "NEXT(n)"
           "PROJ(p)"  ; A project, which usually contains other tasks
           "LOOP(r)"  ; A recurring task
           "STRT(s)"  ; A task that is in progress
           "WAIT(w)"  ; Something external is holding up this task
           "HOLD(h)"  ; This task is paused/on hold because of me
           "IDEA(i)"  ; An unconfirmed and unapproved task or notion
           "|"
           "DONE(d)"  ; Task successfully completed
           "KILL(k)") ; Task was cancelled, aborted or is no longer applicable
          (sequence
           "[ ](T)"   ; A task that needs doing
           "[-](S)"   ; Task is in progress
           "[?](W)"   ; Task is being held up or paused
           "|"
           "[X](D)")  ; Task was completed
          (sequence
           "|"
           "OKAY(o)"
           "YES(y)"
           "NO(n)"))
        org-todo-keyword-faces
        '(("[-]"  . +org-todo-active)
          ("STRT" . +org-todo-active)
          ("[?]"  . +org-todo-onhold)
          ("WAIT" . +org-todo-onhold)
          ("HOLD" . +org-todo-onhold)
          ("PROJ" . +org-todo-project)
          ("NO"   . +org-todo-cancel)
          ("KILL" . +org-todo-cancel)))


(setq org-default-notes-file
        (expand-file-name +org-capture-notes-file org-directory)
        +org-capture-journal-file
        (expand-file-name +org-capture-journal-file org-directory)
        org-capture-templates
        '(("t" "Personal todo" entry
           (file+headline +org-capture-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("i" "Interupted task" entry
           (file+headline "~/Nextcloud/org/todo.org" "Tasks")
           "* TODO %?\n%i\n%a" :prepend t :clock-in t :clock-resume t)
          ("n" "Personal notes" entry
           (file+headline +org-capture-notes-file "Inbox")
           "* %u %?\n%i\n%a" :prepend t)
          ("j" "Journal" entry
           (file+olp+datetree +org-capture-journal-file)
           "* %U %?\n%i\n%a" :prepend t)

          ;; Will use {project-root}/{todo,notes,changelog}.org, unless a
          ;; {todo,notes,changelog}.org file is found in a parent directory.
          ;; Uses the basename from `+org-capture-todo-file',
          ;; `+org-capture-changelog-file' and `+org-capture-notes-file'.
          ("p" "Templates for projects")
          ("pt" "Project-local todo" entry  ; {project-root}/todo.org
           (file+headline +org-capture-project-todo-file "Inbox")
           "* TODO %?\n%i\n%a" :prepend t)
          ("pn" "Project-local notes" entry  ; {project-root}/notes.org
           (file+headline +org-capture-project-notes-file "Inbox")
           "* %U %?\n%i\n%a" :prepend t)
          ("pc" "Project-local changelog" entry  ; {project-root}/changelog.org
           (file+headline +org-capture-project-changelog-file "Unreleased")
           "* %U %?\n%i\n%a" :prepend t)

          ;; Will use {org-directory}/{+org-capture-projects-file} and store
          ;; these under {ProjectName}/{Tasks,Notes,Changelog} headings. They
          ;; support `:parents' to specify what headings to put them under, e.g.
          ;; :parents ("Projects")
          ("o" "Centralized templates for projects")
          ("ot" "Project todo" entry
           (function +org-capture-central-project-todo-file)
           "* TODO %?\n %i\n %a"
           :heading "Tasks"
           :prepend nil)
          ("on" "Project notes" entry
           (function +org-capture-central-project-notes-file)
           "* %U %?\n %i\n %a"
           :heading "Notes"
           :prepend t)
          ("oc" "Project changelog" entry
           (function +org-capture-central-project-changelog-file)
           "* %U %?\n %i\n %a"
           :heading "Changelog"
           :prepend t))))

(require 'org-caldav)

(setq org-caldav-url "https://files.nguyen-hai.com/remote.php/dav/calendars/hainguyen"
      org-caldav-calendar-id "personal-1"
      org-caldav-inbox "~/Nextcloud/org/cal.org"
      org-caldav-files '("~/Nextcloud/org/todo.org")
      org-icalendar-timezone "Asia/Ho_Chi_Minh")
 (setq org-icalendar-include-todo t
      org-icalendar-use-deadline '(event-if-todo event-if-not-todo todo-due)
      org-icalendar-use-scheduled '(event-if-todo event-if-not-todo todo-start)
      org-icalendar-with-timestamps t)


(use-package mu4e
  :ensure nil
  ;; :load-path "/usr/share/emacs/site-lisp/mu4e/"
  ;; :defer 20 ; Wait until 20 seconds after startup
  :config

  ;; This is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")

  (setq mu4e-drafts-folder "/[Gmail]/Drafts")
  (setq mu4e-sent-folder   "/[Gmail]/Sent Mail")
  (setq mu4e-refile-folder "/[Gmail]/All Mail")
  (setq mu4e-trash-folder  "/[Gmail]/Trash")

  (setq mu4e-maildir-shortcuts
      '(("/Inbox"             . ?i)
        ("/[Gmail]/Sent Mail" . ?s)
        ("/[Gmail]/Trash"     . ?t)
        ("/[Gmail]/Drafts"    . ?d)
        ("/[Gmail]/All Mail"  . ?a))))


(setq smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 465
      smtpmail-stream-type  'ssl)


;; Configure the function to use for sending mail
(setq message-send-mail-function 'smtpmail-send-it)
(setq mu4e-alert-style nil)
(setq org-habit-show-habits-only-for-today t)
(add-to-list 'auto-mode-alist '("\\.epub\\'" . nov-mode))



(setq org-agenda-custom-commands
      '(("d" "Dashboard"
         ((agenda "" ((org-agenda-span 'week)
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :scheduled today
                                :deadline today
                                :habit t
                                :order 2
                                 )
                         (:discard (:anything t))
                         ))))
          (alltodo "" ((org-agenda-overriding-header "==============================================")
                    (org-super-agenda-groups
                            '((:name "===============Projects=================="
                               :children todo)
                              (:name "===============Inbox====================="
                               :tag "INBOX")
                              (:name "===============Quick take================"
                               :and (:effort< "0:30"
                                     :children nil))
                              (:discard (:anything t))
                              ))))


          (org-ql-search-block '(and (todo)
                                     (not (scheduled))
                                     (ancestors (todo "PROJ")))
                               ((org-ql-block-header "\n=======================Project tasks================")
                                (org-super-agenda-groups '((:auto-parent t))))
                               )
          (org-ql-search-block '(and (and (todo)
                                          (not (todo "PROJ")))
                                     (not (ancestors (todo)))
                                     )
                               ((org-ql-block-header "\n====================Non-Project tasks==============="))
                               )

          (org-ql-search-block '(and (todo "PROJ")
                                     (not (done))
                                     (not (descendants (or(todo "NEXT")
                                                          (todo "STRT"))))
                                     (not (descendants (scheduled))))
                               ((org-ql-block-header "\n====================Stuck Projects=================")))

          (org-ql-block '(and (todo)
                                     (not (done))
                                     (not (todo "NEXT"))
                                     (parent (not (todo)))
                                     (not (descendants))
                                     )
                               ((org-ql-block-header "\n===================Available tasks=================")))
          (org-ql-block '(todo "WAIT")
                               ((org-ql-block-header "\n===================Wait tasks======================")))
          ))

        ("t" "Today"
         ((agenda "" ((org-agenda-span 'week)
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :scheduled today
                                :deadline today
                                :habit t
                                :order 2)
                         (:discard (:anything t))
                         ))))
          (org-ql-search-block '(and (or (todo "NEXT")
                                         (todo "STRT"))
                                     (not (scheduled))
                                     (ancestors (todo "PROJ")))
                               ((org-ql-block-header "\n=======================Project tasks================")
                                (org-super-agenda-groups '((
                                                            :auto-parent t
                                                             ))))
                               )
          (org-ql-search-block '(and (or (todo "NEXT")
                                         (todo "STRT"))
                                     (not (ancestors (todo)))
                                     )
                               ((org-ql-block-header "\n====================Non-Project tasks==============="))
                               )
          ))


        ))
(defun ugt/org-ql-view--format-element (orig-fun &rest args)
  "This function will intercept the original function and
   add the filename to the result.

   ARGS is `element' in `org-ql-view--format-element'"
  (if (not args)
      ""
    (let* ((element args)
           (properties (cadar element))
           (result (apply orig-fun element))
           (filename (buffer-name
                      (marker-buffer
                       (plist-get properties :org-marker)))))
      (concat filename " " result))))
(advice-add 'org-ql-view--format-element :around #'ugt/org-ql-view--format-element)
