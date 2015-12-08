(require 'whitespace)
(autoload 'global-whitespace-mode "whitespace" "Toggle global whitespace visualization." t)

;(global-whitespace-mode t)

(require 'linum)
(global-linum-mode t)

(setq vc-follow-symlinks nil)

(setq auto-save-default nil)

;(global-font-lock-mode 1)

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)

(package-initialize)

(require 'evil)
(evil-mode 1)

(require 'helm-config)
(helm-mode 1)
(helm-autoresize-mode 1)

(global-set-key (kbd "C-x C-f") 'projectile-find-file)
(global-set-key (kbd "C-x C-m") 'helm-M-x)

(require 'projectile)
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-require-project-root nil)
(require 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/emacs-color-theme-solarized")
(setq solarized-termcolors 256)
(load-theme 'solarized t)
