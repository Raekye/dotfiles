# Server Options

# https://github.com/tmux/tmux/wiki/FAQ#what-is-the-escape-time-option-is-zero-a-good-value
set -s escape-time 0

# https://github.com/tmux/tmux/wiki/FAQ#how-do-i-use-a-256-colour-terminal
# https://github.com/lifepillar/vim-solarized8/issues/109
set -s default-terminal "tmux-256color"

# https://github.com/tmux/tmux/wiki/FAQ#how-do-i-use-rgb-colour
set -s -a terminal-features ",xterm-256color:RGB"

# (Global) Session Options
set -g history-limit 10000
set -g status-keys vi

# (Global) Window Options
set -g mode-keys vi
set -g window-size smallest

unbind-key j
unbind-key k
unbind-key h
unbind-key l
bind-key j select-pane -D
bind-key k select-pane -U
bind-key h select-pane -L
bind-key l select-pane -R
