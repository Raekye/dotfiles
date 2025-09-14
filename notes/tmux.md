## tmux
- <https://man.openbsd.org/OpenBSD-current/man1/tmux.1>
- <https://github.com/tmux/tmux/wiki>
- `man 1 tmux`

## Options
From <https://man.openbsd.org/OpenBSD-current/man1/tmux.1#OPTIONS>.

- `-s` specifies a global server option.
- `-w` specifies a window option.
- `-p` specifies a pane option.
- Session options are the default (do not require a flag).
- `-g` specifies a global session or window option (panes inherit from windows).
- `-u` unsets an option.

### Arrays
From <https://github.com/tmux/tmux/wiki/Advanced-Use#array-options>.

- Indices are specified with square brackets (e.g. `update-environment[999]`).
- Arrays are associative; indices may have gaps.
- `-a` appends to an array option using the next free index.
	- For backwards compatibility, multiple comma-separated entries can be appended with a leading comma.
- `-u` with an index removes that entry.
- `-u` without an index restores the entire array to its default.
