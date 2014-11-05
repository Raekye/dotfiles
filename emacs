(require 'whitespace)
(autoload 'global-whitespace-mode "whitespace" "Toggle global whitespace visualization." t)

(global-whitespace-mode t)
(require 'linum)
(global-linum-mode t)
(setq auto-save-default nil)

(require 'package)
(push '("marmalade" . "http://marmalade-repo.org/packages/") package-archives)
(push '("melpa" . "http://melpa.milkbox.net/packages/") package-archives)

(package-initialize)

(require 'evil)
(evil-mode 1)
