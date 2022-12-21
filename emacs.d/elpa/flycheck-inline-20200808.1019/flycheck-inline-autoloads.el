;;; flycheck-inline-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "flycheck-inline" "flycheck-inline.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from flycheck-inline.el

(autoload 'flycheck-inline-mode "flycheck-inline" "\
A minor mode to show Flycheck error messages line.

When called interactively, toggle `flycheck-inline-mode'.  With
prefix ARG, enable `flycheck-inline-mode' if ARG is positive,
otherwise disable it.

When called from Lisp, enable `flycheck-inline-mode' if ARG is
omitted, nil or positive.  If ARG is `toggle', toggle
`flycheck-inline-mode'.  Otherwise behave as if called
interactively.

In `flycheck-inline-mode', show Flycheck error messages inline,
directly below the error reported location.

\(fn &optional ARG)" t nil)

(put 'global-flycheck-inline-mode 'globalized-minor-mode t)

(defvar global-flycheck-inline-mode nil "\
Non-nil if Global Flycheck-Inline mode is enabled.
See the `global-flycheck-inline-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `global-flycheck-inline-mode'.")

(custom-autoload 'global-flycheck-inline-mode "flycheck-inline" nil)

(autoload 'global-flycheck-inline-mode "flycheck-inline" "\
Toggle Flycheck-Inline mode in all buffers.
With prefix ARG, enable Global Flycheck-Inline mode if ARG is
positive; otherwise, disable it.

If called from Lisp, toggle the mode if ARG is `toggle'.
Enable the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

Flycheck-Inline mode is enabled in all buffers where
`turn-on-flycheck-inline' would do it.

See `flycheck-inline-mode' for more information on Flycheck-Inline
mode.

\(fn &optional ARG)" t nil)

(register-definition-prefixes "flycheck-inline" '("flycheck-inline-" "turn-on-flycheck-inline"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; flycheck-inline-autoloads.el ends here
