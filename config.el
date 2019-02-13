;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

;; Refresh files after edits - ~/.emacs.d/bin/doom refresh

;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(menu-bar-mode 1)
(toggle-scroll-bar -1)
(setq-default major-mode 'text-mode)
(setq evil-disable-insert-state-bindings t)
;(require 'evil)

;x (require 'doom-modeline)
;x (doom-modeline-mode 1)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(set-frame-parameter nil 'fullscreen 'fullboth)

;x (projectile-add-known-project "~/Documents/Working_Directory/Specification-Curve")
;x (provide 'config)\n;;; config.el ends here










;; Doom Modeline
;; How tall the mode-line should be (only respected in GUI Emacs).
(setq doom-modeline-height 90) ;D

;; How wide the mode-line bar should be (only respected in GUI Emacs).
(setq doom-modeline-bar-width 16) ;D

;; Determines the style used by `doom-modeline-buffer-file-name'.
;;
;; Given ~/Projects/FOSS/emacs/lisp/comint.el
;;   truncate-upto-project => ~/P/F/emacs/lisp/comint.el
;;   truncate-from-project => ~/Projects/FOSS/emacs/l/comint.el
;;   truncate-with-project => emacs/l/comint.el
;;   truncate-except-project => ~/P/F/emacs/l/comint.el
;;   truncate-upto-root => ~/P/F/e/lisp/comint.el
;;   truncate-all => ~/P/F/e/l/comint.el
;;   relative-from-project => emacs/lisp/comint.el
;;   relative-to-project => lisp/comint.el
;;   file-name => comint.el
;;   buffer-name => comint.el<2> (uniquify buffer name)
;;
;; If you are expereicing the laggy issue, especially while editing remote files
;; with tramp, please try `file-name' style.
;; Please refer to https://github.com/bbatsov/projectile/issues/657.
(setq doom-modeline-buffer-file-name-style 'truncate-upto-project)

;; What executable of Python will be used (if nil nothing will be showed).
(setq doom-modeline-python-executable "python")

;; Whether show `all-the-icons' or not (if nil nothing will be showed).
(setq doom-modeline-icon t)

;; Whether show the icon for major mode. It respects `doom-modeline-icon'.
(setq doom-modeline-major-mode-icon t)

;; Display color icons for `major-mode'. It respects `all-the-icons-color-icons'.
(setq doom-modeline-major-mode-color-icon t) ;D

;; Whether display minor modes or not. Non-nil to display in mode-line.
(setq doom-modeline-minor-modes t) ;D

;; Whether display perspective name or not. Non-nil to display in mode-line.
(setq doom-modeline-persp-name t)

;; Whether display `lsp' state or not. Non-nil to display in mode-line.
(setq doom-modeline-lsp t)

;; Whether display github notifications or not. Requires `ghub` package.
(setq doom-modeline-github nil)

;; The interval of checking github.
(setq doom-modeline-github-interval (* 30 60))

;; Whether display environment version or not.
(setq doom-modeline-version t)

;; Whether display mu4e notifications or not. Requires `mu4e-alert' package.
(setq doom-modeline-mu4e t)

;+-------------------------------------+:
;|            ESS SETTINGS             |:
;+-------------------------------------+:

(setq ess-ask-for-ess-directory nil) ;if you don't want to be prompted each time you start an interactive R session

(define-key global-map [f1] 'Control-X-prefix)
(define-key global-map [f2] 'save-buffer)
(define-key global-map [f3] 'find-file)
(define-key global-map [f5] 'switch-to-buffer)
(define-key global-map [f6] 'other-window)
(define-key global-map [f8] 'kill-buffer)
(define-key global-map [f9] 'ess-load-file)
; Other specific ESS settings you can use are the following:

(setq comint-input-ring-size 1000) ; expands number of saved commands in history
(setq ess-indent-level 4) ;make tab 4 chars wide (default = 2)
(setq ess-arg-function-offset 4)
(setq ess-else-offset 4)

; For working with R process directly, the following shortcuts can be very useful:
(add-hook 'inferior-ess-mode-hook
    '(lambda nil
          (define-key inferior-ess-mode-map [\C-up]
              'comint-previous-matching-input-from-input)
          (define-key inferior-ess-mode-map [\C-down]
              'comint-next-matching-input-from-input)
          (define-key inferior-ess-mode-map [\C-x \t]
              'comint-dynamic-complete-filename)
     )
 )
; This recalls the R statement from your R statement history, but it tries to match it with the one which is already on your line. So, for example, typing pl in R process and pressing \C-up (that’s control and the up arrow) will cycle through all the statements which start with pl, so it will recall for example all the plot(... commands.

; Another setting which you might find useful is:

 (setq ess-ask-about-transfile t)
; This way ESS always asks where to save the text in the buffer with R process. You can number these files according to date, so you will always have another way to track what exactly you were doing. The only caveat of this option is that for some reason ESS sets the R buffer to read only, after loading the R. The shortcut for making buffer writable is C-x C-q.

; M-x global-set-key <RET> key cmd <RET>
; M-x ess-eval-line <RET> M-n <RET>
;(load! "remap")     ;; Org mode stuff like todos and rebindings

;SPC is leader
;SPC-m is localleader
;(map! :localleader
;    :desc "Line Eval" "l" #'ess-line-eval)

;(map! :map ess-mode-map
 ;     :leader
  ;      :desc "Evaluate Line" "l" #'ess-eval-line
        ;:desc "chunk" "x" #'ess-eval-chunk
        ;:desc "command" "d" #'ess-eval-line
        ;:desc "command" "f" #'ess-eval-line
   ;     :desc "command" "c" #'ess-eval-chunk))

; (map! :map ess-mode-map
    ;  :localleader
     ;  (:prefix "e"
      ;  :desc "Evaluate Line" "e" #'ess-eval-line
        ;:desc "chunk" "x" #'ess-eval-chunk
        ;:desc "command" "d" #'ess-eval-line
        ;:desc "command" "f" #'ess-eval-line
     ;   :desc "command" "c" #'ess-eval-chunk))

;(map! :map ess-mode-map
      ;:localleader
       ;(:prefix "e"
        ;:desc "Evaluate Line" "e" #'ess-eval-line
        ;:desc "chunk" "e" #'ess-eval-chunk
        ;:desc "command" "e" #'ess-eval-line
        ;:desc "command" "e" #'ess-eval-line
        ;:desc "command" "e" #'org-set-tags-command))
;
  ;(map! :map ess-mode-map
        ;:localleader
       ;(:prefix "e"
        ;:desc "Evaluate Line" "e" #'ess-eval-line
        ;:desc "chunk" "e" #'ess-eval-chunk
        ;:desc "command" "e" #'ess-eval-line
        ;:desc "command" "e" #'ess-eval-line
        ;:desc "command" "e" #'org-set-tags-command))
;
  ;(map! :map ess-mode-map
        ;:localleader
       ;(:prefix "e"
        ;:desc "Evaluate Line" "e" #'ess-eval-line
        ;:desc "chunk" "e" #'ess-eval-chunk
        ;:desc "command" "e" #'ess-eval-line
        ;:desc "command" "e" #'ess-eval-line
        ;:desc "command" "e" #'org-set-tags-command))

(map! :leader "e l" #'ess-eval-line)
; SPC-e-l

(map! :leader "e d" #'ess-eval-line-and-go)
; SPC-e-l

(map! :leader "e c" #'ess-eval-chunk)
; SPC-e-l

(map! :leader "e f" #'ess-eval-function)
; SPC-e-l

(map! :leader "e p" #'ess-eval-paragrgraph)
; SPC-e-l

(map! :leader "e c" #'ess-eval-chunk)
; SPC-e-l

(map! :leader "e c" #'ess-eval-chunk)
; SPC-e-l

(map! :localleader :map R-mode-map "e l" #'ess-eval-paragraph)
(map! :localleader :map r-mode-map "e l" #'ess-eval-paragraph)
(map! :localleader :map ESS-mode-map "e l" #'ess-eval-paragraph)
; SPC-m-e-l


;TheOneWhoSighsToday at 4:47 PM
;So if you wanted to use local leader instead of SPC-e.
;
;It would be
;(map! :localleader
    ;:desc "Line Eval" "l" #'ess-line-eval)
;That should work if my understanding is right.
;
;
;
;TheOneWhoSighsToday at 4:48 PM
;it uses SPC-m instead.
;cause that's what local leader is.
;Use :localleader for buffer/mode local keybinds (i.e. to be used with :map), and :leader for global ones.o
;
;HenrikToday at 4:49 PM
;Use :localleader for buffer/mode local keybinds (i.e. to be used with :map), and :leader for global ones.
;chris!Today at 4:49 PM
;:)
;so local leader is better for ESS?
;ESS, I'm sure you know is just an R REPL
;HenrikToday at 4:51 PM
;Yes, localleader is appropriate because you only want those keys to work in ESS and nowhere else, thus it is a mode-local keybind, not a global one
;chris!Today at 4:51 PM
;ahhhhh
;Then is there a way to tel it that I only want it to wwork with ESS?

;(map! :leader
;    "11" #'butterfly)
