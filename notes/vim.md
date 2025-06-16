## Vim
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
