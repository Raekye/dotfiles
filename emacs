(require 'whitespace)
(autoload 'global-whitespace-mode "whitespace" "Toggle global whitespace visualization." t)

(global-whitespace-mode t)
(global-linum-mode t)
(setq auto-save-default nil)