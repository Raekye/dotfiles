## Package Managers
- [DNF and APT command equivalents](https://docs.fedoraproject.org/en-US/quick-docs/dnf-vs-apt/).

	Additionally, to show information about a package: `dnf info <package>` or `apt-cache show <package>`.

### `dnf`
- [Upgrading Fedora Using DNF System Plugin](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/).
	- [Fedora PGP Keys](https://fedoraproject.org/security).

	```bash
	dnf upgrade --refresh
	reboot now
	dnf install dnf-plugin-system-upgrade
	dnf system-upgrade download --releasever=40
	dnf system-upgrade reboot
	dnf autoremove
	```

### `rsync`
Flags I usually want: `--recursive --times --compress --partial --info=progress2`.

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
- `--delete`: delete extraneous files from dest dirs.
- `--compress`/`-z` compress file data during the transfer.
- `-P`: equivalent to `--partial --progress`.
	- `--partial`: keep partially transferred files.
	- `--progress`: print information showing the progress of the transfer.
- `--verbose`/`-v`: increase verbosity.
- `--info=help`: see all available flag names.
- `--info=progress2`: total transfer progress.

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

## Make
- [Automatic Variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html)

## Other References
- [GNU `make` automatic variables](https://www.gnu.org/software/make/manual/html_node/Automatic-Variables.html).
- [Trailing slashes on GNU programs](https://www.gnu.org/software/coreutils/manual/html_node/Trailing-slashes.html).
- [Bash manual](https://www.gnu.org/software/bash/manual/).
	- [Bash quoting](https://www.gnu.org/software/bash/manual/html_node/Quoting.html).
