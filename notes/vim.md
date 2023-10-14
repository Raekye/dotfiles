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
