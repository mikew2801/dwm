(setq warning-minimum-level :emergency)

(call-process-shell-command "xmodmap -e \"keysym Tab = Super_L\"" nil 0)

(defvar god-mode-used 1
  "Indicates if god-mode should be enabled.")

(defvar emacs-plus-mode-used 1
  "Indicates whether emacs+ mode rebinding should be used.")

(setq default-directory "~/Dropbox/Main_Config/")

(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "/home/michael/Dropbox/3_Emacs/")
(add-to-list 'load-path "/home/michael/Dropbox/Main_Config/personal-modules")
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")
(add-to-list 'load-path "~/.emacs.d/lisp/")
(add-to-list 'load-path "/home/michael/Dropbox/3_Emacs/")

(load "~/Dropbox/Main_Config/Main_Emacs/nyaya-emacs-personal.el")

(require 'package)

(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("org" . "https://orgmode.org/elpa/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))
(package-initialize)

(setq inhibit-startup-screen t)
(setq ring-bell-function 'ignore)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(setq inhibit-startup-screen t)

(define-key global-map (kbd "C-<f11>") 'toggle-frame-fullscreen)

(defadvice async-shell-command (around hide-async-windows activate)
  (save-window-excursion
    ad-do-it))

(global-hl-line-mode)

; Set the colour of the mode line
(custom-set-faces
  '(mode-line-inactive ((t (:foreground "black" :background "azure4")))))

(custom-set-faces
  '(font-lock-comment-face ((t (:slant italic)))))

(set-face-attribute 'default nil :height 140)
(set-frame-font "DejaVu Sans Mono-12" nil t)

;; Default for all future frames
(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;; Force for current frame after init
(add-hook 'after-init-hook
          (lambda ()
            (set-frame-font "DejaVu Sans Mono-12" t t)))

(setq org-fontify-quote-and-verse-blocks t)

(custom-set-faces
 '(org-quote ((t (:background "#2e3440" :foreground "#d8dee9" :extend t :slant normal))))
 '(org-verse ((t (:background "#2e3440" :foreground "#d8dee9" :extend t :slant normal)))))

(setq sentence-end-double-space nil)

(global-display-line-numbers-mode t)

;; Turn line numbers off for various modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		pdf-view-mode-hook
		shell-mode-hook
		eshell-mode-hook
		eww-mode))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(set-fontset-font t 'devanagari
                  (font-spec :family "Noto Sans Devanagari"))

(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'embark)
(straight-use-package 'exwm)
(straight-use-package 'pdf-tools)
(straight-use-package 'rainbow-delimiters)
(straight-use-package 'yasnippet)
(straight-use-package 'yasnippet-snippets)
(straight-use-package 'hydra)
(straight-use-package 'deadgrep)
(straight-use-package 'openwith)
(straight-use-package 'expand-region)
(straight-use-package 'smex)
(straight-use-package 'company)
(straight-use-package 'company-quickhelp)
(straight-use-package 'swiper)
(straight-use-package 'marginalia)
(straight-use-package 'ivy)
(straight-use-package 'org-ref)
(straight-use-package 'org-roam)
(straight-use-package 'bm)
(straight-use-package 'nix-mode)
(straight-use-package 'lua-mode)
(straight-use-package 'which-key)
(straight-use-package 'dmenu)
(straight-use-package 'god-mode)
(straight-use-package 'org-bullets)
(straight-use-package 'mysql)
(straight-use-package 'counsel-web)
(straight-use-package 'edwina)
(straight-use-package 'all-the-icons)
(straight-use-package 'all-the-icons-ibuffer)
(straight-use-package 'all-the-icons-dired)
(straight-use-package 'magit)
(straight-use-package 'auctex)

(require 'itrans-sa)
(require 'sanskrit-biblio)
;(require 'pdf-occur)
(require 'org)
(require 'exwm)

(define-key global-map (kbd "M-l") 'forward-sentence)
(define-key global-map (kbd "C-M-g") 'help)
(define-key global-map (kbd "C-f") 'repeat)

(defun initialise-git ()
  "Initialise git with name and email."
  (interactive)
  (shell-command "git config --global user.name \"Michael Williams\"")
  (shell-command "git config --global user.email \"mikew2801@gmail.com\""))

(add-hook 'emacs-lisp-mode-hook 'company-mode)

(setq TeX-engine 'xetex)
(setq TeX-command-default "XeLaTeX")
(setq org-latex-compiler "xelatex")

(setq LaTeX-class-list nil)

(defun raise-volume ()
  "Raise the system volume by 10% using pactl."
  (interactive)
  (call-process "pactl" nil 0 nil
                "set-sink-volume" "@DEFAULT_SINK@" "+10%")
  (message "Volume increased by 10%%"))

(defun lower-volume ()
  "Lower the system volume by 10% using pactl."
  (interactive)
  (call-process "pactl" nil 0 nil
                "set-sink-volume" "@DEFAULT_SINK@" "-10%")
  (message "Volume decreased by 10%%"))

(display-time-mode 1)
(display-battery-mode 1)

;; Necessary to stop those timeout errors
(setq xcb:connection-timeout 10)

(set-frame-parameter nil 'fullscreen 'fullboth)

(setq exwm-enable-confirmation nil)

(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-selection-value)

(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

(call-process-shell-command "picom -b --backend glx --log-file /home/michael/picom.log")

(defun open-thunar ()
  (interactive)
  (async-shell-command (concat "thunar " (s-replace " " "\\ " default-directory))))

(define-key global-map (kbd "s-f") 'open-thunar)

(defun mike/increase-brightness ()
  (interactive)
  (async-shell-command "brightnessctl set +5%"))

(defun mike/decrease-brightness ()
  (interactive)
  (async-shell-command "brightnessctl set 5%-"))

(define-key global-map (kbd "<XF86MonBrightnessUp>") 'mike/increase-brightness)
(define-key global-map (kbd "<XF86MonBrightnessDown>") 'mike/decrease-brightness)

(defun mike/start-rofi ()
  (interactive)
  (call-process-shell-command "exec rofi -modi drun,run -show drun -show-icons"))

(defun mike/start-rofi-windows ()
  (interactive)
  (call-process-shell-command "exec rofi -modi window -show window -show-icons"))

(global-set-key (kbd "s-a") 'mike/start-rofi-windows)

(setq exwm-input-prefix-keys
      '(?\C-x
	?\C-u
	?\C-`
	?\s-\[
	?\C-h
	?\M-x
	?\M-`
	?\M-&
	?\M-:
	?\M-s
	?\C-\M-j
	?\C-\M-;	
	?\C-\M-'
	?\M-h
	?\C-\M-l
	?\M-j
	?\M-k
	?\M-l
	?\M-i
	?\M-u
	?\s-y
	?\M-q
	?\M-Q
	?\C-o
	;; This next one is the alt-space key
	134217760
	?\s-`
	?\s-v
	?\s-g
	?\s-m	
	?\s-u
	?\s-n
	?\C-\s-j
	?\C-\s-l
        ?\s-!
	?\s-s
        ?\s-\"
	?\s-£
	?\s-$
	?\s-%
	?\s-^
	?\s-&
	?\s-*
	?\M-o
	?\s-a
	?\s-\(
	?\s-o
	?\s-\)))

; Global-EXWM key bindings
(setq exwm-input-global-keys
      `(([?\s-r] . exwm-reset)
	(,(kbd "s-<f10>") . exwm-reset)
	(,(kbd "s-f") . open-thunar)
	(,(kbd "s-q") . delete-window)
	(,(kbd "s-Q") . delete-other-windows)
        (,(kbd "s-z") . ivy-switch-buffer)
	(,(kbd "s-f") . open-thunar)
	(,(kbd "M-<tab>") . mike/move-to-other-window)
        (,(kbd "s-F") . open-thunar-desktop)
        (,(kbd "s-p") . hydra-org-roam/body)
	(,(kbd "s-t") . shell)
	(,(kbd "C-o") . next-line)
	(,(kbd "<s-tab>") . helm-exwm-switch-to-next-buffer)
	(,(kbd "s--") . mike/exwm/switch-to-next-workspace)
	(,(kbd "s-d") . mike/start-rofi)
	(,(kbd "s-SPC") . mike/start-rofi)
	(,(kbd "<s-q>") . helm-exwm)
	(,(kbd "s-k") . windmove-up)
	(,(kbd "s-j") . windmove-down)
	(,(kbd "s-h") . windmove-left)
	(,(kbd "s-l") . windmove-right)
	(,(kbd "<s-down>") . shrink-window)
	(,(kbd "<s-up>") . enlarge-window)
	(,(kbd "<s-right>") . enlarge-window-horizontally)
	(,(kbd "<s-left>") . shrink-window-horizontally)
	(,(kbd "s-H") . windmove-swap-states-left)
	(,(kbd "s-J") . windmove-swap-states-down)
	(,(kbd "s-K") . windmove-swap-states-up)
	(,(kbd "s-L") . windmove-swap-states-right)		
	(,(kbd "C-s-f") . enlarge-window-horizontally)
	(,(kbd "C-s-o") . enlarge-window)
	(,(kbd "C-s-p") . shrink-window)
	(,(kbd "C-s-b") . shrink-window-horizontally)
	;(,(kbd "s-u") . split-window-vertically)
        (,(kbd "<XF86AudioRaiseVolume>") . raise-volume)
        (,(kbd "<XF86AudioLowerVolume>") . lower-volume)
	,@(mapcar (lambda (i)
                    `(,(kbd (format "s-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))

(global-set-key (kbd "s-SPC") 'mike/start-rofi)

(defun mike/exwm-move-window-to-workspace (workspace-number)
  (interactive)
  (let ((frame (exwm-workspace--workspace-from-frame-or-index workspace-number))
        (id (exwm--buffer->id (window-buffer))))
    (exwm-workspace-move-window frame id)))

(define-key global-map (kbd "s-!") (lambda () (interactive) (mike/exwm-move-window-to-workspace 1)))
(define-key global-map (kbd "s-\"") (lambda () (interactive) (mike/exwm-move-window-to-workspace 2)))
(define-key global-map (kbd "s-£") (lambda () (interactive) (mike/exwm-move-window-to-workspace 3)))
(define-key global-map (kbd "s-$") (lambda () (interactive) (mike/exwm-move-window-to-workspace 4)))
(define-key global-map (kbd "s-%") (lambda () (interactive) (mike/exwm-move-window-to-workspace 5)))
(define-key global-map (kbd "s-^") (lambda () (interactive) (mike/exwm-move-window-to-workspace 6)))
(define-key global-map (kbd "s-&") (lambda () (interactive) (mike/exwm-move-window-to-workspace 7)))
(define-key global-map (kbd "s-*") (lambda () (interactive) (mike/exwm-move-window-to-workspace 8)))
(define-key global-map (kbd "s-\(") (lambda () (interactive) (mike/exwm-move-window-to-workspace 9)))
(define-key global-map (kbd "s-\)") (lambda () (interactive) (mike/exwm-move-window-to-workspace 0)))

(exwm-enable)

(defun mike/edwina/exit-emacs ()
  "Close down but disable edwina mode first."
  (interactive)
  (edwina-mode 'toggle)
  (save-buffers-kill-terminal))

(use-package edwina
  :ensure t
  :config
  (setq display-buffer-base-action '(display-buffer-below-selected)))

;; For adding modes in the future; update next function
(defvar edwina-layouts '(edwina-stack-layout edwina-tall-layout))

(defun mike/edwina-switch-layout-mode ()
  (interactive)
  (if (equal edwina-layout 'edwina-stack-layout)
      (setq edwina-layout 'edwina-tall-layout)
    (setq edwina-layout 'edwina-stack-layout)))

(defun mike/edwina/setup ()
  (interactive)
  (edwina-setup-dwm-keys 'super)
  (edwina-mode 1)
  (define-key global-map (kbd "<M-SPC>") 'ivy-switch-buffer-other-window)
  (define-key global-map (kbd "<M-S-SPC>") 'ivy-switch-buffer)
  (global-set-key (kbd "s-y") 'edwina-zoom)
  (global-set-key (kbd "s-s") 'edwina-zoom)
  (global-set-key (kbd "s-e") 'edwina-mode)
  (global-set-key (kbd "s-q") 'edwina-delete-window)
  ;(define-key global-map (kbd "s-n") 'mike/edwina-switch-layout-mode)
  ;; Comment this line if not using Edwina
  (setq display-buffer-alist '((".*" display-buffer-below-selected))))

(mike/edwina/setup)

(setq exwm-workspace-index-map (lambda (i) (number-to-string (1+ i))))

;; Own code to manage layouts
(defun edwina-monocle-layout (panes)
  "Edwina layout that makes only one pane fill the entire frame."
  (let ((selected-pane (car panes)))
    (delete-other-windows)
    (edwina-restore-pane selected-pane)))

(defun edwina-cycle-layout ()
  "Cycle through different Edwina layouts."
  (interactive)
  (setq edwina-layout (cond ((eq edwina-layout 'edwina-tall-layout) 'edwina-stack-layout)
			    (t 'edwina-tall-layout)))
  (edwina-arrange))

(defun reset-edwina-nmaster ()
  "Reset the global variable `edwina-nmaster` to 1."
  (interactive)
  (setq edwina-nmaster 1)
  (message "`edwina-nmaster` has been reset to 1"))

(define-key global-map (kbd "s-[") 'edwina-cycle-layout)
(global-set-key (kbd "s-u") 'delete-other-windows)
(global-set-key (kbd "s-SPC") 'mike/start-rofi)
(define-key global-map (kbd "s-`") 'mike/exwm/toggle-input-line-mode)
(define-key org-mode-map (kbd "s-e") 'edwina-mode)
(define-key global-map (kbd "s-,") 'edwina-swap-next-window)
(define-key global-map (kbd "s-.") 'edwina-swap-previous-window)

; (all-the-icons-install-fonts)

(require 'all-the-icons-ibuffer)
(add-hook 'ibuffer-mode-hook #'all-the-icons-ibuffer-mode)

(add-hook 'dired-mode-hook #'all-the-icons-dired-mode)

(with-eval-after-load "dired"
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'yasnippet)
(yas-global-mode 1)
(add-to-list 'yas-snippet-dirs "~/Dropbox/Main_Config/yasnippets")
(yas-reload-all)

(global-set-key (kbd "C-s") 'swiper)
(global-set-key (kbd "C-r") 'swiper-isearch-backward)

(setq ispell-program-name "hunspell")
(setq ispell-local-dictionary "en_GB")

(setq org-bullets-bullet-list '("◉" "○" "✸" "✮" "▶"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq ivy-display-style 'fancy)

(setq ivy-use-virtual-buffers t
      ivy-count-format "%d/%d ")

(ivy-mode 1)

(global-set-key (kbd "M-x") '(lambda () (interactive) (counsel-M-x "")))

(recentf-mode 1)
(setq recentf-max-menu-items 100)
(setq recentf-max-saved-items 100)

(global-set-key (kbd "C-c r") 'counsel-recentf)

(setq company-idle-delay 0
      company-minimum-prefix-length 2
      company-show-numbers t
      company-tooltip-limit 10
      company-tooltip-align-annotations t
      company-tooltip-flip-when-above t)

(add-hook 'emacs-lisp-mode-hook 'company-mode)

(openwith-mode t)

;; Add to this list to ensure files are opened with correct programme
;; This seems to be the one that really determines it
(setq openwith-associations '(("\\.HEIC\\'" "viewnior" (file))		
			      ("\\.jpg\\'" "viewnior" (file))
			      ("\\.JPG\\'" "viewnior" (file))
			      ("\\.tif\\'" "viewnior" (file))))

(marginalia-mode)

(use-package pdf-tools
   :defer t
   :config
       (pdf-tools-install)
       (setq-default pdf-view-display-size 'fit-page)
   :bind (:map pdf-view-mode-map
         ("\\" . hydra-pdftools/body)
         ("spc" .  pdf-view-scroll-down-or-next-page)
         ("O"  . pdf/kill-link-to-current-page)
         ("g"  . pdf-view-first-page)
         ("G"  . pdf-view-last-page)
         ("l"  . image-forward-hscroll)
         ("c"  . pdf-view-center-in-window)
         ("h"  . pdf-view-previous-line-or-previous-page)
         ("j"  . pdf-view-next-line-or-next-page)
         ("k"  . pdf-view-previous-page)
         ("e"  . pdf-view-goto-page)
         ("u"  . pdf-view-revert-buffer)
         ("L" . pdf-annot-list-annotations)
         ("D" . pdf-annot-delete)
         ("A" . pdf-annot-attachment-dired)
         ("M" . pdf-annot-add-markup-annotation)
         ("T" . pdf-annot-add-text-annotation)
         ("y"  . pdf-view-kill-ring-save)
         ("s"  . pdf-occur)
         ("b"  . pdf-view-set-slice-from-bounding-box)
	 ("d" . pdf/send-current-page-to-db)
         ("r"  . pdf-view-reset-slice)))

(defun mike/pdf/kill-buffer-file-name ()
  (interactive)
  (kill-new (pdf-view-buffer-file-name)))

(define-key global-map (kbd "C-c k") 'mike/pdf/kill-buffer-file-name)

(defun mike/insert-pdf-tools-page-link ()
  (interactive)
  (let* ((available-pdfs (split-string (shell-command-to-string "find /home/michael/Dropbox/8_Essential_Texts -name \"*.pdf\"") "\n" t))
	 (pdf-filename (ivy-completing-read "Select the file: " available-pdfs))
	 (page-number (read-from-minibuffer "Enter the page number: "))
	 (description (read-from-minibuffer "Enter the description: ")))
    (insert (concat "[[pdf:" pdf-filename "::" page-number "][" description "]]"))))

(defun open-associated-pdf-with-pdf-tools ()
  "Open the PDF with the same base name as the current Org file using pdf-tools in Emacs."
  (interactive)
  (let* ((org-file (buffer-file-name))
         (pdf-file (concat (file-name-sans-extension org-file) ".pdf")))
    (if (file-exists-p pdf-file)
        (find-file pdf-file)
      (message "PDF file not found: %s" pdf-file))))

(global-set-key (kbd "M-s p") #'open-associated-pdf-with-pdf-tools)

(which-key-mode)

(define-key global-map (kbd "M-s e") 'embark-act)

(add-hook 'emacs-lisp-mode-hook #'rainbow-delimiters-mode)
(add-hook 'scheme-mode-hook #'rainbow-delimiters-mode)

(require 'bm)

;; Persistent bookmarks (optional, saves bookmarks between sessions)
(setq bm-restore-repository-on-load t)
(setq-default bm-buffer-persistence t)
(add-hook 'find-file-hooks 'bm-buffer-restore)
(add-hook 'kill-buffer-hook 'bm-buffer-save)
(add-hook 'kill-emacs-hook '(lambda nil
                              (bm-buffer-save-all)
                              (bm-repository-save)))

;(global-set-key (kbd "C-M-N") 'bm-next)
(global-set-key (kbd "C-n") 'bm-next)
(global-set-key (kbd "C-p") 'bm-previous)
(global-set-key (kbd "M-n") 'bm-toggle)
(global-set-key (kbd "C-M-n") 'bm-remove-all-current-buffer)

(setq org-agenda-files '("/home/michael/Dropbox/Main_Work/Org_Files/1_Appointments.org" "/home/michael/Dropbox/Main_Work/Org_Files/2_Todo_Notes.org"))

(setq org-noter-auto-save-last-location t)
(setq org-confirm-elisp-link-function nil)
(setq org-startup-folded t)
(setq org-agenda-span 28)
(setq org-src-preserve-indentation t)
(setq org-confirm-babel-evaluate nil)
(setq org-agenda-window-setup 'only-window)
(setq org-src-fontify-natively t)

;(setq org-startup-with-inline-images t)

(defun mike/delete-sentence ()
  (interactive)
  (zap-to-char 1 ?.))

(defun xmm ()
  (interactive)
  (shell-command "setxkbmap -layout gb")
  (shell-command "xmodmap /home/michael/modmap"))

(defun semt ()
  "Switch off auto-caps and abbrev mode."
  (interactive)
  (activate-input-method "iast-postfix")
  (if (equal mike/sanskrit/sanskrit-entry nil)
      (progn
	(turn-off-auto-capitalize-mode)
	(abbrev-mode -1)
	(setq mike/sanskrit/sanskrit-entry t)
	(message "Sanskrit entry enabled!"))
    (progn
      (turn-on-auto-capitalize-mode)
      (abbrev-mode 1)
      (setq mike/sanskrit/sanskrit-entry nil)
      (message "Sanskrit entry disabled!"))))

(defun mike/open-connect ()
  (interactive)
  (shell)
  (insert "sudo openconnect webvpn.oeaw.ac.at -u mwilliams"))

(defun reload-current-buffer ()
  "Reload the current buffer from its file."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(define-key global-map (kbd "M-s r") 'reload-current-buffer)

(setq org-capture-templates
      '(("t" "Todo" entry
         (file+headline "/home/michael/Dropbox/Main_Work/Org_Files/2_Todo_Notes.org" "Tasks")
         "* TODO %?\n  %i\n  %a")
        
	("a" "Appointment" entry
	 (file "/home/michael/Dropbox/Main_Work/Org_Files/1_Appointments.org")
	 "* %?\n")
        
        ("p" "Prosopography Entry" entry
         (file "/home/michael/Dropbox/Main_Work/Data_Files/Main_Notes/Prosopography.org")
         "* %?\n\n:PROPERTIES:\n:FLOURISHED: \n:BIRTH: \n:DEATH: \n:LOCATION: \n:TEACHER: \n:STUDENT: \n:TEXT: \n:END:\n\n"
         :empty-lines 1)))

(define-key global-map (kbd "C-c l") 'org-store-link)

(add-hook 'org-mode-hook (lambda () (setq electric-indent-mode nil)))
(add-hook 'org-mode-hook 'electric-quote-mode)
(add-hook 'org-mode-hook (lambda () (setq electric-indent-mode nil)))
(add-hook 'org-mode-hook 'toggle-truncate-lines)

(defun mike/org/insert-new-footnote ()
  (interactive)
  (let ((title (read-from-minibuffer "Enter the title: ")))
    (insert (concat "[fn:" title (number-to-string (random 100)) "]"))))

(defun org/insert-comment-block ()
  (interactive)
  (insert "#+begin_comment

#+end_comment")
  (backward-char 14))

(define-key global-map (kbd "C-c C-<return>") 'org/insert-comment-block)

(defun my/delete-footnote-at-point ()
  "Delete the Org footnote at point using the built-in function."
  (interactive)
  (org-footnote-delete))

(define-key global-map (kbd "M-s d") 'my/delete-footnote-at-point)

(defun mike/org-open-related-pdf ()
  "Open the PDF file with the same name as the current Org file."
  (interactive)
  (let* ((org-file (buffer-file-name))
         (pdf-file (concat (file-name-sans-extension org-file) ".pdf")))
    (if (file-exists-p pdf-file)
        (org-open-file pdf-file)
      (message "PDF file not found: %s" pdf-file))))

(define-key global-map (kbd "C-c C-x O") 'mike/org-open-related-pdf)

(defun wrap-with-san-en ()
  "Wrap the word at point or the active region with \"\\san \" and \" \\en\".
If there is no word at point, insert the wrappers and place point between them."
  (interactive)
  (let ((start-delim "\\san ")
        (end-delim " \\en"))
    (cond
     ;; Case 1: active region
     ((use-region-p)
      (let ((start (region-beginning))
            (end (region-end)))
        (save-excursion
          (goto-char start)
          (insert start-delim)
          (goto-char (+ end (length start-delim)))
          (insert end-delim))))
     
     ;; Case 2: word at point
     ((thing-at-point 'word t)
      (save-excursion
        (beginning-of-thing 'word)
        (insert start-delim))
      (end-of-thing 'word)
      (insert end-delim))
     
     ;; Case 3: nothing at point
     (t
      (insert start-delim end-delim)
      (backward-char (length end-delim))))))

(define-key global-map (kbd "C-c b") 'wrap-with-san-en)

(define-key global-map (kbd "C-c C-x w") 'org-copy-subtree)
(define-key global-map (kbd "C-c 8") 'org-agenda)
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-M-'") 'org-capture)

(define-key global-map (kbd "M-s f") 'mike/org/insert-new-footnote)
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "s-z") 'mike/switch-itrans-hk)

(setq org-roam-v2-ack t)

(setq org-roam-directory (file-truename "/home/michael/Dropbox/Main_Work/Org_Roam_Notes"))

(org-roam-db-autosync-mode)

(setq org-default-notes-file "/home/michael/Dropbox/3_Emacs/1_Org_Files/2_Todo_Notes.org")

(define-key global-map (kbd "M-i") 'org-roam-node-insert)
(define-key global-map (kbd "M-o") 'org-roam-node-find)

(setq bookmark-default-file "~/Dropbox/Main_Config/bookmarks.el")
(setq bookmark-save-flag 1)
(setq bookmark-use-annotations t)

(define-key global-map (kbd "C-x p") (lambda () (interactive) (other-window -1)))
(define-key global-map (kbd "C-=") 'er/expand-region)
(define-key global-map (kbd "C-;") 'repeat)
(define-key global-map (kbd "s-l") '(lambda () (interactive) (enlarge-window-horizontally 12)))
(define-key global-map (kbd "s-h") '(lambda () (interactive) (shrink-window-horizontally 12)))
(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "C-M-d") 'mike/delete-sentence)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(define-key global-map (kbd "C-c C-x '") 'deadgrep)
(define-key global-map (kbd "s-t") 'shell)
(define-key global-map (kbd "M-s n") '(lambda () (interactive) (find-file "/home/michael/Dropbox/Main_Config/Main_Emacs/nyaya-emacs.org")))
(define-key global-map (kbd "C-M-s") 'isearch-forward)
(define-key global-map (kbd "M-q") 'mike/switch-itrans-hk)

(define-key global-map (kbd "C-<f5>") '(lambda () (interactive) (find-file "~/Dropbox/Main_Work/Projects")))
(define-key global-map (kbd "<f5>") '(lambda () (interactive) (find-file "~/Dropbox/Main_Work/Projects")))
(define-key global-map (kbd "C-<f6>") '(lambda () (interactive) (find-file "/home/michael/Dropbox/1_Work/0_Corpus")))
(define-key global-map (kbd "<f6>") '(lambda () (interactive) (find-file "/home/michael/Dropbox/1_Work/0_Corpus")))

(defun apple-keyboard ()
  (interactive)
  (call-process-shell-command "setxkbmap -option altwin:swap_lalt_lwin")
  (xmm)
  (call-process-shell-command "xmodmap -e \"keysym Tab = Super_L\"" nil 0))

(defun mike/open-dired (&optional arg)
  (interactive "P")
  (let ((dir (if (buffer-file-name)
                 (file-name-directory (buffer-file-name))
               "/home/michael/Dropbox/Main_Work")))
    (if arg
        ;; C-u was used, so open dired as the only window
        (progn
          (dired dir)
          (delete-other-windows))
      ;; C-u was not used, open dired in the current window layout
      (dired dir))))

(define-key global-map (kbd "C-M-;") 'mike/open-dired)
;(dired (file-name-directory (buffer-file-name)))

(add-hook 'c-mode-hook #'electric-pair-local-mode)
(add-hook 'c-mode-hook #'electric-indent-local-mode)

(load-theme 'spacemacs-dark t)

(defun adjust-window-size (delta)
  "Adjust window size intelligently based on position.
If the window is on the left, increase width by DELTA.
If the window is on the right, decrease width by DELTA."
  (let ((edge (window-edges)))
    (if (= (car edge) 0)
        (enlarge-window-horizontally delta)
      (enlarge-window-horizontally (- delta)))))

(global-set-key (kbd "s-l") (lambda () (interactive) (adjust-window-size 16)))
(global-set-key (kbd "s-h") (lambda () (interactive) (adjust-window-size -16)))

(defun swap-windows ()
  "Swap the contents of the two windows."
  (interactive)
  (let ((buffer1 (window-buffer (selected-window)))
        (buffer2 (window-buffer (next-window))))
    (set-window-buffer (selected-window) buffer2)
    (set-window-buffer (next-window) buffer1)))
  
(global-set-key (kbd "C-x y") 'swap-windows)

(defhydra hydra-org-roam ()
  "Sanskrit Hydra"
  ("f" (mike/search-all-dropbox-files) "search-dropbox")
  ("e" (dired "/home/michael/Dropbox/8_Essential_Texts") "essential texts")
  ("m" (dired "/home/michael/Dropbox/0_Storage/Manuscripts Nov") "manuscripts")
  ("s" (search-sastra-corpus) "search sastra corpus")
  ("p" (call-interactively 'mike/show-all-pdfs) "search through all academic pdfs")
  ("P" (pdf/select-pdf-mark-from-db) "select a pdf bookmark")
  ("w" (call-interactively 'mike/checkout-sanskrit-dictionary) "search for word in dictionaries")
  ("S" (search-corpus) "search corpus")
  ("T" (find-file "~/Dropbox/Main_Work/Data_Files/Org_Latex_Templates/") "Insert Org Mode Template")
  ("c" (call-interactively 'crossref-lookup) "crossref add bibtex")
  ("o" (call-interactively 'org-roam-node-find) "find node")
  ("d" (call-interactively 'mike/org-document-setup) "org document setup")
  ("t" (find-file "/home/michael/Dropbox/3_Emacs/1_Org_Files/Texts.org") "search texts")
  ("r" (helm-org-rifle-org-directory) "org rifle")
  ("b" (call-interactively 'doi-add-bibtex-entry) "bibtex by doi")
  ("v" (search-all-work-files) "search work directory"))

(defhydra hydra-notes ()
  "Sanskrit Hydra"
  ("a" (find-file "/home/michael/Dropbox/Main_Work/Data_Files/Main_Notes") "Open Notes Folder")
  ("l" (find-file "/home/michael/Dropbox/Main_Work/Data_Files/Main_Notes/Latex_Snippets.org") "Latex Snippets")
  ("o" (find-file "/home/michael/Dropbox/Main_Work/Data_Files/Main_Notes/Org_Snippets.org") "Latex Snippets")
  ("b" (find-file "/home/michael/Dropbox/Main_Work/Data_Files/Main_Notes/Sanskrit_Bibliography.org") "Sanskrit Bibliography")
  ("p" (find-file "/home/michael/Dropbox/Main_Work/Data_Files/Databases/Prosopography.org") "Prosopography")
  ("s" (mike/ivy-find-org-file-in-directory main-notes-directory) "Search Notes"))

;; Bindings
(define-key global-map (kbd "s-o") 'hydra-notes/body)
(define-key global-map (kbd "s-p") 'hydra-org-roam/body)

(defvar translation-directory "/home/michael/Dropbox/Main_Work/Data_Files/Translations")
(defvar pdf-notes-directory "/home/michael/Dropbox/Main_Work/Data_Files/PDF_Notes")
(defvar main-notes-directory "/home/michael/Dropbox/Main_Work/Data_Files/Main_Notes")

(defun mike/ivy-find-org-file-in-directory (directory)
  "Open a .org file in DIRECTORY and its subdirectories using ivy. Finds only .org files and filters out auto backups marked with .#."
  (interactive "DDirectory: ")
  (let ((org-files (seq-filter
                    (lambda (file)
                      (and (string-match-p "\\.org$" file)
                           (not (string-match-p "/\\.#" file))))
                    (directory-files-recursively directory "\\.org$"))))
    (ivy-read "Find file: " org-files
              :action #'find-file)))

(define-key global-map (kbd "M-s C-p") (lambda () (interactive) (mike/ivy-find-org-file-in-directory pdf-notes-directory)))
(define-key global-map (kbd "M-s C-n") (lambda () (interactive) (mike/ivy-find-org-file-in-directory main-notes-directory)))

(use-package org-pdftools
  :hook (org-mode . org-pdftools-setup-link))

(require 'org-pdftools)
(require 'org-noter)

(defun mike/show-all-pdfs ()
  (interactive)
  (let* ((cands (split-string (shell-command-to-string "find /home/michael/Dropbox/8_Essential_Texts -name \"*.pdf\"") "\n" t)))
    (setq file-to-open (ivy-completing-read "Select the file: " cands))
    (find-file file-to-open)))

(defun pdf/kill-link-to-current-page ()
  "Kill an org link to the current page in pdf-view mode. (MW)"
  (interactive)
  (if (buffer-local-value 'major-mode (current-buffer))
      (let ((current-page (number-to-string (pdf-view-current-page)))
	    (pdf-path (buffer-file-name))
	    (link-description (read-from-minibuffer "Enter the description: ")))
	(kill-new (concat "[[pdf:" pdf-path "::" current-page "][" link-description "]]")))
    (message "Error! You’re not in a pdf buffer!")))

(defun pdf/get-text-whole-page ()
  "Kill the text of the entire current page in pdf-view-mode. (MW)"
  (interactive)
  (pdf-view-mark-whole-page)
  (pdf-view-kill-ring-save)
  (message "Text copied!"))

(defun mike/insert-pdf-page-link ()
  (interactive)
  (let* ((available-pdfs (split-string (shell-command-to-string "find /home/michael/Dropbox/8_Essential_Texts -name \"*.pdf\"") "\n" t)))
    (setq pdf-filename (ivy-completing-read "Select the file: " available-pdfs))
    (setq page-number (read-from-minibuffer "Enter the page number: "))
    (insert (concat "[[elisp:(async-shell-command \"okular -p " page-number " " pdf-filename "\")][PDF p. " page-number "]]"))
    (setq pdf-link (concat "[[elisp:(async-shell-command \"okular -p " page-number " " pdf-filename "\")][PDF p. " page-number "]]"))
    (setq label-of-link (read-from-minibuffer "Enter a label for the link: "))
    (find-file "/home/michael/Dropbox/1_Work/0_1_Vienna Work/6_Databases/7_Text_Links.org")
    (end-of-buffer)
    (if (not (string= label-of-link ""))
	(insert (concat "\n\n* " label-of-link "\n\n" pdf-link)))
    (save-buffer)
    (kill-buffer)))

(define-key global-map (kbd "C-M-]") 'mike/insert-pdf-tools-page-link)

(defun pdf/open-current-pdf-in-okular ()
  (interactive)
  ;; You need to ensure that this can handle filenames with spaces
  (let ((to-open (buffer-file-name))
	(page-number (number-to-string (pdf-view-current-page))))
    (async-shell-command (concat "okular -p " page-number " " to-open))))

(define-key global-map (kbd "C-c c") 'pdf/open-current-pdf-in-okular)

(add-hook 'emacs-lisp-mode-hook #'electric-indent-mode)

(setq reftex-default-bibliography '("/home/michael/Dropbox/Main_Work/Projects/1_MASTER.bib"))

(setq bibtex-completion-bibliography '("/home/michael/Dropbox/Main_Work/Projects/1_MASTER.bib")
	bibtex-completion-library-path '("~/Dropbox/emacs/bibliography/bibtex-pdfs/")
	bibtex-completion-notes-path "~/Dropbox/emacs/bibliography/notes/"
	bibtex-completion-notes-template-multiple-files "* ${author-or-editor}, ${title}, ${journal}, (${year}) :${=type=}: \n\nSee [[cite:&${=key=}]]\n"

	bibtex-completion-additional-search-fields '(keywords)
	bibtex-completion-display-formats
	'((article       . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${journal:40}")
	  (inbook        . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} Chapter ${chapter:32}")
	  (incollection  . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (inproceedings . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*} ${booktitle:40}")
	  (t             . "${=has-pdf=:1}${=has-note=:1} ${year:4} ${author:36} ${title:*}"))
	bibtex-completion-pdf-open-function
	(lambda (fpath)
	  (call-process "open" nil 0 nil fpath)))

(global-set-key (kbd "C-M-=") 'org-ref-insert-link)
(global-set-key (kbd "C-M-#") 'org-footnote-action)
;(global-set-key (kbd "C-z") 'undo)

(setq reftex-default-bibliography '("/home/michael/Dropbox/Main_Work/Projects/1_MASTER.bib"))
(setq org-cite-global-bibliography '("/home/michael/Dropbox/Main_Work/Projects/1_MASTER.bib"))

(defun mike/org/insert-citation ()
  "Insert a citation with page numbers. Uses org-ref-read-key."
  (interactive)
  (insert (concat "[[citet:" (org-ref-read-key) "][" (read-from-minibuffer "Enter page numbers: ") "]]")))

(defun mike/org/insert-latex-citation ()
  (interactive)
  (let ((citation-type (ivy-completing-read "Choose citation type: " '("t" "p") nil t)))
    (insert (concat "\\cite"
		    citation-type
                    "["
		    (read-from-minibuffer "Enter the page number(s): ")
		    "]{"
		    (org-ref-read-key)
		    "}"))))

(define-key global-map (kbd "C-c SPC") 'mike/org/insert-citation)
(define-key global-map (kbd "C-c C-x SPC") 'mike/org/insert-latex-citation)

(defun biblify ()
  "Inserts the code necessary for org-reg."
  (interactive)
  (insert "* Bibliography

\\bibliography{/home/michael/Dropbox/Main_Work/Projects/1_MASTER}
\\bibliographystyle{plainnat}"))

(add-hook 'org-mode-hook 'abbrev-mode)
(setq abbrev-file-name "~/Dropbox/3_Emacs/Common/.abbrev_defs")
(load "~/Dropbox/3_Emacs/Common/.abbrev_defs")

(defun highlight-word-with-delimiters (delimiter)
  "Highlight the word at point or the selected region with the given DELIMITER.
If there is no word at point, insert DELIMITER twice at point.
If a word exists at point, wrap it with DELIMITERs.
If the region is active, wrap the region with DELIMITERs."
  (interactive "cDelimiter (e.g. / or *): ")
  (let ((delim (char-to-string delimiter)))
    (if (use-region-p)
        (let ((start (region-beginning))
              (end (region-end)))
          (save-excursion
            (goto-char start)
            (insert delim)
            (goto-char (+ end 1))
            (insert delim)))
      (let ((word (thing-at-point 'word t)))
        (if word
            (progn
              (save-excursion
                (beginning-of-thing 'word)
                (insert delim))
              (end-of-thing 'word)
              (insert delim))
          (progn
            (insert delim delim)
            (backward-char)))))))

(defun highlight-with-slashes ()
  "Highlight using slashes (//)."
  (interactive)
  (highlight-word-with-delimiters ?/))

(defun highlight-with-stars ()
  "Highlight using asterisks (**)."
  (interactive)
  (highlight-word-with-delimiters ?*))

;; Keybindings
(define-key global-map (kbd "M-b") 'highlight-with-slashes)
(define-key global-map (kbd "M-B") 'highlight-with-stars)

(setq org-agenda-files '("/home/michael/Dropbox/Main_Work/Org_Files/1_Appointments.org" "/home/michael/Dropbox/Main_Work/Org_Files/2_Todo_Notes.org"))

(defvar mike/emacs+-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map (kbd "C-j") 'next-line)
    (define-key map (kbd "C-k") 'previous-line)
    (define-key map (kbd "C-l") 'forward-char)
    (define-key map (kbd "C-h") 'backward-char)
    (define-key map (kbd "C-b") 'backward-word)    
    (define-key map (kbd "C-w") 'forward-word)
    (define-key map (kbd "C-q") 'kill-region)
    (define-key map (kbd "M-h") 'backward-sentence)
    (define-key map (kbd "M-l") 'forward-sentence)    
    (define-key map (kbd "C-o") 'kill-line)
    ;(define-key map (kbd "C-n") 'open-line)
    map)
  "my-keys-minor-mode keymap.")

(define-minor-mode mike/emacs+-mode
  "More eronomic movement for emacs."
  :init-value t
  :lighter "my-keys")

(define-key global-map (kbd "M-j") 'forward-paragraph)
(define-key global-map (kbd "M-k") 'backward-paragraph)

(setq browse-url-firefox-program "librewolf")

(global-set-key (kbd "C-x W") 'counsel-web-search)

(god-mode)

(setq default-input-method "iast-postfix")

;; Postfix to activate the default input method
(defun my-set-default-input-method ()
  "Activate the default input method."
  (activate-input-method default-input-method))

;; Add the function to the appropriate hooks
(add-hook 'after-init-hook 'my-set-default-input-method)
(add-hook 'emacs-startup-hook 'my-set-default-input-method)

(defun intra ()
  (interactive)
  (set-input-method "iast-postfix"))

(add-hook 'minibuffer-setup-hook 'intra)
;(add-hook 'minibuffer-setup-hook 'my-set-default-input-method)

;; Ensure the input method is activated in all buffers
(add-hook 'after-change-major-mode-hook 'my-set-default-input-method)

;; Optionally, activate input method in initial scratch buffer
(add-hook 'emacs-startup-hook
          (lambda () (with-current-buffer "*scratch*"
                       (my-set-default-input-method))))

; These functions ensure that any input method is disabled when god mode is activated
; It is restored afterwards

(defvar previous-input-method nil
  "Store the previous input method.")

; Chat GPT added the font-lock-flush
(defun restore-input-method ()
  "Restore the previous input method."
  (if previous-input-method
      (activate-input-method previous-input-method)
    (deactivate-input-method))
  ;; Refresh font-locking in Org mode buffers
  (when (derived-mode-p 'org-mode)
    (font-lock-flush)))

(add-hook 'god-mode-disabled-hook 'restore-input-method)
(define-key global-map (kbd "M-s u") (lambda () (interactive) (font-lock-flush)))
(define-key global-map (kbd "C-`") (lambda () (interactive) (font-lock-flush)))

(defun disable-input-method ()
  "Disable the current input method."
  (if current-input-method
      (progn
	(setq previous-input-method current-input-method)
	(deactivate-input-method))
    (setq previous-input-method nil)))

(add-hook 'god-mode-enabled-hook 'disable-input-method)
(define-key god-local-mode-map (kbd "h") 'backward-char)
;(add-hook 'god-mode-enabled-hook #'mike/emacs+-god-mode)

(defun my-god-mode-update-cursor ()
  (setq cursor-type (if (or god-local-mode buffer-read-only)
                        'box
                      'bar)))

(add-hook 'god-mode-enabled-hook #'my-god-mode-update-cursor)
(add-hook 'god-mode-disabled-hook #'my-god-mode-update-cursor)

(global-set-key (kbd "<escape>") #'god-local-mode)
(define-key god-local-mode-map (kbd "i") #'god-local-mode)


(defun mike/padded-insert ()
  (interactive)
  (split-line)
  (insert "\n")
  (god-local-mode 0))

;; Change the leader key for alt from g o S. Capital S still doesn’t work.
;; You can use this to change the alt-key
(setq god-mode-alist '((nil . "C-") ("s" . "M-") ("S" . "C-M-")))

; Otherwise C-h in god mode will open help!
(define-key god-local-mode-map (kbd "C-h") 'backward-char)

(define-key god-local-mode-map (kbd "C-S-E") 'mike/italicise-word)
(define-key god-local-mode-map (kbd "C-S-B") 'mike/boldify-word)

(define-key global-map (kbd "C-;") 'repeat)

(define-key global-map (kbd "M-s C-i") 'mike/search-important-files)
(define-key global-map (kbd "M-s C-d") 'mike/open-work-directory)

(define-key global-map (kbd "C-z") 'undo)
(define-key global-map (kbd "M-s C-w") 'save-buffer)

; Added to stop font formatting problems
; Test to see if they are efficient solutions
(add-hook 'input-method-activate-hook #'font-lock-flush)
(add-hook 'input-method-deactivate-hook #'font-lock-flush)

;(run-with-idle-timer 1 t #'font-lock-flush)

(defun my-font-lock-post-command ()
  "Ensure proper font-lock after command execution."
  (when (and (boundp 'current-input-method)
             current-input-method)
    (font-lock-flush)))

;(add-hook 'post-command-hook #'my-font-lock-post-command)

(defun setup-polybar ()
  (interactive)
  (call-process-shell-command "git clone --depth=1 https://github.com/adi1090x/polybar-themes.git /home/michael/polybar")
  (call-process-shell-command "chmod +x /home/michael/polybar/setup.sh")
  (message "Themes installed! Now run setup.sh from /home/michael/polybar"))

(defun start-polybar (current-theme)
  (call-process-shell-command (concat "exec /home/michael/.config/polybar/launch.sh --" current-theme)))

(start-polybar "blocks")

(defun mirror-laptop-and-hdmi ()
  "Mirror the laptop display (eDP-1) to the HDMI output (HDMI-2) using xrandr."
  (interactive)
  ;; Use xrandr to set HDMI-2 to the same resolution as eDP-1 and mirror it
  (let ((cmd "xrandr --output HDMI-2 --mode 1920x1080 --same-as eDP-1"))
    (shell-command cmd)
    (message "Mirroring eDP-1 to HDMI-2")))

(load "/home/michael/Dropbox/Main_Config/Main_Emacs/new_functions.el")

(switch-to-buffer "*scratch*")
;(my-enable-input-method)
(set-cursor-color "deep sky blue")

(call-process-shell-command "feh --bg-scale /home/michael/Dropbox/Wallpapers/canyon3.jpg")

(call-process-shell-command "dropbox start" nil 0)

(defun mike/strip-newlines ()
  "Strip all newlines from within selected region."
  (interactive)
  (if (region-active-p)
      (save-excursion
	(save-restriction
	  (narrow-to-region (region-beginning) (region-end))
	  (goto-char (point-min))
	  (while (re-search-forward "\n" nil t)
	    (replace-match " "))))))

(define-key global-map (kbd "C-c C-x l") 'mike/strip-newlines)
