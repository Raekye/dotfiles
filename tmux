set -g mode-keys vi
set -g status-keys vi
set -g window-size smallest

set -s default-terminal "screen-256color"
set -s escape-time 0

unbind-key j
unbind-key k
unbind-key h
unbind-key l
bind-key j select-pane -D
bind-key k select-pane -U
bind-key h select-pane -L
bind-key l select-pane -R
