# Server Options
set -s default-terminal "screen-256color"
set -s escape-time 0

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
