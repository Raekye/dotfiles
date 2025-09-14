# - https://man.openbsd.org/OpenBSD-current/man1/tmux.1
# - https://github.com/tmux/tmux/wiki
# - `man 1 tmux`

## (Global) Server Options ("Available server options are:")
# https://github.com/tmux/tmux/wiki/FAQ#how-do-i-use-a-256-colour-terminal
# https://github.com/lifepillar/vim-solarized8/issues/109
set -s default-terminal "tmux-256color"

# https://github.com/tmux/tmux/wiki/FAQ#what-is-the-escape-time-option-is-zero-a-good-value
set -s escape-time 0

# https://github.com/tmux/tmux/wiki/FAQ#how-do-i-use-rgb-colour
set -s -a terminal-features "xterm-256color:RGB"

## (Global) Session Options
set -g history-limit 10000
set -g status-keys vi

## Check with `tmux show-option -g update-environment`.
set -g -u update-environment[3] # SSH_AUTH_SOCK
set-environment -g SSH_AUTH_SOCK ~/.ssh/ssh-agent.socket

## (Global) Window Options
set -g mode-keys vi
set -g window-size smallest

## Vim Bindings
unbind-key j
unbind-key k
unbind-key h
unbind-key l
bind-key j select-pane -D
bind-key k select-pane -U
bind-key h select-pane -L
bind-key l select-pane -R
