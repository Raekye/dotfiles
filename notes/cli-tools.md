## Miscellaneous CLI Tools
### GNU Coreutils
- https://www.gnu.org/software/coreutils/manual/html_node/index.html

#### `head` and `tail`
- https://www.gnu.org/software/coreutils/manual/html_node/head-invocation.html
- https://www.gnu.org/software/coreutils/manual/html_node/tail-invocation.html

### `rsync`
Flags I usually want to "push" from the source to the destination: `--recursive --times --compress --partial --info=progress2`.
Alternatively, to compare directories, I would use `--dry-run --verbose --recursive --checksum --itemize-changes --delete`, or `-nvrci --delete` for short.

- `--archive`/`-a` equivalent to `-rlptgoD` (no `-A`, `-X`, `-U`, `-N`, `-H`).
	- `--recursive`/`-r`: recurse into directories.
	- `--links`/`-l`: copy symlinks as symlinks.
	- `--perms`/`-p`: preserve permissions.
	- `--times`/`-t`: preserve modification times.
	- `--group`/`-g`: preserve group.
	- `--owner`/-`o`: preserve owner (super-user only).
	- `-D`: same as `--devices --specials`.
		- `--devices`: preserve device files (super-user only).
		- `--specials`: preserve special files.
	- `--acls`/`-A`: preserve ACLs (implies `--perms`).
	- `--xattrs`/`-X`: preserve extended attributes.
	- `--atimes`/`-U`: preserve access (use) times.
	- `--crtimes`/`-N`: preserve create times (newness).
	- `--hard-links`/`-H`: preserve hard links.
- `--delete`: delete extraneous files from destination (i.e. make source and destination symmetrical, rather than default "source a subset of destination").
- `--compress`/`-z` compress file data during the transfer.
- `-P`: equivalent to `--partial --progress`.
	- `--partial`: keep partially transferred files.
	- `--progress`: print information showing the progress of the transfer.
- `--checksum`/`-c`: skip files based on checksum, rather than modification time and size.
	- Note that this affects the pre-transfer "does this file need to be sent?" check; any files `rsync` actually transfers are always checksummed.
- `--dry-run`/`-n`: don't actually change anything.
- `--itemize-changes`/`-i`: summarize changes to files; see notes on output format below.
- `--verbose`/`-v`: increase verbosity.
- `--info=help`: see all available flag names.
- `--info=progress2`: total transfer progress.
- `--remote-option=`/`-M`: apply an option only to the remote side (for a local transfer, the destination is the "remote").
- `--debug=`: `help`, `filter`.

```bash
# This would transfer all files matching the pattern `*.c` from the current directory to the directory `src` on the machine `foo`.
# Note that the expansion of wildcards on the command line (`*.c`) into a list of files is handled by the shell before it runs rsync and not by rsync itself.
rsync *.c foo:src/
```

```bash
# This would recursively transfer all files from the directory `src/bar` on the machine `foo` into the `/data/tmp/bar` directory on the local machine.

rsync -r foo:src/bar /data/tmp
```

```bash
# A trailing slash on the source changes this behavior to avoid creating an additional directory level at the destination.

rsync -r foo:src/bar/ /data/tmp
```

```bash
# You can think of a trailing `/` on the source as meaning "copy the contents of this directory" as opposed to "copy the directory by name",
# but in both cases the attributes of the containing directory are transferred to the containing directory on the destination.
# In other words, each of the following commands copies the files in the same way, including their setting of the attributes of `/dest/foo`.

rsync -a /src/foo /dest
rsync -a /src/foo/ /dest/foo
```

```bash
# When you want to copy a directory to a different name, use a trailing slash on the source directory to put the contents of the directory into any destination directory you like.

rsync foo/ bar/
```

#### `--itemize-changes` Output
The output of `--itemize-changes` should be the same between a dry and real run,
and equivalent to specifying `--out-format='%i %n%L'`.
The specifier `%i` corresponds to 11 characters `YXcstpoguax`:

- `Y`: type of the update:
	- `<`: file is being **sent** to the remote.
	- `>`: file is being **received** from the remote.
	- `c`: a (local?) change (e.g. symlink) or creation (e.g. directory).
	- `h`: item is a hard link.
	- `.`: item is not being updated, but attributes may be modified.
	- `*`: rest of the output contains a message (e.g. `deleting  `).
- `X`: file-type: regular `f`ile, `d`irectory, sym`L`ink, `D`evice, or `S`pecial file (e.g. named socket).
- `c`: checksum of a regular file (requires `--checksum`), or that a symlink, device, or special file has a changed value.
- `s`: size of a regular file.
- `t`: modification time (requires `--times`), or `T` meaning that the modification time will be updated to the transfer time.
- `p`: permissions.
- `o`: owner.
- `g`: group.
- `u|n|b`: "use"/access time (requires `--atimes`), "newness"/create time (requires `--crtimes`), or both.
- `a`: ACL information.
- `x`: extended attributes.

For the attributes (everything following `YX`):

- `.`: attribute unchanged.
- `+`: newly created.
- ` `: all attributes unchanged (all dots turn to spaces).
- `?`: unknown change (remote rsync is old).

#### Filtering
TODO

### Rclone
- TODO

### GNU Make
- https://www.gnu.org/software/make/manual/html_node/index.html
- [Automatic Variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)

### Other References
- [GNU `make` automatic variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html).
- [Trailing slashes on GNU programs](https://www.gnu.org/software/coreutils/manual/html_node/Trailing-slashes.html).
- [Bash manual](https://www.gnu.org/software/bash/manual/).
	- [Bash quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html).
