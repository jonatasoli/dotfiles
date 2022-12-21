;;; poetry-autoloads.el --- automatically extracted autoloads  -*- lexical-binding: t -*-
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "poetry" "poetry.el" (0 0 0 0))
;;; Generated autoloads from poetry.el
 (autoload 'poetry "poetry" nil t)

(autoload 'poetry-add-dep "poetry" "\
Add PACKAGE as a new dependency to the project.

PACKAGE can be a list of packages, separated by spaces.

\(fn PACKAGE)" t nil)

(autoload 'poetry-add-dev-dep "poetry" "\
Add PACKAGE as a new development dependency to the project.

PACKAGE can be a list of packages, separated by spaces.

\(fn PACKAGE)" t nil)

(autoload 'poetry-add-opt-dep "poetry" "\
Add PACKAGE as a new optional dependency to the project.

PACKAGE can be a list of packages, separated by spaces.

\(fn PACKAGE)" t nil)

(autoload 'poetry-remove "poetry" "\
Remove PACKAGE from the project dependencies.

TYPE is the type of dependency (dep, dev or opt).

\(fn PACKAGE TYPE)" t nil)

(autoload 'poetry-check "poetry" "\
Check the validity of the pyproject.toml file." t nil)

(autoload 'poetry-install-install "poetry" "\
Install the project dependencies." t nil)

(autoload 'poetry-lock "poetry" "\
Locks the project dependencies." t nil)

(autoload 'poetry-update "poetry" "\
Update dependencies as according to the pyproject.toml file." t nil)

(autoload 'poetry-show "poetry" "\
Show information about package PACKAGE.

\(fn PACKAGE)" t nil)

(autoload 'poetry-build "poetry" "\
Build a package, as a tarball and a wheel by default." t nil)

(autoload 'poetry-publish "poetry" "\
Publish the package to a remote repository.

REPO is the repository and USERNAME and PASSWORD the
credential to use.

\(fn REPO USERNAME PASSWORD)" t nil)

(autoload 'poetry-new "poetry" "\
Create a new Python project at PATH.

\(fn PATH)" t nil)

(autoload 'poetry-init "poetry" "\
Initialize a Poetry project in PATH.

\(fn &optional PATH)" t nil)

(autoload 'poetry-edit-pyproject-toml "poetry" "\
Open the current project 'pyproject.toml' file for edition." t nil)

(autoload 'poetry-run "poetry" "\
Run COMMAND in the appropriate environment.

\(fn COMMAND)" t nil)

(autoload 'poetry-shell "poetry" "\
Spawn a shell within the virtual environment." t nil)

(autoload 'poetry-self-update "poetry" "\
Update poetry to the latest version." t nil)

(autoload 'poetry-venv-workon "poetry" "\
Activate the virtualenv associated to the current poetry project." t nil)

(autoload 'poetry-venv-deactivate "poetry" "\
De-activate the virtualenv associated to the current poetry project." t nil)

(autoload 'poetry-venv-toggle "poetry" "\
Toggle the virtualenv associated to the current poetry project." t nil)

(defvar poetry-tracking-mode nil "\
Non-nil if Poetry-Tracking mode is enabled.
See the `poetry-tracking-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `poetry-tracking-mode'.")

(custom-autoload 'poetry-tracking-mode "poetry" nil)

(autoload 'poetry-tracking-mode "poetry" "\
Global minor mode to track the current poetry virtualenv.

This is a minor mode.  If called interactively, toggle the
`Poetry-Tracking mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='poetry-tracking-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

For every project, Poetry automatically creates a virtualenv and install the project dependencies in it.
This minor mode automatically activates the relevant Poetry virtualenv when visiting a project file.

It ensures that your python scripts are always executed in the right environment.

\(fn &optional ARG)" t nil)

(autoload 'poetry-find-project-root "poetry" "\
Return the poetry project root if any." nil nil)

(register-definition-prefixes "poetry" '("poetry-"))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; poetry-autoloads.el ends here
