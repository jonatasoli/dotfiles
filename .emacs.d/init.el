; Remover boas vindas
(setq inhibit-startup-message t)

; Remover menus
(tool-bar-mode -1)
; (menu-bar-mode -1)

; Remover barra de rolagem
(scroll-bar-mode -1)

; Line number mode
(setq display-line-numbers-type 'relative
      display-line-numbers-width-start t)

(global-display-line-numbers-mode)

; Fonte
(set-face-attribute 'default nil :height 150)

; Pacotes
(require 'package)
(setq package-enable-at-startup nil) ; desabilitar inicio de ativacao

; Mepla - repositório
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/")
)

(package-initialize) ; inciar pacotes

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

; Theme
  (use-package gruvbox-theme
    :ensure t
    :config (load-theme 'gruvbox-dark-soft t))

;; Download Evil
(unless (package-installed-p 'evil)
  (package-install 'evil))

;; Enable Evil
(require 'evil)
(evil-mode 1)

; snippets from autocomplete
(use-package yasnippet
  :ensure t)

(yas-global-mode 1)

; company: autocomplete library
(use-package company
  :ensure t
  :config
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  (global-company-mode t))

(use-package spaceline
  :ensure t)

(use-package spaceline-config
  :config
  (spaceline-emacs-theme))

(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config (which-key-mode))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :config
  (progn
    (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
    )
  :bind (("C-\\". 'neotree-toggle));; atom key
  )

  (use-package ace-window
    :ensure t
    :bind (("C-x o". ace-window)))

;; ----------- Python config
(use-package poetry
  :ensure t
  :hook
  ;; activate poetry-tracking-mode when python-mode is active
  (python-mode . poetry-tracking-mode)
  )

;; ----------- Syntax checker

(use-package flycheck
  :ensure t
  :diminish flycheck-mode
  :init
   (setq flycheck-check-syntax-automatically '(save new-line)
        flycheck-idle-change-delay 5.0
        flycheck-display-errors-delay 0.9
        flycheck-highlighting-mode 'symbols
        flycheck-indication-mode 'left-fringe
        flycheck-standard-error-navigation t
        flycheck-deferred-syntax-check nil)
   :config
   ;; before install flake8 (pip install flake8)
   (setq flycheck-python-flake8-executable "~/.local/bin/flake8")
   ;; before install pylint (pip install pylint)
   ;; after install, create config file (pylint --generate-rcfile > ~/.pylintrc)
   (setq flycheck-python-pylint-executable "~/.local/bin/pylint")
   )

;; Spell
(setq
  ispell-program-name
  "/usr/bin/hunspell")
(require 'flyspell)
(add-hook 'text-mode-hook 'flyspell-mode)
(eval-after-load "flyspell"
  '(progn
     (define-key flyspell-mouse-map [down-mouse-3] #'flyspell-correct-word)
     (define-key flyspell-mouse-map [mouse-3] #'undefined)))

(use-package flycheck-inline
  :ensure t)

(with-eval-after-load 'flycheck
  (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))

;; ----------- LSP

(use-package lsp-pyright ;; Python LSP
  :ensure t
  :hook
  ((python-mode . (lambda ()
		    (require 'lsp-pyright)
                    (lsp-deferred)))
   (flycheck-mode . (lambda ()
		      ;; Next checker check the first lsp -> flake8 -> pylint
		      ;; Waring clause check the next only if dont have errors
		      ;; If lsp dont have errors, check flake8, if lsp and flake8 dont have any eror
		      ;; check using pylint.
                      (flycheck-add-next-checker 'lsp '(warning . python-flake8))
                      (flycheck-add-next-checker 'python-flake8 '(warning . python-pylint))
                      (message "Added flycheck checkers.")))))


(use-package lsp-ui
  :ensure t
  :hook (lsp-mode . lsp-ui-mode)
  :after lsp-mode
  :config
  (setq lsp-ui-doc-mode 1))

(require 'lsp-diagnostics)
(lsp-diagnostics-flycheck-enable)

;; ----------- Git config

;; Git extention
(use-package magit
  :ensure t)

;; Show diff inline
(use-package diff-hl
  :ensure t)

(add-hook 'prog-mode-hook 'turn-on-diff-hl-mode)
(add-hook 'vc-dir-mode-hook 'turn-on-diff-hl-mode)
  
 ; Shortcuts
 (global-set-key (kbd "C-<tab>") 'other-window)
 (global-set-key (kbd "M-<down>") 'enlarge-window)
 (global-set-key (kbd "M-<up>") 'shrink-window)
 (global-set-key (kbd "M-<left>") 'enlarge-window-horizontally)
  (global-set-key (kbd "M-<right>")    'shrink-window-horizontally)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(evil diff-hl magit yasnippet which-key use-package try spaceline poetry neotree lsp-ui lsp-pyright gruvbox-theme flycheck-inline company auto-complete all-the-icons ace-window)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
