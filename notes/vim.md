## Vim
Hmmm...

### Vim Help/Manual
- To find documentation for a `set`able option `option` (e.g. `tabstop`), search for `'option'` (e.g. `help 'tabstop'`).

### Indentation (`tabstop` vs. `softtabstop` vs. `shiftwidth`)
- `help usr_30.txt` (section 30.5).
- `tabstop` (default `8`): Visual width of a "tab stop" (in columns).
	- A horizontal tab character (ASCII 9) always advances the cursor to the next tab stop.
	- If `expandtab`, then in Insert mode, the <kbd>Tab</kbd> key inserts spaces to the next tab stop.
- `softtabstop` (default `0`): Visual width of a "soft tab stop" (in columns).
	- In Insert mode, the <kbd>Tab</kbd> key always advances the cursor to the next soft tab stop,
		potentially using spaces, even if `noexpandtab`.
	- A value of `0` disables soft tab stops.
	- A negative value makes Vim use the current `shiftwidth` value.
- `shiftwidth` (default `8`): Width in columns of one level of (auto)indentation.
	- A value of `0` makes Vim use the current `tabstop` value.
- `expandtab` (default `noexpandtab`): In Insert mode, the <kbd>Tab</kbd> key inserts the corresponding number of spaces.
	- A tab character can still be inserted (in Insert mode) with <kbd>Control + v</kbd>, <kbd>Tab</kbd>.

The following table shows the result of entering <kbd>Tab</kbd> (in Insert mode) or indenting (e.g. with `>>`) given various inputs and configurations;
the cursor is always at the end of the line/text.
Note that indenting an empty line is always a no-op.
A space is denoted with a dash (`-`) and a tab is denoted with digits counting its width, e.g. `1234` for a 4-column tab;
commas (`,`) in the table are just for readability.
The table is shown for `noexpandtab`; for `expandtab`, simply replace the digits (tabs) with dots (spaces).

| Configuration         | Text        | Result entering <kbd>Tab</kbd> | Result indenting (e.g. `>>`) |
======================================================================================================|
| `set ts=8 sts=0 sw=8` |             | 12345678                       |                              |
| `set ts=8 sts=0 sw=8` | --          | --123456                       | 12345678,--                  |
| `set ts=8 sts=0 sw=8` | 12345678    | 12345678,12345678              | 12345678,12345678            |
| `set ts=8 sts=4 sw=8` |             | ----                           |                              |
| `set ts=8 sts=4 sw=8` | --          | ----                           | 12345678,--                  |
| `set ts=8 sts=4 sw=8` | 12345678    | 12345678,----                  | 12345678,12345678            |
| `set ts=8 sts=4 sw=4` |             | ----                           |                              |
| `set ts=8 sts=4 sw=4` | --          | ----                           | ------                       |
| `set ts=8 sts=4 sw=4` | 12345678    | 12345678,----                  | 12345678,----                |
| `set ts=4 sts=4 sw=4` |             | 1234                           |                              |
| `set ts=4 sts=4 sw=4` | --          | 1234                           | 1234--                       |
| `set ts=4 sts=4 sw=4` | 1234        | 1234,1234                      | 1234,1234                    |
| `set ts=8 sts=0 sw=6` |             | 12345678                       |                              |
| `set ts=8 sts=0 sw=6` | -           | -1234567                       | -------                      |
| `set ts=8 sts=0 sw=6` | --          | --123456                       | 12345678                     |
| `set ts=8 sts=0 sw=6` | ---         | ---12345                       | 12345678-                    |
| `set ts=8 sts=0 sw=6` | 12345678    | 12345678,12345678              | 12345678,------              |
| `set ts=8 sts=4 sw=6` |             | ----                           |                              |
| `set ts=8 sts=4 sw=6` | -           | ----                           | -------                      |
| `set ts=8 sts=4 sw=6` | --          | ----                           | 12345678                     |
| `set ts=8 sts=4 sw=6` | ---         | ----                           | 12345678-                    |
| `set ts=8 sts=4 sw=6` | 12345678    | 12345678,----                  | 12345678,------              |

### Fugitive
#### `:G`/`:Git`
Source: [vim doc][vim-fugitive-manual].

- `s`/`u`/`-`: stage (add)/unstage (reset)/toggle staging for the file or hunk under the cursor.
- `>`/`<`/`=`: opens/closes/toggles the inline diff for a file.

#### `:Gdiff`
Source: [Fugitive.vim - working with the git index][vim-fugitive-git-index].

`:Gdiff` opens a vertical split with the index on the left, and the working copy on the right.
So running `:diffput` on a hunk on the working copy stages it.

Note: `dp` and `do` (for `:diffput` and `:diffget` respectively) only work in normal mode;
the command versions must be used in visual mode.
Source: [vim doc][vim-diff].

### gitgutter
Source: [readme][vim-gitgutter-readme].

- `[c`/`]c`: jump to previous/next hunk.
- `<leader>hs`/`<leader>hu`: stage/undo hunk (cannot unstage staged hunk).

[vim-fugitive-manual]: https://github.com/tpope/vim-fugitive/blob/master/doc/fugitive.txt
[vim-fugitive-git-index]: http://vimcasts.org/episodes/fugitive-vim-working-with-the-git-index/
[vim-diff]: https://vimhelp.org/diff.txt.html

[vim-gitgutter-readme]: https://github.com/airblade/vim-gitgutter#getting-started

### Mapping the Escape Key
- Vim's termresponse feature and how it interacts with mapping the escape key:
	- https://stackoverflow.com/a/15015109
	- https://vi.stackexchange.com/a/2620
	- https://vi.stackexchange.com/a/19073

For me, mapping `<Esc>` seems fine in vim 9.
However, on vim 8, I need to set `noesckeys`.

#### Terminal Escape Codes
- https://notes.burke.libbey.me/ansi-escape-codes/
- https://www.man7.org/linux/man-pages/man4/console_codes.4.html
- https://espterm.github.io/docs/VT100%20escape%20codes.html
- https://www.xfree86.org/current/ctlseqs.html

### Other
- https://vim.fandom.com/wiki/Unused_keys
